require_relative "util_game"

def game
    map = load_map

    while true
        h_position = found_hero map
        puts h_position
        break
    end
end
