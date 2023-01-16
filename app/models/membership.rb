class Membership < ApplicationRecord
    validate :no_double_memberships
    belongs_to :gym
    belongs_to :client

    private
    def no_double_memberships
        existing_membership = Membership.find_by(client_id: self.client_id, gym_id: self.gym_id)
        if existing_membership
            errors.add(:customer_id, "Client already has membership at this gym")
        end
    end
        
end
