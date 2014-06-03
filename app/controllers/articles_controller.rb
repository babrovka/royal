class ArticlesController < ApplicationController

  before_filter :collection

  def index
  end

  def show
    @article = Article.where(id: params[:id]).first

    # вычленяем текущую новость,чтобы она не висела в виджете новостей
    @articles = collection.where('id <> ?', @article.id).limit(3)
  end

  private

  def collection
    @articles ||= Article.order('date ASC')
  end
end
