require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create     ##Song.create 
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(nameunsanitized)
    song = self.new
    song.sanitizename(nameunsanitized)
    
    ##namesanitized = nameunsanitized.gsub(/.mp3|/, "").split("-")
    ##song = self.new_by_name(namesanitized[1].strip)
    ##song.artist_name = namesanitized[0].strip
    song
  end

  def sanitizename(nameunsanitized)
    namesanitized = nameunsanitized.gsub(/.mp3|/, "").split("-")
    self.name = namesanitized[1].strip
    self.artist_name = namesanitized[0].strip
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
