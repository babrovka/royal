class Case < ActiveRecord::Base
  attr_accessible :text, :title, :short_description, :image
  has_and_belongs_to_many :products
  has_many :consultations
  has_attached_file :image, styles: {medium: "940x380#"}
end
