class Question < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :text
  validates :name, :phone, :text, :presence => true
  validates :email, :presence => true, 
                      :length => {:minimum => 3, :maximum => 254},
                      :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
end
