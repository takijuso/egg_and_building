require "./optimal_value_finder.rb"
require "./sample_problem.rb"

# 最適化エンジンクラス
class Optimizer
	include OptimalValueFinder
	
	def output_optimal_value
		optimal_value = find_optimal_value(FLOOR, EGG)
		puts("最適な戦略において、卵の投下回数の最悪値は #{optimal_value} 回です。")
	end
end

Optimizer.new.output_optimal_value