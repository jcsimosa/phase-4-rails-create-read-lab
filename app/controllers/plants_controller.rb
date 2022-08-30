class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        plants = Plant.all 
        render json:plants
    end
    def show
        plant = Plant.find_by(id: params[:id])
        if plant 
            render json:plant
        else 
            render json: {error: "Plant Not found"}
        end
    end

    def create
        newplant = Plant.create(plantparams)
        render json:newplant, status: :created
    end
    private
    def plantparams
        params.permit(:name,:image,:price)
    end

end
