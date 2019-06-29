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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.uniq.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    splitfile = filename.split("-")
    songnamemp3 = splitfile[1].split(".")
    songname = songnamemp3[0].strip

    artistfound = splitfile[0].strip

    new_song = Song.create_by_name(songname)
    new_song.artist_name = artistfound
    new_song
    
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
  end


  def self.destroy_all
    self.all.clear
  end
end
