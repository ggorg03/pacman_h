def load_map
    file = File.new("map01.txt","r")
    map = file.reduce([]) {|arr, line| arr.append(line.strip)}
    file.close
    
    map
end

def found_character (map, character)
    map.each_with_index do |line, nline|
        ncol = line.index(character)
        if ncol
            return ncol, nline
        end
    end    
end

def found_hero (map)
    found_character map, "H"
end

def found_enemy (map)
    found_character map, "E"
end

def colision (x_pos, y_pos, map, thing)
   map[y_pos][x_pos] == thing
end

def colision_wall (x_pos,y_pos,map)
    colision x_pos, y_pos, map, "x"
end

def colision_board (x_pos,y_pos,map)
    colision x_pos, y_pos, map, "|" or colision x_pos, y_pos, map, "-"
end

def clean_position (x_pos, y_pos, map)
    map[y_pos][x_pos] = " "
end

def draw_hero x_pos, y_pos, map
    map[y_pos][x_pos] = "H"
end

def move_hero (map, hero_position)
    x_pos, y_pos = hero_position
    clean_position x_pos, y_pos, map
    puts "< h vj ^k >l"
    loop do
        direction = gets.strip.upcase
        
        case direction
        when "H"
            next if colision_wall x_pos -1, y_pos, map
            next if colision_board x_pos -1, y_pos, map
            x_pos -= 1
            break
        when "L"
            next if colision_wall x_pos + 1, y_pos, map
            next if colision_board x_pos + 1, y_pos, map
            x_pos += 1
            break
        when "J"
            next if colision_wall x_pos, y_pos + 1, map
            next if colision_board x_pos, y_pos + 1, map
            y_pos += 1
            break
        when "K"
            next if colision_wall x_pos, y_pos - 1, map
            next if colision_board x_pos, y_pos - 1, map
            y_pos -= 1
            break
        end
    end
    draw_hero x_pos, y_pos, map
end

def move_enemy (map)
    enemy_pos = found_enemy map 
end
