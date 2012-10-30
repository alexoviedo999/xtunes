# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  song_id    :integer
#

class Purchase < ActiveRecord::Base
  attr_accessible :price, :song_id
  belongs_to :user
  belongs_to :song

  validates :user, :song, :price, :presence => true

end
