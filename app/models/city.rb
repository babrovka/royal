class City < ActiveRecord::Base
  attr_accessible :title
  has_many :events
  scope :with_events, includes(:events).where("events.city_id != 0")
end
