def show_game
    file = File.new("PACMAN.txt","r")
    image = file.readlines
    file.close

    puts image
end

def ask_enter
    puts "<PRESS ENTER>"
    gets
end
