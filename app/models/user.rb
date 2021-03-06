class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :check,
                  :name, :phone, :assignment, :company, :address, :work_phone, :fax,
                  :work_email, :from, :comment, :education, :region_id, :own_region
  
  cattr_accessor :current_user
  
  has_one :cart
  has_and_belongs_to_many :events, :uniq => true
  has_many :orders
  belongs_to :region
  
  validates :name, :email, :password, :phone, :presence => true, :on => :create

  
  ROLES = %w[professional dealer1 dealer2 dealer3]
end
