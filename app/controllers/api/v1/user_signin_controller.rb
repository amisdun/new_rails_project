class Api::V1::UserSigninController < ApplicationController
    def create

        user_signin = UserSignup.where({:username => params[:username]}).first
    
        if user_signin
          password_compare = BCrypt::Password.new(user_signin.password)
    
          if password_compare = params[:password]
    
            exp = Time.now.to_i + 4 * 3600
    
            exp_payload = {user_id: user_signin.id, category_name: user_signin.category, exp: exp}
    
            token = JWT.encode exp_payload, Rails.application.secrets.secret_key_base, "HS256"
    
            return render json: {res: "success", token: token, data: user_signin}, status: :ok
    
          else
    
            return render json: {res: "failed", msg: "Invalid credentials"}
          end
        else
    
          return render json: {res: "failed", msg: "Invalid credentials"}, status: :unprocessable_entity
        end
    end
end
