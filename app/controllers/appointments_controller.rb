class AppointmentsController < ApplicationController
    # before_action :find_user, only: [ :create ]

    def new
        @user = current_user
        @barber = User.find(params[:barber_id])
        @services = @barber.services.map { |service| [service.cut_type, service.id] }
        @appointment = Appointment.new

        # Scope your query to the dates being shown:
        start_date = params.fetch(:start_date, Date.today).to_date
        @time_slots = @barber.time_slots
        @appointments = Appointment.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
    end

    def index
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @appointments = Appointment.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
        # @my_client_appointments = current_user.appointments
        # raise
        if current_user.barber?
            @my_appointments =  Appointment.where(barber: current_user)
        else
            @my_appointments =  Appointment.where(client: current_user)
        end
    end

    def show

    end

    def create
        @appointment = Appointment.new(appointment_params)
        @barber = @appointment.barber
        @appointment.time_slot = @barber.time_slots.first
        @appointment.end_time = @appointment.start_time + @appointment.service.duration
        @appointment.client = current_user
        unless @appointment.save
            @barber = User.find(appointment_params[:barber_id])
            render :new
        end

    end

    private
    def appointment_params
        params.require(:appointment).permit(:start_time, :barber_id, :service_id)
    end

    def find_user
        @user = User.find(params[:user_id])
    end
end
