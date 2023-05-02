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
    p categories
    categories.to_json(include: :articles)
  end

  post "/" do
    # request object is??? check school docs
    p params
    nil
  end
end
