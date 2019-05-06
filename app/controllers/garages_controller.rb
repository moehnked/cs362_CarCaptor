class GaragesController < ApplicationController
	def new
		@garage = Garage.new
	end

	def index
		@garages = Garage.all
	end

	def create
	    @workflow = CreateGarage.new()
	    @workflow.create
	    if @workflow.success?
	      redirect_to garages_path
	    else
	      @garage = @workflow.garage
	      render :new
	    end
	end
end
