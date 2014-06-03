class ArticlesController < ApplicationController


  def index
    @articles ||= Article.paginate(:page => params[:page], :order => 'date ASC', per_page: 10)
  end

  def show
    @article = Article.where(id: params[:id]).first

    # вычленяем текущую новость,чтобы она не висела в виджете новостей
    @articles = Article.order('date ASC').where('id <> ?', @article.id).limit(3)
  end

  private

  def collection
    @articles ||= Article.order('date ASC')
  end
end
