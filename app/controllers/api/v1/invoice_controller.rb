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

      def destroy
				invoice = Invoice.find(params[:id])
				invoice.destroy
				render(json: {status: 'SUCCESS', message:'Deleted invoice', data: invoice}, status: :ok)
			end
    end
  end
end