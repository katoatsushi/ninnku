class User::ParameterSanitizer < Devise::ParameterSanitizer	  
	def initialize(*)
		super
        # 新規登録時のパラメーター
		permit(:sign_up, keys: [:name,:company_id,:address,:phone_number,:landline_phone_number])   
        # ユーザー情報アップデート時のパラメーター
        permit(:account_update, keys: [:name,:company_id,:address,:phone_number,:landline_phone_number])
	end
end
# {:college_ids => []}
# user_colleges: [college_ids:[]] 
# colleges: []
# 参考に
# permit(:sign_up, keys: [:clubname, :clubtype, :text, :population, :profile_img , {:college_ids => []} ])   