module CrapsShooter
	class Bet
		attr_accessor :passline, :odds
		def initialize
			@passline = 0
			@odds = 0
		end

		def calculate_win(point_hit)

			total_win = @passline

			case point_hit
			when 4,10
				total_win += @odds * 2
			when 5,9
				total_win += @odds * ( 3.to_f / 2.to_f )
			when 6,8
				total_win += @odds * ( 6.to_f / 5.to_f )
			end
			total_win
		end

		def passline_bet(amount)
			@passline = amount
			puts "$#{amount} passline bet placed"
		end

		def place_odds(point, remaining_funds)

			max_bet = remaining_funds - total_bet

			case point
			when 4,10
				@odds = [@passline * 3, max_bet].min
			when 5,9
				@odds = [@passline * 4, max_bet].min
			when 6,8
				@odds = [@passline * 5, max_bet].min
			end

			puts "Odds bet of $#{@odds} placed on #{point}"
			puts "Total wager is now $#{total_bet}"
		end


		def total_bet
			@passline + @odds
		end

	end
end