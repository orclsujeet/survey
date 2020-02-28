class User < ActiveRecord::Base
  has_secure_password
  validates :mobile, presence: true, uniqueness: true 
end
