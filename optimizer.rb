require "./sub_problem_solver.rb"
require "./sample_problem.rb"

# 最適化モジュール
module Optimizer
	
	def optimize(number_of_floor, number_of_egg)
		ovf = SubProblemSolver.new(number_of_floor, number_of_egg)
		optimal_value = ovf.find_optimal_value
	end
end
