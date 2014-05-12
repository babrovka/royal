class Partner < ActiveRecord::Base
  attr_accessible :address, :city_id, :title, :website, :phone, :brand_ids
  belongs_to :city
  has_many :brands
end
