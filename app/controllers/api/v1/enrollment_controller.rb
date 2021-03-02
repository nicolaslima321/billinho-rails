module Api
	module V1
    class EnrollmentController < ApplicationController
      def index
        enrrolments = Enrollment.all
				render(json: {status: 'Success', message:'Enrrolments', data: enrrolments}, status: :ok)
      end

      def show
        enrrolment = Enrrolment.find(params[:id])
				render(json: {status: 'Success', message:'Enrrolment', data: enrrolment}, status: :ok)
      end

      def create
        if !params_allowed(enrrolment_params)
          render(json: {status: 'ERROR', message:'Enrrolment could not be saved, these params are not allowed'}, status: :bad_request)
          return
        end

        enrrolment = Enrrolment.new(enrrolment_params)
				if enrrolment.save
					render(json: {status: 'SUCCESS', message:'Saved enrrolment', data: enrrolment}, status: :ok)
				else
					render(json: {status: 'ERROR', message:'Enrrolment not saved', data: enrrolment.erros}, status: :unprocessable_entity)
				end
      end

      def destroy
				enrollment = Enrrolment.find(params[:id])
				enrollment.destroy
				render(json: {status: 'SUCCESS', message:'Deleted enrollment', data: enrollment}, status: :ok)
			end

      private
			def enrrolment_params
				params.permit(:course_name, :enrrolment_id, :invoice_quantity, :student_id, :total_price, :expiration_day)
      end
      
      private
			def params_allowed(params)
        if (!is_decimal(params[:total_price]) and params[:total_price] <= 0)
          return false
        end
        if (!is_integer(params[:invoice_quantity]) and params[:invoice_quantity] < 1)
          return false
        end
        if (!is_integer(params[:expiration_day]) and (params[:expiration_day] < 1 and params[:expiration_day] > 31))
          return false
        end
        if (params[:course_name].nil? || params[:institution_id].nil? || params[:student_id].nil?)
          return false
        end

        return true
      end

      private
      def is_decimal(number)
        true if Float(number) rescue false
      end

      private
      def is_integer(number)
        true if Integer(number) rescue false
      end
    end
  end
end