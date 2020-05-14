class Api::V1::AdminSignupController < ApplicationController
    def create

        admin = AdminSignup.where({:username => params[:username]}).first
        
        if admin
            
          return  render json: {res: "exist", msg: "Username already in use", data: admin}, status: :unprocessable_entity
        else 
    
            password_hash = BCrypt::Password.create(params[:password])
    
            new_admin = AdminSignup.new({
                :username => params[:username],
                :password => password_hash
            })
    
            if new_admin.save
    
               return render json: {res: "created"}, status: :created
            end
        end
    
    end
end
