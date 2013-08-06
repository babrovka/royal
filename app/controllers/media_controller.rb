class MediaController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").limit(3)
    @albums = Album.all
    @videos = Video.all
    @publications = Publication.all
  end
  
  def album
    @album = Album.find(params[:id])
  end
  
end
