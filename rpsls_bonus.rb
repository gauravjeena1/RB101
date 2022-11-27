CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES = %w(rock paper scissors lizard spock r p sc sp l)

win_key = {
  "rock" => ["scissors", "lizard"],
  "paper" => ["rock", "spock"],
  "scissors" => ["lizard", "paper"],
  "spock" => ["scissors", "rock"],
  "lizard" => ["paper", "spock"],
  "r" => ["scissors", "lizard"],
  "p" => ["rock", "spock"],
  "sc" => ["lizard", "paper"],
  "sp" => ["scissors", "rock"],
  "l" => ["paper", "spock"]
}

shortened = {
  "r" => "rock",
  "p" => "paper",
  "sc" => "scissors",
  "sp" => "spock",
  "l" => "lizard"
}

score = {
  player: 0,
  comp: 0
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def grand_winner?(score_hash)
  if score_hash[:player] == 3
    "YOU ARE THE FINAL WINNER"
  elsif score_hash[:comp] == 3
    "COMPUTER IS THE FINAL WINNER"
  end
end

def assign_choice!(str, short_hash)
  short_hash.fetch(str)
end

def who_won?(first, second, outcomes)
  outcomes[first][0] == second || outcomes[first][1] == second
end

def count_wins(player, computer, win_hash, count_hash)
  if who_won?(player, computer, win_hash)
    count_hash[:player] += 1
  elsif who_won?(computer, player, win_hash)
    count_hash[:comp] += 1
  end
end

def display_results(player, computer, hash)
  if who_won?(player, computer, hash)
    prompt("You won!")
  elsif who_won?(computer, player, hash)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  puts "WELCOME TO THE GAME OF Rock-Paper-Scissors-Lizard-Spock"
  puts "FIRST TO 3 WINS IS THE FINAL WINNER"
  score[:player] = 0
  score[:comp] = 0
  loop do
    choice = ''
    loop do
      prompt("Choose one: r-rock p-paper sc-scissors l-lizard sp-spock")
      choice = Kernel.gets.chomp.downcase

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice")
      end
    end

    choice = assign_choice!(choice, shortened) if shortened.fetch(choice, false)

    computer_choice = CHOICES.sample

    prompt("You chose: #{choice} & Computer chose: #{computer_choice}")

    display_results(choice, computer_choice, win_key)

    count_wins(choice, computer_choice, win_key, score)
    puts "Score => Player: #{score[:player]} Computer: #{score[:comp]}"

    break if score[:player] == 3 || score[:comp] == 3

    prompt("Press any key then press Enter to continue")
    gets
  end
  prompt(grand_winner?(score))
  prompt("Score => Player:#{score[:player]} Computer:#{score[:comp]}")

  prompt("\nWOULD YOU LIKE TO PLAY AGAIN? Press (y) for yes")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("THANK YOU FOR PLAYING. GOOD BYE!!!")
