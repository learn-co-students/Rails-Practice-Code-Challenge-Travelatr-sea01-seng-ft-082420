class DestinationsController < ApplicationController
    before_action :set_destination, only: [:show]
    def index
        @destinations = Destination.all
    end 

    def show
    end 

    def new
        @destination = Destination.new
    end 

    def create
        @destination = Destination.create(destination_params)
        if @destination.valid?
            redirect_to destination_path(@destination)
        else
            flash[:errors] = @destination.errors.full_messages
            redirect_to new_destination_path
        end 
        # redirect_to @destination
    end 

    private 

    def set_destination
        @destination = Destination.find(params[:id])
    end

    def destination_params
        params.require(:destination).permit(:name, :country)
    end 
end
