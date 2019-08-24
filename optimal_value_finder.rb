# �œK�l�v�Z�N���X
class OptimalValueFinder
	def initialize(number_of_floor, number_of_eggs)
		@floor = 0
		@max_floor = number_of_floor
		@number_of_eggs = number_of_eggs
		@array_for_dp = Array.new(@max_floor + 1 + 1) { Array.new(number_of_eggs + 1, nil) }
		# DP(Dinamic Programming, ���I�v��@)�ŉ���
		# @array_for_dp��1�I���W���ŉ^�p����
		
		floors = 1..@max_floor
		floors.each do |floor|
			@array_for_dp[floor, 1] = floor
			#��1�̎��͊K�� == �ň��l�ƂȂ�
		end
	end
	
	def find_optimal_value
		if @number_of_eggs == 1
			@floor
			# ��1�̂Ƃ��́A�ň��l�͊K���ƈ�v
			# �ň��P�[�X�́A�ŏ�K�������Œ�K �������� �ǂ̊K�ł�����Ȃ��Ƃ�
		else
			#���̏����l��2�ȏ�̂Ƃ��ADP�����s
			exlopred_floors = 1..@max_floor
				objective_value = Array.new(@max_floor + 1, nil)
				exlopred_floors.each do |trial_floor|
					if @array_for_dp[@max_floor - trial_floor, @number_of_eggs].nil?
						sub_problem_in_case_of_not_crash = FindOptimalValue.new(@max_floor - trial_floor, @number_of_eggs)
						worst_number_of_trials_in_case_of_not_crash = @array_for_dp[@max_floor - trial_floor, @number_of_eggs] = sub_problem_in_case_of_not_crash.optimal_value
					end
					if @array_for_dp[trial_floor - 1, @number_of_eggs - 1].nil?
						sub_problem_in_case_of_crash = FindOptimalValue.new(trial_floor - 1, @number_of_eggs - 1)
						worst_number_of_trials_in_case_of_crash = @array_for_dp[trial_floor - 1, @number_of_eggs - 1] = sub_problem_in_case_of_crash.optimal_value
					end
					objective_value[trial_floor] = max(worst_number_of_trials_in_case_of_not_crash, worst_number_of_trials_in_case_of_crash)
				end
			end
			@optimal_value = objective_value.compact.max
			# �e�K�Œ��ߎ��s�������ʂ̒��ł����Ƃ��ň��l�����������̒l�����
			# nil �������Ă���̂�compact���čő�l�����
		end
	end
	
	attr_accessor :optimal_value
end