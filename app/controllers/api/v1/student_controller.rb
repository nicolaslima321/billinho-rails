module Api
	module V1
    class StudentController < ApplicationController
      def index
        students = Student.all
				render(json: {status: 'Success', message:'Students', data: students}, status: :ok)
      end

      def show
        student = Student.find(params[:id])
				render(json: {status: 'Success', message:'Student', data: student}, status: :ok)
      end

      def create
        if !params_allowed(student_params)
          render(json: {status: 'ERROR', message:'Student could not be saved, these params are not allowed'}, status: :bad_request)
          return
        end

        student = Student.new(student_params)
				if student.save
					render(json: {status: 'SUCCESS', message:'Saved student', data: student}, status: :ok)
				else
					render(json: {status: 'ERROR', message:'Student not saved', data: student.errors}, status: :unprocessable_entity)
				end
      end

      def destroy
				student = Student.find(params[:id])
				student.destroy
				render(json: {status: 'SUCCESS', message:'Deleted student', data: student}, status: :ok)
			end

      private
			def student_params
				params.permit(:birth_date, :celphone, :cpf, :genre, :name, :payment_method)
      end
      
      private
			def params_allowed(params)
        if !is_numeric(params[:cpf])
          return false
        end
        if (params[:genre] != 'M' && params[:genre] != 'F')
          return false
        end
        if (params[:payment_method] != 'credit_card' && params[:payment_method] != 'bank_slip')
          return false
        end

        return true
      end

      private
      def is_numeric(number)
        true if Integer(number) rescue false
      end
    end
  end
end