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
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.save
    s.name = name
    s
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  artist = self.find_by_name(name)
    if artist
      return artist
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  def self.new_from_filename(name)
    parts = name.split(" - ")
    parts[1] = parts[1].chomp(".mp3")
    song = self.new
    song.name = parts[1]
    song.artist_name = parts[0]
    return song
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    return song
  end

  def self.destroy_all
    self.all.clear
  end


end
