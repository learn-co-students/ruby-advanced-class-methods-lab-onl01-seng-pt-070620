require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = Song.new 
    song.save 
    song 
  end
  
  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name 
    song
  end
  
  def self.create_by_name(song_name)
    song = Song.new 
    song.name = song_name 
    song.save
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create_by_name(song_name)
  end  
  
  def  self.alphabetical 
    @@all.sort_by do |song|
      song.name 
    end
  end
  
  def self.new_from_filename(file_name)
    #binding.pry 
    song = self.new 
    song.name = file_name.split(" - ")[1].chomp(".mp3")
    song.artist_name = file_name.split(" - ")[0]
    song
  end   
  
  def self.create_from_filename(file_name)
    song = self.new 
    song.name = file_name.split(" - ")[1].chomp(".mp3")
    song.artist_name = file_name.split(" - ")[0]
    @@all << song
  end
  
  def self.destroy_all 
    @@all.clear
  end  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
end
