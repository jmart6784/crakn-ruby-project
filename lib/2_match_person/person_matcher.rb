class PersonMatcher
  attr_reader :people

  def initialize(*people)
    @people = people
  end

  def full_name(obj)
    [obj[:first_name], obj[:middle_name], obj[:last_name]].compact.join(" ")
  end

  def find_match(person_obj)
    person_obj.transform_values {|val| val.downcase!}

    results = []

    if person_obj.size == 3
      reg = /#{person_obj[:first_name]}|#{person_obj[:middle_name]}|#{person_obj[:last_name]}/
    elsif person_obj.size == 2
      keys = person_obj.map { |k, v| k }
      reg = /#{person_obj[keys[0]]}|#{person_obj[keys[1]]}/
    elsif person_obj.size == 1
      keys = person_obj.map { |k, v| k }
      reg = /#{person_obj[keys[0]]}/
    end

    @people[0].each do |person|
      person.transform_values {|val| val.downcase!}

      exact_match = false

      if full_name(person) === full_name(person_obj)
        results = [] unless full_name(results[0]) === full_name(person_obj)
        results << person
        exact_match = true
      end

      unless exact_match
        if full_name(person).match?(reg)
          results << person
        end
      end
    end
    results
  end
end

# Rspec tests raise NoMethodError: undefined method `transform_values' for [:first_name, "Dwight"]:Array

# people = [
#   { first_name: 'Dwight', middle_name: 'Glenn', last_name: 'Appleton' },
#   { first_name: 'Dwight', middle_name: 'Gerald', last_name: 'Appleton' },
#   { first_name: 'Autumn', middle_name: 'Harley', last_name: 'Poole' },
#   { first_name: 'Noah', middle_name: 'Zaire', last_name: 'Waters' }
# ]

# pm = PersonMatcher.new(people)

# puts pm.find_match(first_name: 'Dwight', last_name: 'Appleton').inspect

# puts "----------------------------------------------"

# puts pm.find_match(first_name: 'Dwight', middle_name: 'Gerald', last_name: 'Appleton').inspect