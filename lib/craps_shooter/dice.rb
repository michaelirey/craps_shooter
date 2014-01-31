module CrapsShooter

	class Dice
		def shoot
			total = 2 + rand(6) + rand(6)
			puts "Shooting: #{total} was rolled"

			total
		end
	end

end