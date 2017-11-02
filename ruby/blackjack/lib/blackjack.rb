require_relative "card"
require_relative "deck"
require_relative "hand"

class Blackjack
  attr_reader :game_data
  def initialize
    @game_data = {
      deck: nil,
      player: nil,
      computer: nil,
      player_score: 0,
      computer_score: 0
    }
    game_data[:deck] = Deck.new
  end
  def initial_deal
    @game_data[:player] = Hand.new(game_data[:deck].deal(2))
    @game_data[:player].cards.each do |the_card|
      puts "Player was dealt #{the_card.rank}#{the_card.suit}"
    end
    @game_data[:player_score] = @game_data[:player].calculate_hand
    puts "Player score: #{@game_data[:player_score]}"
    @game_data[:computer] = Hand.new(@game_data[:deck].deal(2))
    @game_data[:computer_score] = @game_data[:computer].calculate_hand
  end
  def hit_or_stand_input
    score = @game_data[:player_score]
    puts "Hit or stand (H/S):"
    hit_stand = gets.chomp.upcase
    until hit_stand == 'H' || hit_stand == 'S'
      puts "This input is not accepted.  Please try again!"
      puts "Hit or stand (H/S):"
      hit_stand = gets.chomp.upcase
    end
    if hit_stand == 'H'
      hit(hit_stand, score)
    elsif hit_stand == 'S'
      stand(score)
    end
  end

  def hit(input, score)
    until (input == "S") || (score > 21)
      @game_data[:player].cards.push(game_data[:deck].deal(1))
      score = @game_data[:player].calculate_hand
      puts "Player was dealt #{@game_data[:player].cards[-1].rank}#{@game_data[:player].cards[-1].suit}"
      puts "Player score: #{score}"
      if score > 21
        puts "Bust! You lose..."
      else
        puts "Hit or stand (H/S):"
        input = gets.chomp.upcase
          if input == 'S'
            stand(score)
          end
        until input == 'H' || input == 'S'
          puts "This input is not accepted.  Please try again!"
          puts "Hit or stand (H/S):"
          input = gets.chomp.upcase
          if input == 'S'
            stand(score)
          end
        end
      end
    end
  end

  def stand(score)
    puts "Am standing with a score of #{score}."
  end
end


bj = Blackjack.new
bj.initial_deal
bj.hit_or_stand_input
