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

  def hit_or_stand_prompt
    if @game_data[:player_score] > 21
      puts "Bust! You lose..."
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
        hit(:player, :player_score)
      end
    end
  end

  def hit(person, person_score)
    until (@hit_stand == "S") || (@game_data[person_score] > 21)
      @game_data[person].cards.push(game_data[:deck].deal(1))
      @game_data[person_score] = @game_data[person].calculate_hand
      if person == :player
        puts "Player was dealt #{@game_data[:player].cards[-1].rank}#{@game_data[:player].cards[-1].suit}"
        puts "Player score: #{@game_data[:player_score]}"
      elsif person == :computer
        puts "Computer was dealt #{@game_data[:computer].cards[-1].rank}#{@game_data[:computer].cards[-1].suit}"
        puts "Computer score: #{@game_data[:computer_score]}"
      end
      hit_or_stand_prompt
    end
  end

  def stand(person)
    if person == :player
      puts "Player standing with a score of #{@game_data[:player_score]}."
    elsif
      puts "Computer standing with a score of #{@game_data[:computer_score]}."
    end
  end
end


bj = Blackjack.new
bj.initial_deal
bj.hit_or_stand_prompt
