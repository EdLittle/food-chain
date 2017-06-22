class FoodChain
  SEQUENCE = %w(fly spider bird cat dog goat cow horse)
  def self.song
    strings = [] 
    (1..SEQUENCE.size).each do |x|
      strings << construct_stanza(SEQUENCE.take(x).reverse)
    end
    strings.join
  end

  def self.construct_stanza(array)
    intro(array.first) +
    middle(array) +
    ending(array)
  end

  def self.intro(animal)
    intro = "I know an old lady who swallowed a #{animal}.\n"
    intro +=  case animal
              when 'spider'
                "It wriggled and jiggled and tickled inside her.\n"
              when 'bird'
                "How absurd to swallow a bird!\n"
              when 'cat'
                "Imagine that, to swallow a cat!\n"
              when 'dog'
                "What a hog, to swallow a dog!\n"
              when 'goat'
                "Just opened her throat and swallowed a goat!\n"
              when 'cow'
                "I don't know how she swallowed a cow!\n"
              else
                ''
              end
  end

  def self.ending(animals)
    return "She's dead, of course!\n" if animals.first == SEQUENCE.last
    "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
  end

  def self.middle(array_of_animals)
    return '' if array_of_animals.size == SEQUENCE.size
    strings = []
    array_of_animals.each_cons(2) do |combination|
      line =  if (combination - %w(spider bird)).empty? 
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
              else
                self.swallow_to_catch(combination)
              end
      strings << line
    end
    strings.join()
  end

  def self.swallow_to_catch(combination)
    return if combination.size != 2
    "She swallowed the #{combination[0]} to catch the #{combination[1]}.\n"
  end
end

puts FoodChain.song
