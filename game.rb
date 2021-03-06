class Game

  def initialize
    @chosen = rand(1..100)
    @count = 0
    @previous_guesses = []
  end

  def pick_number
    if @count == 0
      puts "Please select a number from 1 to 100 and press enter."
      @number = gets.chomp.to_i
      evaluate_guess
    elsif @count < 5
      puts "Please guess again."
      @number = gets.chomp.to_i
      #@previous_guesses = []
      evaluate_guess
    else
      puts "Sorry, you're out of guesses. You lose."
      puts "Would you like to play again? (Y/N)"
      @response = gets.chomp.downcase
      if @response == "y" || @response == "yes"
        Game.new.pick_number
      else
        exit
      end
    end
  end

  def evaluate_guess
    #puts @chosen
    #puts @number
    puts @previous_guesses
    if @previous_guesses.include?(@number)
      puts "You already guessed that, silly! Guess a new number."
      pick_number
      #guesses
    elsif @number == @chosen
      puts "Congratulations! You guessed the correct number!"
      exit
    elsif @number > @chosen && @number < 101
      puts "Your number is too high."
      @previous_guesses << @number
      @count = @count + 1
      pick_number
      #guesses
    elsif @number < @chosen && @number > 0
      puts "Your number is too low."
      @previous_guesses << @number
      @count = @count + 1
      pick_number
      #guesses
    else
      puts "You have chosen an invalid number."
      #@previous_guesses << @number
      pick_number
      #guesses
    end
  end

  # def guesses
  #   #puts @number
  #   @previous_guesses = []
  #   number = @number
  #   @previous_guesses << @number
  #   pick_number
  # end
end

game = Game.new
game.pick_number
