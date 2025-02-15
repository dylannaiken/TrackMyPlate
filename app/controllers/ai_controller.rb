class AiController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def generate
    prompt = params[:prompt]

    uri = URI("https://api.openai.com/v1/chat/completions")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{ENV['OPENAI_ACCESS_TOKEN']}"
    })

    request.body = {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: prompt }],
      temperature: 0.7
    }.to_json

    response = http.request(request)
    result = JSON.parse(response.body)

    render json: result
  end
end
