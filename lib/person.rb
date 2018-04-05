require 'pry'

class Person
  attr_reader :name, :happiness, :hygiene
  attr_accessor :bank_account

  def test_limit(points)
    if points > 10
      return 10
    elsif points < 0
      return 0
    else
      return points
    end
  end

  def initialize(name, bank_account = 25, happiness = 8, hygiene = 8)
    @name = name
    @bank_account = bank_account
    @happiness = happiness
    @hygiene = hygiene
  end

  def happiness=(happy_points)
    @happiness = test_limit(happy_points)
  end

  def hygiene=(hygiene_points)
    @hygiene = test_limit(hygiene_points)
  end

  def clean?
    @hygiene > 7
  end

  def happy?
    @happiness > 7
  end

  def get_paid(salary)
    @bank_account += salary
    "all about the benjamins"
  end

  def take_bath
    self.hygiene=(@hygiene += 4)
    "♪ Rub-a-dub just relaxing in the tub ♫"
  end

  def work_out
    self.happiness=(@happiness += 2)
    self.hygiene=(@hygiene -= 3)
    "♪ another one bites the dust ♫"
  end

  def call_friend(friend)
    self.happiness=(@happiness += 3)
    happiness=(friend.happiness += 3)

    "Hi #{friend.name}! It's #{@name}. How are you?"
  end

  def start_conversation(person_start, topic)
    if topic == "politics"
      self.happiness=(@happiness -= 2)
      person_start.happiness=(person_start.happiness -= 2)
      "blah blah partisan blah lobbyist"
    elsif topic == "weather"
      self.happiness=(@happiness += 1)
      person_start.happiness=(person_start.happiness += 1)
      "blah blah sun blah rain"
    else
      "blah blah blah blah blah"
    end
  end
end

# binding.pry
#
# "hello"
