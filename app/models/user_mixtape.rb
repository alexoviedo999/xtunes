# == Schema Information
#
# Table name: user_mixtapes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  mixtape_id :integer
#  permission :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserMixtape < ActiveRecord::Base
  attr_accessible :mixtape_id, :permission, :user_id, :user

  Permissions = {:own => 0, :edit => 10, :listen => 100}

  Permissions.each do |action, level|
    define_method "#{action}able?" do
      true if self.permission <= Permissions[action.to_sym]
    end
  end

  belongs_to :user
  belongs_to :mixtape

  def set_permission(permission)
    self.permission = Permissions[permission]
    self.save
  end
end
