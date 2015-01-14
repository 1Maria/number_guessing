class Game

  def initialize
    @chosen = rand(1..101)
    @count = 0
  end

  def pick_number
    @count = @count + 1
    if @count < 6
      puts "Please select a number from 1 to 100."
      @number = gets.chomp.to_i
      evaluate_guess
    else
      puts "You have no guesses left. Your game is over."
      puts "Would you like to play again? (Y/N)"
      @response = gets.chomp
      if @response == "Y"
        Game.new.pick_number
      else
        exit
      end
    end
  end

  def evaluate_guess
    #puts @chosen
    #puts @number
    if @number == @chosen
      puts "Congratulations! You guessed the correct number!"
      exit
    elsif @number > @chosen && @number < 101
      puts "Your number is too high."
      pick_number
    elsif @number < @chosen && @number > 1
      puts "Your number is too low."
      pick_number
    else
      puts "You have chosen an invalid number."
      pick_number
    end
  end
end

Game.new.pick_number
