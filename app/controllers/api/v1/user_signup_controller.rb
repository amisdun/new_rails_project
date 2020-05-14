class Api::V1::UserSignupController < ApplicationController
    def create

        admin_token = request.headers['Authorization']
    
        admin_token = admin_token.split(' ').last
    
        if admin_token
    
          decoded_token = JWT.decode admin_token, Rails.application.secrets.secret_key_base, true , {algorithm: 'HS256'}
          token = decoded_token[0]
          puts token['user_id']
          admin = AdminSignup.find(token['user_id'])
    
          if admin 
    
            user = UserSignup.where({:username => params[:username]}).first
    
            if user
    
              return render json: {res: "exist"}
        
            else
              password_hash = BCrypt::Password.create(params[:password])
        
              new_user =  UserSignup.new({
                          :username => params[:username],
                          :password => password_hash,
                          :category=> params[:category]
                        })
        
              if new_user.save
    
                return render json: {res: "created"}, status: :created
              end
        
            end
            
          else
    
            return render json: {res: "Unauthorized"}, status: :unauthorized
          end
        else
    
          return render json: {res: "provide user token in header"}, status: :unauthorized
        end
      end
end
