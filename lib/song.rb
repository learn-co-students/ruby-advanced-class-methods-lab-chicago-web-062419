require 'pry'

class Song
  attr_accessor :name, :artist_name
  attr_reader :save
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(names)
    self.all.find do |song|
      song.name == names
      # binding.pry
    end
  end

  def self.find_or_create_by_name(names)
    if self.find_by_name(names) == nil 
      self.create_by_name(names)
    else self.find_by_name(names)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
        song.name
    end
  end

  def self.new_from_filename (file)
    file_name_array = file.split(" - ")
    file_song = file_name_array[0]
    new_song = self.new
    new_song.artist_name = file_name_array[0]
    new_song.name = file_name_array[1].chomp(".mp3")
    new_song
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end


end
