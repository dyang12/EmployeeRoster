class Employee < ActiveRecord::Base
  attr_accessible :name, :email, :phone_number, :admin, :session_token, :manager_id
  validates :name, :email, :phone_number, :session_token, :presence => true
  validates :email, :phone_number, :session_token, :uniqueness => true
  after_initialize :ensure_session_token
  
  belongs_to :manager,
    :class_name => "Employee",
    :primary_key => :id,
    :foreign_key => :manager_id
  
  has_many :employees,
    :class_name => "Employee",
    :primary_key => :id,
    :foreign_key => :manager_id
    
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def reset_session_token!
    @session_token = self.class.generate_session_token
    self.save!
  end
  
  private
  def ensure_session_token
    if self.session_token.length == 0 
      self.session_token = self.class.generate_session_token
    end
  end
end
