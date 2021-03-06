# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation
  has_many :groups, dependent: :destroy
  
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :lastname, presence: true, length: { maximum: 50 }
  validates :firstname, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
 
  def fullname
    self.firstname + " " + self.lastname
  end


  private
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
