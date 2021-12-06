require 'date'

class CalculateAge
  def self.calculate(age_at_birth, age_at_death)
    age_in_seconds = age_at_death.to_time.to_i - age_at_birth.to_time.to_i

    time = Time.at(age_in_seconds)
    time.year - 1970 + (time.yday / 365.25).floor
  end
end