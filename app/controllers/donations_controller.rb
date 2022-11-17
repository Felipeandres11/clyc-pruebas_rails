class DonationsController < ApplicationController

    def index
        ## TODO: Return a list of donations filtering by cause

        donation = Donation.includes(:cause)
        render json: donation, status: 200
        
    end

    def create
        # TODO: Create a donation
        donation = Donation.create(donation_params)
        render json: donation, status: :created
    end

    def destroy
        # TODO: Remove a donation from database
        donation = Donation.find(params[:id])
        donation.destroy
		
        head :no_content
    end

    private
    # Only allow a list of trusted parameters through.
    def donation_params
        params.require(:donation).permit(:media, :quantity, :cause_id)
    end
end
