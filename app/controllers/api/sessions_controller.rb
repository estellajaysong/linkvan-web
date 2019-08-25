class Api::SessionsController < Api::ApplicationController
	skip_before_action :require_signin

	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			if !cookies['non_data_user'].present?
				cookies['non_data_user'] = 'true'
			end
		else
			error_json = { error: 'Email or Password invalid, please try again.' }
			render json: error_json, status: :unauthorized
		end
		@response = { cookies: cookies }
		render json: @response, status: :ok
	end

	def destroy
		session[:user_id] = nil
		cookies.delete(:non_data_user)
		@response = { cookies: cookies }
		render json: @response, status: :ok
	end
end
