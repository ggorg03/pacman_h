def load_map
    file = File.new("map01.txt","r")
    map = file.reduce([]) {|arr, line| arr.append(line.strip)}
    file.close
    
    map
end

def found_hero map
    map.each_with_index do |linha, n_linha|
        n_coluna = linha.index("H")
        if n_coluna
            return n_coluna, n_linha
        end
    end
end

def colision (x_pos,y_pos,map)
   map[y_pos][x_pos] == "x"
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
    loop do
        puts "< h vj ^k >l"
        direction = gets.strip.upcase
        
        case direction
        when "H"
            next if colision x_pos -1, y_pos, map
            x_pos -= 1
            break
        when "L"
            next if colision x_pos + 1, y_pos, map
            x_pos += 1
            break
        when "J"
            next if colision x_pos, y_pos + 1, map
            y_pos += 1
            break
        when "K"
            next if colision x_pos, y_pos - 1, map
            y_pos -= 1
            break
        end
    end
    draw_hero x_pos, y_pos, map
end
