class MembershipsController < ApplicationController

    def create
        membership = Membership.create!(params.permit(:charge, :gym_id, :client_id))
        render json: membership, status: :created
    rescue ActiveRecord::RecordInvalid => e 
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end
    
end
