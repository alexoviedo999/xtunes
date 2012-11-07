# == Schema Information
#
# Table name: mixtape_songs
#
#  id         :integer          not null, primary key
#  mixtape_id :integer
#  song_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MixtapeSong < ActiveRecord::Base
  attr_accessible :mixtape_id, :song_id

  belongs_to :mixtape
  belongs_to :song
end
