class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :check,
                  :name, :phone, :assignment, :company, :address, :work_phone, :fax,
                  :work_email, :from, :comment, :education
  
  cattr_accessor :current_user
  
  has_one :cart
  has_and_belongs_to_many :events, :uniq => true
  has_many :orders
  
  validates :name, :email, :password, :presence => true
  
  validates_confirmation_of :password, :on => :create
  validates_confirmation_of :password, :on => :update
  
  ROLES = %w[professional dealer1 dealer2 dealer3]
end
