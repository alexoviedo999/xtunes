class Song < ActiveRecord::Base
  attr_accessible :name, :artist, :price, :audiofile, :album
  has_and_belongs_to_many :artists
  mount_uploader :audiofile, AudiofileUploader
end
