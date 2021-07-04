require "pry"
class Owner
  @@all =[]

  attr_accessor :pets
  attr_reader :name, :species 

  def initialize(name)
    @species = "human" 
    @name = name 
    @@all << self
  end
   
  

  def say_species 
    "I am a #{self.species}."
    # binding.pry
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end  

  def self.reset_all
    @@all.clear
  end

  
  def cats
    Cat.all.select do |cat|
      cat.owner == self
      # binding.pry
    end
  end

  def dogs

    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end
    
  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats
     pets.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"
     end 
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end 


end




  



 



