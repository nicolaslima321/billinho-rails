module Api
	module V1
    class StudentController < ApplicationController
      def index
        students = Student.all
				render(json: {status: 'Success', message:'Students', data: students}, status: :ok)
      end

      def show
      end

      def new
      end

      def edit
      end
    end
  end
end