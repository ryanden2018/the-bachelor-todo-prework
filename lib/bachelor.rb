def get_first_name_of_season_winner(data, season)
  data.each do |season_id,season_data|
    if season_id == season
      season_data.each do |contestant_data|
        if contestant_data["status"] == "Winner"
          return contestant_data["name"].split(" ")[0]
        end
      end
    end
  end
  return nil
end

def get_contestant_name(data, occupation)
  data.each do |season_id,season_data|
    season_data.each do |contestant_data|
      if contestant_data["occupation"] == occupation
        return contestant_data["name"]
      end
    end
  end
  return nil
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_id,season_data|
    season_data.each do |contestant_data|
      if contestant_data["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  data.each do |season_id,season_data|
    season_data.each do |contestant_data|
      if contestant_data["hometown"] == hometown
        return contestant_data["occupation"]
      end
    end
  end
  return nil
end

def get_average_age_for_season(data, season)
  total = 0
  count = 0
  data.each do |season_id,season_data|
    if season_id == season
      season_data.each do |contestant_data|
        count += 1
        total += contestant_data["age"].to_i
      end
    end
  end
  if count == 0
    return nil
  end
  return (total.to_f / count.to_f).round.to_i
end
