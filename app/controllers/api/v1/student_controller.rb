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
        student = Student.new(student_params)
				if student.save
					render(json: {status: 'SUCCESS', message:'Saved student', data: student}, status: :ok)
				else
					render(json: {status: 'ERROR', message:'Student not saved', data: student.erros}, status: :unprocessable_entity)
				end
      end

      def edit
      end

      private
			def student_params
				params.permit(:birth_date, :celphone, :cpf, :genre, :name, :payment_method)
			end
    end
  end
end