module OptimalValueFinder
	# find_optimal_value に最適値を計算する処理を記述する
	# 引数として、問題となるビルの階数 と 卵の個数の初期値を受け取る
	
	def find_optimal_value(number_of_floor, number_of_eggs)
		puts("--------")
		puts("floor: #{number_of_floor} ")
		puts("egg: #{number_of_eggs} ")
		array_for_dp = Array.new(number_of_floor + 1 + 1) { Array.new(number_of_eggs + 1, nil) }
		# DP(Dinamic Programming, 動的計画法)で解く
		# array_for_dpは1オリジンで運用する
		
		floors = 1..number_of_floor
		egg_cases = 1..number_of_eggs
		
		floors.each do |floor|
			array_for_dp[floor][1] = floor
			#卵1個の時は階数 == 最悪値となる
		end
		
		egg_cases.each do |egg_case|
			array_for_dp[0][egg_case] = 0
			#ビルの残り階数がない時は、試行回数の加算数は0
			array_for_dp[1][egg_case] = 1
			#ビルが1階しかない時は、卵の個数にかかわらず 最悪値 = 1
		end
		
		if number_of_eggs == 1
			optimal_value = number_of_floor
			# 卵1個のときは、最悪値は階数と一致
			# *正解不明* を防ぐため、最下階から順番に卵を落とす戦略しか取れない
			# 最悪ケースは、最上階が割れる最低階 もしくは どの階でも割れないとき
		else
			#卵の初期値が2個以上のとき、DPを実行
			exlopred_floors = 1..number_of_floor
			objective_value = Array.new(number_of_floor + 1, nil)
			# 各試行階に対応する目的関数値（最悪値）を格納する配列を作成・nilで初期化
			exlopred_floors.each do |trial_floor|
				if array_for_dp[number_of_floor - trial_floor][number_of_eggs].nil?
					 array_for_dp[number_of_floor - trial_floor][number_of_eggs] = find_optimal_value(number_of_floor - trial_floor, number_of_eggs)
					# puts(worst_number_of_trials_in_case_of_not_crash)
				end
				worst_number_of_trials_in_case_of_not_crash = array_for_dp[number_of_floor - trial_floor][number_of_eggs]
				
				if array_for_dp[trial_floor - 1][number_of_eggs - 1].nil?
					array_for_dp[trial_floor - 1][number_of_eggs - 1] = worst_number_of_trials_in_case_of_crash = find_optimal_value(trial_floor - 1, number_of_eggs - 1)
					# puts(worst_number_of_trials_in_case_of_crash)
				end
				worst_number_of_trials_in_case_of_crash = array_for_dp[trial_floor - 1][number_of_eggs - 1]
				
				objective_value[trial_floor] = [worst_number_of_trials_in_case_of_not_crash, worst_number_of_trials_in_case_of_crash].max
				
			end
			optimal_value = objective_value.compact.max
			
			# puts("階数 #{number_of_floor} , 卵の数 #{number_of_eggs} 個のとき、最悪値は #{optimal_value} 。")
			
		end
		# 各階で直近試行した結果の中でもっとも最悪値が小さい時の値を取る
		# nil が入っているのでcompactして最大値を取る
		optimal_value
	end
end