class TestClass
  attr_accessor :names

  # Create the object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")},. Come back soon!"
    else
      puts "Goodbye #{names}. Come back soon."
    end
  end

  # Write poem about you
  def write_poem
    if @names.nil?
      print "I don't now your name!"
    elsif @names.respond_to?("each")
      @names.each do |name|
        puts "Poem for #{name}!"
      end
    else
      print "Poem for #{@names}!"
    end
  end

end

if __FILE__ == $0
  mg = TestClass.new
  mg.say_hi
  mg.say_bye

  #Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Oleg"]
  mg.say_hi
  mg.say_bye

  #Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye

  #Get poem
  mg.names = nil
  mg.write_poem
end