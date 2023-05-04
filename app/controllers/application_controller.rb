class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/" do
    articles = Article.all
    articles.to_json(include: [{ category: { only: :name } }, { country: { only: :name } }])
  end

  get "/countries" do
    countries = Country.all
    countries.to_json(include: :articles)
  end

  get "/categories" do
    categories = Category.all
    # p categories
    categories.to_json(include: :articles)
  end

  get "/articles" do
    articles = Article.where(["country_id = '%s' and category_id = '%s'", params[:country_id], params[:category_id]])
    # binding.pry
    articles.to_json
  end

  post "/new_article" do
    # grab body and validate
    # binding.pry
    article = Article.create(params)
    article.to_json
  end
end
