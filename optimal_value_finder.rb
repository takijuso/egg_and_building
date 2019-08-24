# 最適値計算クラス
class OptimalValueFinder
	def initialize(number_of_floor, number_of_eggs)
		@floor = 0
		@max_floor = number_of_floor
		@number_of_eggs = number_of_eggs
		@array_for_dp = Array.new(@max_floor + 1 + 1) { Array.new(number_of_eggs + 1, nil) }
		# DP(Dinamic Programming, 動的計画法)で解く
		# @array_for_dpは1オリジンで運用する
		
		floors = 1..@max_floor
		floors.each do |floor|
			@array_for_dp[floor, 1] = floor
			#卵1個の時は階数 == 最悪値となる
		end
	end
	
	def find_optimal_value
		if @number_of_eggs == 1
			@floor
			# 卵1個のときは、最悪値は階数と一致
			# 最悪ケースは、最上階が割れる最低階 もしくは どの階でも割れないとき
		else
			#卵の初期値が2個以上のとき、DPを実行
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
			# 各階で直近試行した結果の中でもっとも最悪値が小さい時の値を取る
			# nil が入っているのでcompactして最大値を取る
		end
	end
	
	attr_accessor :optimal_value
end