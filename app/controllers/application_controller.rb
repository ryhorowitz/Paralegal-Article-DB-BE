class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/" do
    # { message: "Good luck with your project!" }.to_json
    # get all articles
    articles = Article.all

    articles.to_json(include: [{ category: { only: :name } }, { country: { only: :name } }])
  end
end
