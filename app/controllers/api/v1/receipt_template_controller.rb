class Api::V1::ReceiptTemplateController < ApplicationController
    def index
        user_token = request.headers['Authorization']

        user_token = user_token.split(' ').last

        if user_token

          decoded_token = JWT.decode user_token, Rails.application.secrets.secret_key_base, true , {algorithm: 'HS256'}

          if decoded_token

            template = ReceiptTemplate.all

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

            new_receipt_template = ReceiptTemplate.new({
              :student_name => params[:student_name],
              :amount_in_words => params[:amount_in_words],
              :amount_in_numbers => params[:amount_in_numbers],
              :index_number => params[:index_number],
              :date => params[:date]
            })

            if new_receipt_template.save
              return render json: {res: "created"}, status: :created
            end

          else

            return render json: {res: "failed", msg: "Unauthorized"}, status: :unauthorized
          end
        end
      end

      def show

        show_single_receipt = ReceiptTemplate.find(params[:id])

        return render json: {res: "found", data: show_single_receipt}, status: :ok

      end

      def update

        update_receipt = ReceiptTemplate.find(params[:id])

        if update_receipt.update_attributes({
                                  :student_name => params[:student_name],
                                  :amount_in_words => params[:amount_in_words],
                                  :amount_in_numbers => params[:amount_in_numbers],
                                  :index_number => params[:index_number],
                                  :date => params[:date]
                                    })
            return render json: {res: "updated"}, status: :ok
          end

      end

      def destroy

        delete_receipt_template = ReceiptTemplate.find(params[:id])

        delete_receipt_template.destroy

        return render json: {res: "deleted"}, status: :ok

      end
end
