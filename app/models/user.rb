class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  acts_as_authentic
  has_many :receipts
  has_and_belongs_to_many :roles

  def is?(role)
    role = Role.where(:name => role).first
    self.roles.include?(role)
  end
end
