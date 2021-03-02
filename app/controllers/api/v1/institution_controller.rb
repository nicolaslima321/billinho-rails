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
        if !params_allowed(institution_params)
          render(json: {status: 'ERROR', message:'Institution could not be saved, these params are not allowed'}, status: :bad_request)
          return
        end

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
      
      private
			def params_allowed(params)
        if !is_numeric(params[:cnpj])
          return false
        end
        if (params[:name].nil?)
          return false
        end
        if (params[:kind].include? "universidade" || params[:kind].include? "escola" || params[:kind].include? "creche")
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
