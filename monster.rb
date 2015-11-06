class Monster
  attr_reader :name, :actions
  
  def initialize(name)
    @name = name
    @actions = {
      screams: 0,
      scares: 0,
      run: 0,
      hide: 0
      }
  end
  
  def say(&block)
    print "#{name} says... "
    yield
  end
  
  def scream(&block)
    actions[:screams] += 1
    print "#{name} screams! "
    yield
  end
  
  def scares(&block)
    actions[:scares] += 1
    print "#{name} scares you!"
    yield
  end
  
  def run(&block)
    actions[:run] += 1
    print "#{name} runs! "
    yield
  end
  
  def hide(&block)
    actions[:hide] += 1
    print "#{name} hides! "
    yield self if block_given?
  end
  
  def print_scoreboard
    puts "--------" 
    puts "#{name} scoreboard"
    puts "--------" 
    puts "- Screams: #{actions[:screams]}"
    puts "- Scares: #{actions[:scares]}"
    puts "- Runs: #{actions[:run]}"
    puts "- Hides: #{actions[:hide]}"
  end
  
end

monster = Monster.new("Fluffy")
monster.say { puts "Welcome to my home." }
puts monster.actions

monster.scream do
  puts "BOO!"
  end
  
  
monster.scares do
  puts " Go away!!"
  end


monster.run do
  puts "Going to get you!!"
  end


monster.hide do |monster|
  puts "Runs and hides!"
  end

monster.print_scoreboard
