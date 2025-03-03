class NutritionsController < ApplicationController
  before_action :set_nutrition, only: [:show, :update, :destroy]

  # GET /nutritions
  def index
    @nutritions = Nutrition.all
    render json: @nutritions
  end

  # GET /nutritions/:id
  def show
    render json: @nutrition
  end

  # POST /nutritions
  def create
    @nutrition = Nutrition.new(nutrition_params)

    if @nutrition.save
      render json: @nutrition, status: :created
    else
      render json: @nutrition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nutritions/:id
  def update
    if @nutrition.update(nutrition_params)
      render json: @nutrition
    else
      render json: @nutrition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nutritions/:id
  def destroy
    @nutrition.destroy
    head :no_content
  end

  private

  def set_nutrition
    @nutrition = Nutrition.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Nutrition not found' }, status: :not_found
  end

  def nutrition_params
    params.require(:nutrition).permit(:food_id, :calories, :protein, :carbs, :fat, :fiber, :sugar, :sodium, :cholesterol, additional_nutrients: {})
  end
end
