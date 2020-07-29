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
  
  
#  instantiates and saves the song, and it returns the new song that was created

 def self.create
   song = Song.new
   song.save
   song
 end 


# instantiates a song with a name property

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end 


# instantiates and saves a song with a name property


  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end 

  
# can find a song present in @@all by name
# returns falsey when a song name is not present in @@all

# solution no.1 - Using lower level abstraction

  def self.find_by_name(name)
    result = nil # maintaining state 
    self.all.each do |song|
      result = song if song.name == name
    end 
    result 
  end 
  
# solution no.2 - Using higher level abstration

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end 
  
# solution no.3 - Using conventional each iteration

  def self.find_by_name(name)
      @@all.each do |song|
        if song.name == name
          return song
        end
      end 
    nil
  end 


# invokes .find_by_name and .create_by_name instead of repeating code
# returns the existing Song object (doesn\'t create a new one) when provided the title of an existing Song
# creates a new Song object with the provided title if one doesn\'t already exist
  
  def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create_by_name(name)
      else 
        self.find_by_name(name)
    end 
  end 
  
  
# returns all the song instances in alphabetical order by song name

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
 

# initializes a song and artist_name based on the filename format

  def self.new_from_filename(filename) 
      artist_song_name = filename.chomp!(".mp3").split(" - ")
      artist = artist_song_name[0]
      song_name = artist_song_name[1]
      
      # make a new instance song
      song = self.new
      # set the properties on the song along with the value
      song.name = song_name
      song.artist_name = artist
      # return the song to collect
      song
  end 

# initializes and saves a song and artist_name based on the filename format

  def self.create_from_filename(filename)
      artist_song_name = filename.chomp!(".mp3").split(" - ")
      artist = artist_song_name[0]
      song_name = artist_song_name[1]
      
      # make a new instance song
      song = self.create
      # save the song instance
      song.save
      # set the properties on the song along with the value
      song.name = song_name
      song.artist_name = artist
      # return the song to collect
      song
  end 


# clears all the song instances from the @@all array

  def self.destroy_all
    self.all.clear
  end 
  

end
