module Api
	module V1
    class EnrollmentController < ApplicationController
      def index
        enrrolments = Enrollment.all
				render(json: {status: 'Success', message:'Enrrolments', data: enrrolments}, status: :ok)
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