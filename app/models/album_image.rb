class AlbumImage < ActiveRecord::Base
  attr_accessible :image, :article_id, :title
  belongs_to :album
  has_attached_file :image, :styles => { :medium => "600x", :thumb => "230x150#" }
  validates :image, :presence => true
end
