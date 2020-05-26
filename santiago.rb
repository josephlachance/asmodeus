#My Assignment
#Make a text base game.
playing = true
weapon = true
player_health = 100
answers = ["mirror", "bed", "dresser"]
pa3_answers = ["left", "painting", "right"]
game_step = "intro"
doll = false

def ask_player question, options
  puts question
  options.each do |option|
      puts "> #{option}"
    end
  print "> "
  gets.chomp.downcase
end

player_answer = ask_player "You find yourself waking up in what appears to be an empty bedroom.\nNothing but a bed, dresser and mirror.\nWhich would you like to inspect?", ["mirror", "dresser", "bed"]
while playing
  case game_step
  when "intro"
    case player_answer
    when answers[0]
      puts "The mirror is dusty and cracked at the bottom right corner...you reach out and cut your finger. -1 HP"
      player_health -= 1
      puts "Your health is now: "
      puts player_health
      player_answer = ask_player "You find yourself waking up in what appears to be an empty bedroom.\nNothing but a bed, dresser and mirror.\nWhich would you like to inspect?", ["mirror", "dresser", "bed"]
    when answers[1]
      take_doll = ask_player "The bed has a smell of musk, looks like a blood stain on the sheet. Under the covers you find a small doll. Do you take it?", ["yes", "no"]
        if take_doll == "yes"
          doll = true
          puts "You have obtained Doll"
        else
          doll = false
          puts "You go back to the center of the room."
        end
        player_answer = ask_player "You find yourself waking up in what appears to be an empty bedroom.\nNothing but a bed, dresser and mirror.\nWhich would you like to inspect?", ["mirror", "dresser", "bed"]

    when answers[2]
      pa2 = ask_player "The Dresser moves to reveal a secret passageway. Would you like to enter? ", ["yes", "no"]
      if pa2 == "yes"
        pa3 = ask_player "The secret passage way is cold, however to your left you feel some warm air. In front of you is a painting of an old man. To your right is pitch darkness. What would you like to do?", ["left", "painting", "right"]
        game_step = "dresser"
      else
        puts "You turn around like a coward"
      end
    when "exit"
      playing = false
    else
      puts "Nothing suspicious here..."
    end
  when "dresser"
    case pa3
    when pa3_answers[0]
      puts "You continue down the corridor and you begin to see and feel light and heat."
      game_step = "corridor"
    when pa3_answers[1]
      puts "The man's face is somber and depressing it looks like his eyes are missing from the painting."
      pa4 = ask_player "Would you like to inspect the eye holes? ", ["yes", "no"]
      if pa4 == "yes"
        game_step = "painting"
      else
        puts "youz a cowardz"
        pa3 = ask_player "The secret passage way is cold, however to your left you feel some warm air. In front of you is a painting of an old man. To your right is pitch darkness. What would you like to do?", ["left", "right", "painting"]
      end
    when pa3_answers[2]
      puts "I don't care."
    when "exit"
      playing = false
    else
      puts "Dawgg wake up"
    end
  when "painting"
    print "> "
    pa5 = ask_player
    case pa5
    when pa5_answers[0]
      puts "You continue down the corridor and you begin to see and feel light and heat."
      game_step = "corridor"
    when pa5_answers[1]
      puts "The man's face is somber and depressing it looks like his eyes are missing from the painting."
      puts "Would you like to inspect the eye holes? "
      pa4 = ask_player
      if pa4 == "yes"
        puts "What would you like to do?"
        puts "> Touch Eyes" + "Smell painting"
      end
      if doll == true
          puts "> Pull out Doll"
      end

      else
        puts "youz a cowardz"
        puts "The secret passage way is cold, however to your left you feel some warm air. In front of you is a painting of an old man. To your right is pitch darkness. What would you like to do?"
        puts "1.) Left\n2.) Painting\n3.) Right"
      end
    when pa5_answers[2]
      puts "I don't care."
    when "exit"
      playing = false
    else
      puts "Dawgg wake up"
    end
  end


ask_player "what is the point of it all."

puts "Thanks for playing!"
#player can pick up weapons and use them for boss battles.
#Weapons have set number for damage.
#Boss has HP
#Figure out dice rolls probablity
