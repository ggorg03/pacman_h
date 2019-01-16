require_relative "util_game"

def game
    map = load_map

    while true
        h_position = found_hero map
        puts map
        move_hero map, h_position
        move_enemy map
    end
end
