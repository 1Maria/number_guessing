class Game

  def initialize
    @chosen = rand(1..101)
    @count = 0
    #@previous_guesses = []
  end

  def pick_number
    @count = @count + 1
    if @count < 6
      puts "Please select a number from 1 to 100."
      @number = gets.chomp.to_i
      @previous_guesses = []
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
    puts @previous_guesses
    if @previous_guesses.include?(@number)
      puts "You already guessed that, silly! Guess a new number."
      @previous_guesses << @number
      pick_number
      #guesses
    elsif @number == @chosen
      puts "Congratulations! You guessed the correct number!"
      exit
    elsif @number > @chosen && @number < 101
      puts "Your number is too high."
      @previous_guesses << @number
      pick_number
      #guesses
    elsif @number < @chosen && @number > 0
      puts "Your number is too low."
      @previous_guesses << @number
      pick_number
      #guesses
    else
      puts "You have chosen an invalid number."
      @previous_guesses << @number
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

Game.new.pick_number
