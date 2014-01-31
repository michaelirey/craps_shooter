require "craps_shooter/version"
require "craps_shooter/dice"
require "craps_shooter/point"
require "craps_shooter/bet"

module CrapsShooter

	class Game
		attr_reader :funds, :rounds

		def initialize
			@funds = 200
			@bet = nil
			@dice = Dice.new
			@rounds = {}
			@point = nil
		end


		def play

			round_count = @rounds.count
			@rounds[round_count] = @funds
			puts "Round: #{@rounds.count}"
			balance
			@point = Point.new
			@bet = Bet.new


			begin

				if !@point.on
					@bet.passline_bet(5)
				end

				@role = @dice.shoot

				if !@point.on
					passline
				else
					
					if @role == @point.value
						@point.on = false
						puts "The point hit on #{@point.value}"
						win(@bet.calculate_win(@role))
					end

					if @role == 7
						lose(@bet.total_bet)
					end

				end

				

			end while !(@role == 7 && @point.on) && @funds > 0


		end


		def balance
			puts "You have $#{@funds}"
		end


		def win(amount)
			@funds += amount	
			puts "You won $#{amount}"
			balance
		end

		def lose(amount)
			@funds -= amount
			puts "You lost $#{amount}"
			balance
		end


		def passline



			case @role
			when 2, 3, 12
				lose(@bet.passline)
			when 4, 5, 6, 8, 9, 10			
				@point.value = @role
				@point.on = true
				puts "Point is on #{@point.value}"
				@bet.place_odds(@role, @funds)
				
			when 7, 11
				win(@bet.passline)
			end

		end


		def higest_balance
		  @rounds.max_by{|k,v| v}
		end

	end



end
