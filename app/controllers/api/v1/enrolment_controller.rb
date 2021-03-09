module Api
	module V1
    class EnrolmentController < ApplicationController
      def index
        enrolments = Enrolment.all
				render(json: {status: 'Success', message:'Enrolments', data: enrolments}, status: :ok)
      end

      def show
        enrolment = Enrolment.find(params[:id])
				render(json: {status: 'Success', message:'Enrolment', data: enrolment}, status: :ok)
      end

      def create
        if !params_allowed(enrolment_params)
          render(json: {status: 'ERROR', message:'Enrolment could not be saved, these params are not allowed'}, status: :bad_request)
          return
        end

        enrolment = Enrolment.new(enrolment_params)
				if !enrolment.save
          render(json: {status: 'ERROR', message:'Enrolment not saved', data: enrolment.erros}, status: :unprocessable_entity)
          return
        end
        
        if create_invoices(enrolment)
          render(json: {status: 'SUCCESS', message:'Saved enrolment and invoices successfully', data: enrolment}, status: :ok)
        else
          render(json: {status: 'ERROR', message:'Some of invoices could not be saved'}, status: :bad_request)
        end
      end

      def destroy
				enrolment = Enrolment.find(params[:id])
				enrolment.destroy
				render(json: {status: 'SUCCESS', message:'Deleted enrolment', data: enrolment}, status: :ok)
      end
      
      private
			def create_invoices(enrolment)
        current_month = DateTime.now().month
        invoice_quantity = enrolment[:invoice_quantity]

        for a in 1..invoice_quantity do
          current_invoice = calculate_invoice(enrolment, current_month)
          puts current_invoice.inspect
          invoice = Invoice.new(current_invoice)

          if !invoice.save
            return false
          end

          current_month += 1

          if (current_month >= 12)
            current_month = 1
          end
        end

        return true
      end

      private
      def calculate_invoice(enrolment, month)
        invoice_value = enrolment[:total_price] / enrolment[:invoice_quantity]

        return ({
          enrolment_id: enrolment[:id],
          expiration_date: DateTime.new(DateTime.now().year, month, enrolment[:expiration_day]),
          invoice_value: invoice_value,
          status: 'open'
        })
      end

      private
			def enrolment_params
				params.permit(:course_name, :invoice_quantity, :student_id, :institution_id, :total_price, :expiration_day)
      end
      
      private
			def params_allowed(params)
        if (!is_decimal(params[:total_price]) and params[:total_price] <= 0)
          return false
        end
        if (!is_integer(params[:invoice_quantity]) and params[:invoice_quantity] < 1)
          return false
        end
        if (!is_integer(params[:expiration_day]) and (params[:expiration_day] < 1 and params[:expiration_day] > 31))
          return false
        end
        if (params[:course_name].nil? || params[:institution_id].nil? || params[:student_id].nil?)
          return false
        end

        return true
      end

      private
      def is_decimal(number)
        true if Float(number) rescue false
      end

      private
      def is_integer(number)
        true if Integer(number) rescue false
      end
    end
  end
end