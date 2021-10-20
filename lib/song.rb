require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end

  def self.all
    @@all
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.create_by_name(name)
    # song = self.new 
    song = self.create
    song.name = name 
    # self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if !(self.find_by_name(name))
      self.create_by_name(name)
    end
    self.find_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(song_mp3_format)
    data = song_mp3_format.split(" - ")
    artist = data[0]
    name = data[1].delete_suffix(".mp3")
    song = self.new
    song.artist_name = artist
    song.name = name
    song.save
    song
  end
  
  def self.create_from_filename(song_mp3_format)
    data = song_mp3_format.split(" - ")
    artist = data[0]
    name = data[1].delete_suffix(".mp3")
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
