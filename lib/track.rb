class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

# Note we use a seperate matches? method here and not just write it all in the diary method referring to title and contents, because of OOP principles...
# When we use the class object with another class, we don't really want to depend too much on the variables in the child class
# Also, if we were working on the classes independetly and changed the variable names, we wouldn't want it to break every class dependent on it.
  def matches?(keyword) 
    "#{@title} #{@artist}".downcase.include?(keyword.downcase)
  end
end