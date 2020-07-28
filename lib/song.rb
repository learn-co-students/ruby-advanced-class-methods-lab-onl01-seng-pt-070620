require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(newName)
    song = self.new 
    song.name = newName
    song
  end
  
  def self.create_by_name(newName)
    song = self.new 
    song.name = newName
    @@all << song 
    song
  end
  
  def self.find_by_name(search_string)
    @@all.each do |all_song|
      return all_song if all_song.name == search_string
    end
    nil
  end
  
  def self.find_or_create_by_name(name_string)
    find_by_name(name_string) || create_by_name(name_string)
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end
  
  def self.new_from_filename(fileString)
    new_artist = fileString.split("-")[0].to_s.strip
    new_name = fileString.split("-")[1].to_s.chomp(".mp3").strip
    #binding.pry
    # newsong = create_by_name(new_name)
    # newsong.artist_name = new_artist
    new_song = self.new
    new_song.name = new_name
    new_song.artist_name = new_artist
    @@all << new_song
    new_song
  end
   
  def self.create_from_filename(fileString)
     new_artist = fileString.split("-")[0].to_s.strip
    new_name = fileString.split("-")[1].to_s.chomp(".mp3").strip
    #binding.pry
    # newsong = create_by_name(new_name)
    # newsong.artist_name = new_artist
    new_song = self.new
    new_song.name = new_name
    new_song.artist_name = new_artist
    @@all << new_song
    new_song
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
