module Api
	module V1
    class InvoiceController < ApplicationController
      def index
        invoices = Invoice.all
				render(json: {status: 'Success', message:'Invoices', data: invoices}, status: :ok)
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