class PetsController < ApplicationController
    def index
        @pets =Pet.all
        render json: @pets
    end
    
    def show
        @pet = Pet.find(params[:id])
        render json: @pet
    end

    def update
        @pet = Pet.find(params[:id])
        @pet.update(pet_params[:id])
        render json: @pet
    end

    def destroy
        @pet = Pet.find(params[:id])
        @pet.destroy
        redirect_to action: "index"
    end
    
    def create
        @pet = Pet.create(pet_params)

        render json: @pet
    end
    private

    def pet_params
        params.require('pet').permit([:name, :species, :breed, :age])
    end

end
