class Event < ActiveRecord::Base
  attr_accessible :title, :date, :text
  has_and_belongs_to_many :users, :uniq => true
end
