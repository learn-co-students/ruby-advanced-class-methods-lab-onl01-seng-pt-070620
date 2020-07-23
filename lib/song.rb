require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song = self.new
    @@all << song
    song
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
    # binding.pry
  end
  
  def self.find_by_name(name)
    @@all.find {|n| n.name == name} 
  end
  
  def self.find_or_create_by_name(name)
    self.create_by_name(name) 
    self.find_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    filename = filename.split('.')
    filename.pop #removemp3
    filename = filename.join 
    filename = filename.split('-')
    song.artist_name = filename.first.strip
    song.name = filename.last.strip
    # binding.pry
    return song
  end

  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)  
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end

end
