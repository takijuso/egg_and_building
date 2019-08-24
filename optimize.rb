require "./optimal_value_finder.rb"
require "./sample_problem.rb"

# 最適化エンジンクラス
class Optimizer
	include OptimalValueFinder
	
	def output_optimal_value_for_each_number_of_floor
		floors = 1..100
		egg = 2
		puts("卵2個の場合、\n各階数に対する最適な戦略において、卵の投下回数の最悪値は・・・\n")
		floors.each do |floor|
			optimal_value = find_optimal_value(floor, egg)
			puts("階数 #{floor} の場合: #{optimal_value} 回")
		end
	end
	
	def output_optimal_value
		optimal_value = find_optimal_value(FLOOR, EGG)
		puts("最適な戦略において、卵の投下回数の最悪値は #{optimal_value} 回です。")
	end
end

Optimizer.new.output_optimal_value_for_each_number_of_floor