class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  def getArticles
    articles = Article.all
    articles.to_json(include: [{ category: { only: :name } }, { country: { only: :name } }])
  end

  get "/articles" do
    getArticles
  end

  get "/countries" do
    countries = Country.all
    countries.to_json(include: :articles)
  end

  get "/categories" do
    categories = Category.all
    categories.to_json(include: :articles)
  end

  get "/articles/country/category" do
    articles = Article.where(["country_id = '%s' and category_id = '%s'", params[:country_id], params[:category_id]])
    # binding.pry
    articles.to_json
  end

  post "/new_article" do
    article = Article.create(params)
    getArticles
  end

  post "/country" do
    country = Country.create(params)
    countries = Country.all
    countries.to_json(include: :articles)
  end

  delete "/article/:id" do
    article = Article.find(params[:id])
    article.destroy
    getArticles
  end

  patch "/article/:id" do
    article = Article.find(params[:id])
    article.update(
      title: params[:title],
      link: params[:link],
      published: params[:published],
      country_id: params[:country_id],
      category_id: params[:category_id],
    )
    getArticles
  end
end
