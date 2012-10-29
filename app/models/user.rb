# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password        :string(255)
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :role

  before_save :default_role_to_member

  has_many :purchases
  has_many :songs, :through => :purchases

  validates_uniqueness_of :email

  def admin?
    role? :admin
  end

  def member?
    role? :member
  end

  def role?(symbol)
    role == symbol.to_s
  end

  private

  def default_role_to_member
    role ||= :member
  end
end
