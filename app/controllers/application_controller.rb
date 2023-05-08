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
    # binding.pry
    article = Article.create(params)
    article.to_json
  end

  delete "/article/:id" do
    article = Article.find(params[:id])
    # binding.pry
    article.destroy
    article.to_json
  end

  patch "/article/:id" do
    article = Article.find(params[:id])
    # binding.pry
    article.update(
      title: params[:title],
      link: params[:link],
      published: params[:published],
      country_id: params[:country_id],
      category_id: params[:category_id],
    )
    article.to_json
  end

  post "/country" do
    country = Country.create(params)
    country.to_json
  end
end
