def load_map
    file = File.new("map01.txt","r")
    map = file.reduce([]) {|arr, line| arr.append(line.strip)}
    file.close
    
    map
end
