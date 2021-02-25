module Api
	module V1
    class InstitutionController < ApplicationController
      def index
        institutions = Institution.all
				render(json: {status: 'Success', message:'Institutions', data: institutions}, status: :ok)
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
