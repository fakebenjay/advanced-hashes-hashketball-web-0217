def game_hash
  game_hash = {
    home:{
      team_name:"Brooklyn Nets",
      colors:["Black", "White"],
      players:{
        "Alan Anderson" => {number:0, shoe:16, points:22, rebounds:12, assists:12, steals:3, blocks:1, slam_dunks:1},
        "Reggie Evans" => {number:30, shoe:14, points:12, rebounds:12, assists:12, steals:12, blocks:12, slam_dunks:7},
        "Brook Lopez" => {number:11, shoe:17, points:17, rebounds:19, assists:10, steals:3, blocks:1, slam_dunks:15},
        "Mason Plumlee" => {number:1, shoe:19, points:26, rebounds:12, assists:6, steals:3, blocks:8, slam_dunks:5},
        "Jason Terry" => {number:31, shoe:15, points:19, rebounds:2, assists:2, steals:4, blocks:11, slam_dunks:1}
      }
      },
    away:{
      team_name:"Charlotte Hornets",
      colors:["Turquoise", "Purple"],
      players:{
        "Jeff Adrien" => {number:4, shoe:18, points:10, rebounds:1, assists:1, steals:2, blocks:7, slam_dunks:2},
        "Bismak Biyombo" => {number:0, shoe:16, points:12, rebounds:4, assists:7, steals:7, blocks:15, slam_dunks:10},
        "DeSagna Diop" => {number:2, shoe:14, points:24, rebounds:12, assists:12, steals:4, blocks:5, slam_dunks:5},
        "Ben Gordon" => {number:8, shoe:15, points:33, rebounds:3, assists:2, steals:1, blocks:1, slam_dunks:0},
        "Brendan Haywood" => {number:33, shoe:15, points:6, rebounds:12, assists:12, steals:22, blocks:5, slam_dunks:12}
      }
      }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stat|
      if player_name == name
        return stat[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stat|
      if player_name == name
        return stat[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

## Tried #player_numbers with #collect for the innermost iterator.
## Reminder: ask later why that didn't work.
def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |player_name, stat|
        numbers << stat[:number]
      end
    end
  end
  return numbers
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if player_name == name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  shaq_foot = nil
  wilt_rebs = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stat|

      ## This part adapted from the key-for-min-value lab
      if shaq_foot == nil || shaq_foot < stat[:shoe]
        shaq_foot = stat[:shoe]
        wilt_rebs = stat[:rebounds]
      end
    end
  end
  return wilt_rebs
end

##############################################
################ OVERTIME!!!! ################
##############################################

def most_points_scored
  wilt_points = nil
  wilt_name = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stat|

      ## This part adapted from the key-for-min-value lab & #big_shoe_rebounds
      if wilt_points == nil || wilt_points < stat[:points]
        wilt_points = stat[:points]
        wilt_name = player_name
      end
    end
  end
  return wilt_name
end

def winning_team
  home_points = 0
  away_points = 0

  game_hash.each do |location, team_data|
    if location == :home
      team_data[:players].each do |player_name, stat|
        home_points += stat[:points]
      end
    elsif location == :away
      team_data[:players].each do |player_name, stat|
        away_points += stat[:points]
      end
    end
  end

  if home_points > away_points
    return game_hash[:home][:team_name]
  elsif home_points > away_points
    return game_hash[:away][:team_name]
  elsif home_points == away_points
    return "OVERTIME!!!"
  end

end

def longest_name
  antetokounmpo_array = []
  giannis = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stat|
      antetokounmpo_array << player_name
      antetokounmpo_array.sort_by! { |name| name.length }
      giannis = antetokounmpo_array[-1]
    end
  end
  return giannis
end

def long_name_steals_a_ton
  antetokounmpo_array = []
  giannis = nil
  stockton_steals = nil
  john = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stat|

      ## This part adapted from the key-for-min-value lab & #big_shoe_rebounds
      if stockton_steals == nil || stockton_steals < stat[:steals]
        stockton_steals = stat[:steals]
        john = player_name
      end

      antetokounmpo_array << player_name
      antetokounmpo_array.sort_by! { |name| name.length }
      giannis = antetokounmpo_array[-1]
    end
  end

  if john == giannis
    true
  else
    false
  end

end
