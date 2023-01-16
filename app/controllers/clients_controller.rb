class ClientsController < ApplicationController

    def show
        client = Client.find(params[:id])
        render json: client
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Client not found"}, status: :not_found
    end
    
end
