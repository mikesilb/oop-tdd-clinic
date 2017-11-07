require_relative "card"
require_relative "deck"
require_relative "hand"

class Blackjack
  attr_reader :game_data, :computer_bust_output, :player_win_loss
  def initialize
    @game_data = {
      deck: nil,
      player: nil,
      computer: nil,
      player_scores: [],
      computer_scores: [],
      player_win_loss: nil
    }
    @game_data[:deck] = Deck.new
    @game_data[:player_scores][0] = 0
    @game_data[:computer_scores][0] = 0
    @computer_bust_output = nil
  end

  def initial_deal
    @game_data[:player] = Hand.new(game_data[:deck].deal(2))
    @game_data[:player].cards.each do |the_card|
      puts "Player was dealt #{the_card.rank}#{the_card.suit}"
    end
    @game_data[:player_scores][0] = @game_data[:player].calculate_hand
    puts "Player score: #{@game_data[:player_scores][0]}"
    @game_data[:computer] = Hand.new(@game_data[:deck].deal(2))
    @game_data[:computer_scores][0] = @game_data[:computer].calculate_hand
  end

  def hit_or_stand_prompt
    if @game_data[:player_scores][-1] > 21
      puts "Bust! You lose..."
      @game_data[:player_win_loss] = "loss"
    else
      puts "Hit or stand (H/S):"
      @hit_stand = gets.chomp.upcase
      until @hit_stand == 'H' || @hit_stand == 'S'
        puts "This input is not accepted.  Please try again!"
        hit_or_stand_prompt
      end
      if @hit_stand == 'S'
        stand(:player)
      else
        until (@hit_stand == "S") || (@game_data[:player_scores][-1] > 21)
          hit(:player)
          hit_or_stand_prompt
        end
      end
    end
    if @game_data[:player_win_loss] == "loss"
      false
    end
  end

  def hit(person)
    @game_data[person].cards.push(game_data[:deck].deal(1))
    if person == :player
      @game_data[:player_scores].push(@game_data[person].calculate_hand)
      puts "Player was dealt #{@game_data[:player].cards[-1].rank}#{@game_data[:player].cards[-1].suit}"
      puts "Player score: #{@game_data[:player_scores][-1]}"
    elsif person == :computer
      @game_data[:computer_scores].push(@game_data[person].calculate_hand)
      puts "Dealer was dealt #{@game_data[:computer].cards[-1].rank}#{@game_data[:computer].cards[-1].suit}"
      puts "Dealer score: #{@game_data[:computer_scores][-1]}"
    end
  end


  def stand(person)
    if person == :player
      puts "Player standing with a score of #{@game_data[:player_scores][-1]}."
    elsif person == :computer
      puts "Dealer standing with a score of #{@game_data[:computer_scores][-1]}."
    end
  end

  def dealer_moves
    @game_data[:computer].cards.each do |the_card|
      puts "Dealer was dealt #{the_card.rank}#{the_card.suit}"
    end
    puts "Dealer score: #{@game_data[:computer_scores][-1]}"
    while @game_data[:computer_scores][-1] < 17
      hit(:computer)
      if @game_data[:computer_scores][-1] > 21
        puts "Bust! You Win"
        @computer_bust_output = "Bust! You Win"
        @game_data[:player_win_loss] = "win"
      end
    end
    if @game_data[:computer_scores][-1] <= 21
      puts "Dealer stands.\n"
      if @game_data[:computer_scores][-1] > @game_data[:player_scores][-1]
        puts "Dealer wins."
        @game_data[:player_win_loss] = "loss"
      elsif @game_data[:player_scores][-1] > @game_data[:computer_scores][-1]
        puts "Player wins!"
        @game_data[:player_win_loss] = "win"
      else
        puts "Tie game"
        @game_data[:player_win_loss] = "tie"
      end
    end
  end
end


bj = Blackjack.new
bj.initial_deal
player_result= bj.hit_or_stand_prompt
if player_result != false
  bj.dealer_moves
end
