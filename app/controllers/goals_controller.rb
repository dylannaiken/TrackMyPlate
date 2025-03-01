class GoalsController < ApplicationController
  before_action :authenticate_user! # pour s'assurer que l'utilisateur est connecté
  before_action :set_goal, only: [:show, :edit, :update]

  # Action pour l'affichage du profil (montrer l'objectif)
  def show
    # @goal est déjà défini dans set_goal
  end

  # Action pour l'édition du profil (modifier l'objectif)
  def edit
    # @goal est déjà défini dans set_goal
  end

  def update
    if @goal.update(goal_params)
      respond_to do |format|
        format.html { redirect_to user_profile_path(current_user.id), notice: 'Profil mis à jour avec succès.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js { render :edit }
      end
    end
  end
  private

  # Set goal pour récupérer l'objectif de l'utilisateur connecté
  def set_goal
    @goal = current_user.goal # Assure-toi que l'utilisateur a bien un objectif associé
  end

  # Permet de sécuriser les paramètres du formulaire
  def goal_params
    params.require(:goal).permit(:goal_type, :target_weight, :daily_calorie_target, :protein_target, :carbs_target, :fat_target, :start_date, :end_date, :target_water)
  end
end
