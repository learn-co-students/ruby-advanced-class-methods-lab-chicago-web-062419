require 'pry'
class Song
  attr_accessor :name, :artist_name, :save
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    # Song.new == self
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    # binding.pry
    song.name = name
    song
    # binding.pry
    # song.name
  end

  def self.create_by_name(name)
    song = self.create
    # binding.pry
    song.name = name
    song
  end

  def self.find_by_name(song)
    self.all.find {|track| track.name == song}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
    # binding.pry
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    # binding.pry
    song = self.new
    song.artist_name = file_array[0]
    song.name = file_array[1].chomp('.mp3')
    song
    # binding.pry
  end

  def self.create_from_filename(file)
    file_array = file.split(" - ")
    # binding.pry
    song = self.create
    # song_name = song.split("")
    song.artist_name = file_array[0]
    song.name = file_array[1].chomp('.mp3')
    song
  end

  def self.destroy_all
    @@all = []
  end

end
