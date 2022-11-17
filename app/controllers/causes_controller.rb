class CausesController < ApplicationController

    before_action :set_cause, only: %i[show update]

    def index
        causes = Cause.includes(:organization).where(featured: true)
        render json: causes, status: 200
    end

    def statistics
        total_causes = Cause.all.count.to_json
        causes_that_exceed_donation = Donation.joins(:cause).where('quantity>expected_amount').count.to_json
        total_amount_causes = Cause.joins(:donations).sum(:quantity).to_json

        render json: {total_causes: total_causes, causes_that_exceed_donation: causes_that_exceed_donation, total_amount_causes: total_amount_causes}, status: 200

    end

    def show
        render json: @cause.to_json(include: [:organization, :reports, :donations]), status: 200
    end


    def update

        if @cause.update(cause_params)
            render json: @cause, status: 201 
        else 
            render json: @cause.errors, status: :unprocessable_entity 
        end

    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_cause
        @cause = Cause.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cause_params
        params.require(:cause).permit(:title, :description, :expected_amount )
    end
end

