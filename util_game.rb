def found_hero map
    map.each_with_index do |linha, n_linha|
        n_coluna = linha.index("H")
        if n_coluna
            return n_coluna, n_linha
        end
    end
end
        
def load_map
    file = File.new("map01.txt","r")
    map = file.reduce([]) {|arr, line| arr.append(line.strip)}
    file.close
    
    map
end
