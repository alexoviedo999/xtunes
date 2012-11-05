# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  audiofile  :string(255)
#  artist     :string(255)
#  album      :string(255)
#  genre      :string(255)
#

class Song < ActiveRecord::Base
  attr_accessible :name, :artist, :price, :audiofile, :album, :genre
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :genres
  has_many :purchases
  has_many :users, :through => :purchases
  has_many :mixtape_songs
  has_many :mixtapes, :through => :mixtape_songs
  mount_uploader :audiofile, AudiofileUploader
  accepts_nested_attributes_for :purchases
end
