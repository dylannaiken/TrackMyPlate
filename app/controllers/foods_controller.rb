class FoodsController < ApplicationController
  before_action :set_meal, only: [:new, :create]

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @daily_log = current_user.daily_logs.find(params[:daily_log_id])
    @meal = @daily_log.meals.find(params[:meal_id])
    @food = Food.new
  end

  def create
    Rails.logger.debug("Meal ID from Params: #{params[:meal_id]}")
    @food = @meal.foods.build(food_params)
    if @food.save
      redirect_to daily_log_meal_path(@daily_log, @meal), notice: "Aliment ajouté avec succès."
      client = OpenAI::Client.new
      chatgpt_response = client.chat(parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: "Tu es un expert en nutrition. Ta tâche est de calculer les valeurs nutritionnelles d'un repas. Voici le repas : #{@food.food_name}, #{@food.serving_size}#{@food.serving_unit}. Renvoie uniquement un Hash Ruby avec les valeurs arrondies et dans cet ordre exact : { calories: ?, protein: ?, carbs: ?, fat: ? }. Assure-toi que les nombres sont toujours entiers et ne contiennent jamais de décimales."}]
      })
      @content = chatgpt_response["choices"][0]["message"]["content"]

      @data = eval(@content)

      @nutrition = Nutrition.create(food: @food, calories: @data[:calories], protein: @data[:protein], carbs: @data[:carbs], fat: @data[:fat])

    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_meal
    @daily_log = current_user.daily_logs.find(params[:daily_log_id])
    @meal = @daily_log.meals.find(params[:meal_id])
  end

  def food_params
    params.require(:food).permit(:food_name, :serving_size, :serving_unit, :food_id)
  end
end
