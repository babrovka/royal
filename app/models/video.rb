class Video < ActiveRecord::Base
  attr_accessible :title, :youtube, :brand_id
  belongs_to :brand
end
