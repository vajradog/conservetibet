require 'digest/sha1'
class User < ActiveRecord::Base
	attr_accessible :login, :password, :password_confirmation


  validates_presence_of :login
  validates_confirmation_of :password
  attr_accessor :password
 
  before_save :encrypt_password
 
  def self.authenticated?(login, password)
    pwd = Digest::SHA1.hexdigest(password.to_s)
    User.find_by_login_and_hashed_password(login, pwd)
  end
 
  private
 
  def encrypt_password
    unless self.password.blank?
      self.hashed_password = Digest::SHA1.hexdigest(self.password.to_s)
      self.password = nil
    end
    return true 
  end
end