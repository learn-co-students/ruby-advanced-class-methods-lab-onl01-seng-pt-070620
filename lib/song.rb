class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  def self.create
    song=self.new
    @@all << song  
    #self.all << song
    song
  end
  def self.new_by_name (song_name)
    song=self.new
    song.name=song_name
    song
  end
  def self.create_by_name(song_name)
    #song=self.new
    #@@all << song
    song=self.create
    song.name=song_name
    song
  end
  def self.find_by_name (song_name)
   self.all.find {|song| song.name==song_name}
  end
  def self.find_or_create_by_name (song_name)
   song_already_exist = self.find_by_name(song_name)
   if song_already_exist
     song_already_exist
   else
     self.create_by_name(song_name)
    end
  end
  def self.alphabetical
    sorted_songs=self.all.sort_by {|song| song.name}
    #sorted_songs=self.all.sort {|song1, song2| song1.name <=> song2.name}
    sorted_songs
  end
  
  def self.new_from_filename (filename)
   song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
