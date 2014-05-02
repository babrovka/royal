class Partner < ActiveRecord::Base
  attr_accessible :address, :city_id, :title
  belongs_to :city
end
