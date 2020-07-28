require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
    #binding.pry
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #if self.find_by_name(name) == false
    #  self.create_by_name(name)
    #end
    #binding.pry
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    #binding.pry
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(name)
    #name = ""
    artist_name = ""
    temp_name =  ""
    song = self.new
    song.artist_name = name.split(" - ")[0].strip
    temp_name = name.split("-")[1].strip
    song.name = temp_name.split(".")[0]
    #binding.pry
    song
  end

  def self.create_from_filename(name)
    #name = ""
    artist_name = ""
    temp_name =  ""
    song = self.new
    song.artist_name = name.split(" - ")[0].strip
    temp_name = name.split("-")[1].strip
    song.name = temp_name.split(".")[0]
    #binding.pry
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
