class PublicationsController < ApplicationController
  def index
    @publications = Publication.all
    @articles = Article.order("created_at DESC").limit(3)
  end
end
