require "./optimizer.rb"
require "./sample_problem.rb"

class Solver
	include Optimizer
	
	def output_optimal_value_for_each_number_of_floor(number_of_floor, number_of_egg)
		floors = 1..number_of_floor
		puts("卵 #{number_of_egg} 個の場合、\n各階数に対する最適な戦略において、卵の投下回数の最悪値は・・・\n")
		floors.each do |floor|
			optimal_value = optimize(floor, number_of_egg)
			puts("階数 #{floor} の場合: #{optimal_value} 回")
		end
	end
	
	def output_optimal_value
		optimal_value = find_optimal_value(floors, egg)
		puts("最適な戦略において、卵の投下回数の最悪値は #{optimal_value} 回です。")
	end
end

Solver.new.output_optimal_value_for_each_number_of_floor(FLOOR, EGG)