class AppointmentsController < ApplicationController
    # before_action :find_user, only: [ :create ]

    def new
        @user = current_user
        @barber = User.find(params[:barber_id])
        @services = @barber.services.map { |service| [service.service_type, service.id] }
        @appointment = Appointment.new
    end

    def index
        @my_client_appointments = Appointment.where(client: current_user)
        # raise
        # @my_client_appointments = my_appointments.where(client: current_user)
    end

    def show
    
    end

    def create
        #i will need to find barber id appointment.new()
        #appointment.barber = set to barber in params user.find (use id we receive)
        #appointment.client = current_user
        #appointment.service = receiving in params
        @appointment = Appointment.new(appointment_params)       
        @appointment.client = current_user
        @appointment.time_slot = TimeSlot.first
        if @appointment.save
            redirect_to my_appointments_paths
        else
            render :new
        end

    end

    private
    def appointment_params
        params.require(:appointment).permit(:start_time, :end_time, :barber_id, :service_id)
    end
        
    def find_user
        @user = User.find(params[:user_id])
    end
end
