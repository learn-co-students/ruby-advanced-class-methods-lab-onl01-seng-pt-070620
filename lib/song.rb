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
    new_song = self.new
    new_song.save
    new_song
  end
  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name
    song
  end
  def self.create_by_name(new_name)
    song = self.create
    song.name = new_name 
    song 
  end
  def self.find_by_name(name_check)
    self.all.find {|song| song.name == name_check} 
    
  end
  def self.find_or_create_by_name(new_name)
    self.find_by_name(new_name) || self.create_by_name(new_name)
  end
  def self.alphabetical
      self.all.sort_by { |song| song.name }
  end
  def self.new_from_filename(filename) 
      artist_title = filename.chomp!(".mp3").split(" - ")
      artist = artist_title[0]
      title = artist_title[1]
      
      song = self.create
      song.name = title
      song.artist_name = artist
      song
  end 
  def self.create_from_filename(filename) 
      artist_title = filename.chomp!(".mp3").split(" - ")
      artist = artist_title[0]
      title = artist_title[1]
      
      song = self.create
      song.name = title
      song.artist_name = artist
      song
  end 
  def self.destroy_all
    @@all = []
  end
end
