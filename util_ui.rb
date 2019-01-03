def max(a,b)
    if a > b
        a
    else
        b
    end
end

def size_of_biggest_line(img)
    img.reduce(0) {|x,y| max x, y.split.size}
end
    
def home_screen
    file = File.new("PACMAN.txt","r")
    image = file.readlines
    file.close
    
    image_height = image.size
    image_width = size_of_biggest_line image

    screen_height = 40
    screen_width = 169
    
    board = "#" * screen_width

    h_space = (screen_width - image_width) / 2
    v_space = (screen_height - image_height) / 2

    puts board
    puts "\n" * v_space
    image.each {|line| puts " " * 50 + line.strip}
    puts "\n" * v_space
    puts board
end

def ask_enter
    puts "<PRESS ENTER>"
    gets
end
