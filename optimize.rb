require "./optimal_value_finder.rb"
require "./problem"

# �œK���G���W���N���X
class Optimizer
	include OptimalValueFinder
	
	def output_optimal_value
		optimal_value = find_optimal_value(FLOOR, EGG)
		puts(�œK�Ȑ헪�ɂ����āA���̓����񐔂̍ň��l�� #{optimal_value} ��ł��B)
end

