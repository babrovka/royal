class City < ActiveRecord::Base
  attr_accessible :title, :partners_attributes
  has_many :events
  has_many :partners
  scope :with_events, includes(:events).where("events.city_id != 0")
  accepts_nested_attributes_for :partners, :allow_destroy => true
  validates :title, presence: true, uniqueness: true
end
