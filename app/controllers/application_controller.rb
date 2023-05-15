class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/countries" do
    countries = Country.all
    countries.to_json(include: :articles)
  end

  post "/new_article" do
    country = Country.find(params[:country_id])

    article = country.articles.create(
      title: params[:title],
      link: params[:link],
      published: params[:published],
      category_id: params[:category_id],
    )
    # article = Article.create(params)

    # return newly created article to_json
  end

  post "/country" do
    country = Country.create(params)
    # send back new country with :articles
    countries = Country.all
    countries.to_json(include: :articles)
  end

  delete "/article/:id" do
    article = Article.find(params[:id])
    article.destroy
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
  end
end
