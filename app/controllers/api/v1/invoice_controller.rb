module Api
	module V1
    class InvoiceController < ApplicationController
      def index
        invoices = Invoice.all
				render(json: {status: 'Success', message:'Invoices', data: invoices}, status: :ok)
      end

      def show
        invoice = Invoice.find(params[:id])
				render(json: {status: 'Success', message:'Invoice', data: invoice}, status: :ok)
      end

			def create
				if !params_allowed(invoice_params)
          render(json: {status: 'ERROR', message:'Invoice could not be saved, these params are not allowed'}, status: :bad_request)
          return
				end

        invoice = Invoice.new(invoice_params)
				if invoice.save
					render(json: {status: 'SUCCESS', message:'Saved invoice', data: invoice}, status: :ok)
				else
					render(json: {status: 'ERROR', message:'Invoice not saved', data: invoice.erros}, status: :unprocessable_entity)
				end
      end

      def destroy
				invoice = Invoice.find(params[:id])
				invoice.destroy
				render(json: {status: 'SUCCESS', message:'Deleted invoice', data: invoice}, status: :ok)
			end

      private
			def invoice_params
				params.permit(:enrolment_id, :expiration_date, :invoice_value, :status)
			end

			private
			def params_allowed(params)
        if !is_decimal(params[:invoice_value])
          return false
        end
        if (params[:expiration_date].nil? and params[:enrolment_id].nil?)
          return false
        end
        if (params[:status].include? "open" || params[:status].include? "overdo" || params[:kind].include? "paid")
          return false
        end

        return true
			end
			
			private
      def is_decimal(number)
        true if Float(number) rescue false
      end
    end
  end
end