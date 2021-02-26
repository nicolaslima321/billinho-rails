module Api
	module V1
    class InstitutionController < ApplicationController
      def index
        institutions = Institution.all
				render(json: {status: 'Success', message:'Institutions', data: institutions}, status: :ok)
      end

      def show
        institution = Institution.find(params[:id])
				render(json: {status: 'Success', message:'Institution', data: institution}, status: :ok)
      end

      def create
        institution = Institution.new(institution_params)
				if institution.save
					render(json: {status: 'SUCCESS', message:'Saved institution', data: institution}, status: :ok)
				else
					render(json: {status: 'ERROR', message:'Institution not saved', data: institution.erros}, status: :unprocessable_entity)
				end
      end

      def destroy
				institution = Institution.find(params[:id])
				institution.destroy
				render(json: {status: 'SUCCESS', message:'Deleted institution', data: institution}, status: :ok)
			end

      private
			def institution_params
				params.permit(:cnpj, :kind, :name)
			end
    end
  end
end
