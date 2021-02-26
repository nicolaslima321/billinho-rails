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
				params.permit(:enrollment_id, :expiration_date, :invoice_value, :status)
			end
    end
  end
end