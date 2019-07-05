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
    # initializes a song
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    # song = self.create
    # song.name = name
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name_select)
    self.all.find do |x|
      x.name.include?(name_select)
    end
  end
  
  def self.find_or_create_by_name(name_select)
    self.find_by_name(name_select) || self.create_by_name(name_select)
  end
  
 
  def self.alphabetical
    self.all.sort_by do |x|
      x.name
    end
  end

  def self.new_from_filename(filename)
    array = filename.split(".mp3")
    array = array[0].split(" - ")
    artist_name = array[0]
    song_name = array[1]
    # binding.pry
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(".mp3")
    array = array[0].split(" - ")
    artist_name = array[0]
    song_name = array[1]
    # binding.pry
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

# p song = Song.new_by_name("Yolololol")
# p song.name
