require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
      if contestant["status"] == 'Winner'
        contestant_name = contestant['name']
        return contestant_name.split.first
      end
    end
  end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  contestants_hometown = 0
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        contestants_hometown += 1
      end
    end
  end
  contestants_hometown
end

def get_occupation(data, hometown)
  contestants_hometown = []
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        occupation = contestant["occupation"]
        contestants_hometown << occupation
      end
    end
  end
  contestants_hometown[0]
end

def get_average_age_for_season(data, season)
  contestants_ages = []
  data.each do |seasons, contestants|
    if seasons == season
      contestants.each do |contestant|
        contestants_ages << contestant["age"].to_f
      end
    end
  end
  number_of_contestants = contestants_ages.length 
  total_ages = contestants_ages.inject(0, :+)
  average_age = total_ages/number_of_contestants
  average_age.to_i
end
