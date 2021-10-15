class AppointmentsController < ApplicationController
    before_action :find_user
    def new
        @appointment = Appointment.new
    end

    def index
        @appointments = Appointments.all
    end

    def show
        @appointment = Appointment 
    end

    def create
        @appointment = Appointment.new(appointment_params)
        @appointment.user.barber = @user.barber
        if @appointment.save
            redirect_to appointment_path(@user)
        else
            render :new
        end

    end

    private
        def appointment_params
            params.require(:require).permit()
        end
        
        def find_user
            @user = User.find(params[:user_id])
        end
end
