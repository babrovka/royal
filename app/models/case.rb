class Case < ActiveRecord::Base
  attr_accessible :text, :title, :short_description, :image, :seo_url, :seo_title, :seo_description

  has_and_belongs_to_many :products
  has_many :consultations
  has_attached_file :image, styles: {medium: "940x380#", banner: "620x220#"}
  
  extend FriendlyId
  friendly_id :seo_url, use: :slugged
end
