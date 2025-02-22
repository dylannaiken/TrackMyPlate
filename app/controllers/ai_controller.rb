class AiController < ApplicationController
  before_action :authenticate_user!

  # Action pour générer des suggestions de repas en fonction des calories restantes
  def meal_suggestions
    # Récupérer les calories restantes depuis le formulaire
    remaining_calories = params[:remaining_calories].to_i

    # Créer une instance du client OpenAI
    client = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY'])

    # Créer le prompt à envoyer à l'API OpenAI
    prompt = "I have #{remaining_calories} calories left for the day. Suggest a healthy meal."

    # Appel à l'API OpenAI pour générer une suggestion de repas
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4", # Le modèle GPT-4 pour générer la réponse
        messages: [
          { role: "user", content: prompt }
        ]
      }
    )

    # Extraire la suggestion de repas de la réponse de l'API
    @suggestion = chatgpt_response["choices"].first["message"]["content"]

    # Vous pouvez aussi ajouter un enregistrement de cette suggestion dans la base de données si nécessaire
    # Exemple : Recipe.create(name: "Generated Meal", ingredients: @suggestion)

    # Affichage de la suggestion dans la vue associée
    render :show # S'assure que la vue "show.html.erb" est rendue
  end
end
