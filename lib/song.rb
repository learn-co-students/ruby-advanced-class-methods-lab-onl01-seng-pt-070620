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
  song.save
  song
end 

  def self.new_by_name(name)
  song = self.new
  song.save
  song.name = name 
  song
end 

  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    song.save # or @all << self 
    song
end 

  def self.find_by_name(name)
  @@all.find{|song| song.name == name}
  # use the class variable to find the song name 
end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #This method will accept a string name for a song and either return a matching song instance with that name or create a new song with the name and return the song instance.
end

  def self.alphabetical 
    self.all.sort_by { |song| song.name}
        #returns all the songs in ascending (a-z) alphabetical order.
        #using the class itself to sort all song names in order
end

def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end

 def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song.save #or @@all << self 
    song
  end
  
  
   def self.destroy_all
    @@all.clear
    #uses the class variable itself to clear/delete all previous song instances
  end
end