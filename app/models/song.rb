class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.each do |song|
      if song.slug == slug
        return song
      end
    end
  end

end

# rspec spec/models/02_song_spec.rb
