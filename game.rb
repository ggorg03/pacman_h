require_relative "util_game"

def game
    map = load_map

    while true
        puts map
        h_position = found_hero map
        move_hero map, h_position
    end
end
