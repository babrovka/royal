class Article < ActiveRecord::Base
  attr_accessible :date, :text, :title, :article_images_attributes, :short_text
  has_many :article_images
  accepts_nested_attributes_for :article_images, :allow_destroy => true
  validates :title, :date, :text, :presence => true
  just_define_datetime_picker :date, :add_to_attr_accessible => true
  validates :text, :date, :title, :short_text, :presence => true
  validates :short_text, :length => { :maximum => 150 }
  default_scope order('date DESC')
end
