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
        enrrolment = Enrrolment.new(enrrolment_params)
				if enrrolment.save
					render(json: {status: 'SUCCESS', message:'Saved enrrolment', data: enrrolment}, status: :ok)
				else
					render(json: {status: 'ERROR', message:'Enrrolment not saved', data: enrrolment.erros}, status: :unprocessable_entity)
				end
      end

      def edit
      end

      private
			def enrrolment_params
				params.permit(:course_name, :enrrolment_id, :invoice_quantity, :student_id, :total_price, :expiration_date)
			end
    end
  end
end