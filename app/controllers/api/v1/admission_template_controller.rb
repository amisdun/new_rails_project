class Api::V1::AdmissionTemplateController < ApplicationController
    def index
        user_token = request.headers['Authorization']

        user_token = user_token.split(' ').last

        if user_token

          decoded_token = JWT.decode user_token, Rails.application.secrets.secret_key_base, true , {algorithm: 'HS256'}

          if decoded_token

            template = AdmissionTemplate.all

            return render json: {data: template}, status: :ok

          else

            return render json: {res: "failed"}, status: :unauthorized
          end

        else
          return render json: {res: "failed", msg: "Unauthorized Access"}, status: :unauthorized
        end
      end

      def create

        user_token = request.headers['Authorization']

        user_token = user_token.split(' ').last

        if user_token

          decoded_token = JWT.decode user_token, Rails.application.secrets.secret_key_base, true , {algorithm: 'HS256'}

          if decoded_token

            new_admission_template = AdmissionTemplate.new({
              :email => params[:email],
              :student_name => params[:student_name],
              :student_number => params[:student_number],
              :student_address => params[:student_address],
              :program_name => params[:program_name],
              :title => params[:title]
            })

            if new_admission_template.save
              return render json: {res: "created"}, status: :created
            end

          else

            return render json: {res: "failed", msg: "Unauthorized"}, status: :unathorized
          end
        end
      end

      def show

        show_single_admission = AdmissionTemplate.find(params[:id])

        return render json: {res: "found", data: show_single_admission}, status: :ok

      end

      def update

        update_admission_letter = AdmissionTemplate.find(params[:id])

        if update_admission_letter.update_attributes({
                                      :email => params[:email],
                                      :student_name => params[:student_name],
                                      :student_number => params[:student_number],
                                      :student_address => params[:student_address],
                                      :program_name => params[:program_name],
                                      :title => params[:title]
                                    })
            return render json: {res: "updated"}, status: :ok
          end

      end

      def destroy

        delete_admission_template = AdmissionTemplate.find(params[:id])

        delete_admission_template.destroy

        return render json: {res: "deleted"}, status: :ok

      end
end
