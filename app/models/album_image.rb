class AlbumImage < ActiveRecord::Base
  attr_accessible :image, :article_id, :title
  belongs_to :album
  has_attached_file :image, :styles => { :medium => "940x626#", :thumb => "220x146#" }
  validates :image, :presence => true
end
