class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Spice.all
    end

    # def show
    #     spice = find_spice
    #     render json: spice
    # end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def create
        render json: Spice.create(spice_params), status: :created
    end

    def destroy
        spice = find_spice
        spice.destroy
    end

    private

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found_response
        render json: {error: 'spice not found'}, status: :not_found
    end

end
