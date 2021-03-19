
require 'pry'

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name = " ", species = "human")
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all 
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self, )
  end

  def buy_dog(name)
    Dog.new(name, self, )
  end

  def walk_dogs
    Dog.all.each do |dog| 
      dog.owner == self ? dog.mood = "happy" : dog
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.owner == self ? cat.mood = "happy" : cat
    end
  end

  def sell_pets
    Cat.all.each {|cat| cat.owner == self ? cat.mood = "nervous" : cat}
    Cat.all.each {|cat| cat.owner == self ? cat.owner = nil : cat}
    Dog.all.each {|dog| dog.owner == self ? dog.mood = "nervous" : dog}
    Dog.all.each {|dog| dog.owner == self ? dog.owner = nil : dog}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end