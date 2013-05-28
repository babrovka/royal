class Event < ActiveRecord::Base
  attr_accessible :title, :date, :text, :city_id
  has_and_belongs_to_many :users, :uniq => true
  belongs_to :city
end
