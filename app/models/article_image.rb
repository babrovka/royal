class ArticleImage < ActiveRecord::Base
  attr_accessible :image, :article_id
  belongs_to :article
  has_attached_file :image, :styles => { :medium => "x400>", :thumb => "x180" }
  validates :image, :presence => true
end
