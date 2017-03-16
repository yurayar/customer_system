class ApiAgreementsController < ApiController
  before_action :find_agreement, only: [:show]
  def index
    render nothing: true
  end

  def show
      render json: @agreement.addresses.as_json(only: [:street, :city, :agreement_number], include: [agreement: {only: [:number]}]), status: :ok
  end

  private
    def find_agreement
      @agreement = Agreement.find_by(:number => params[:number])
      render nothing: true, status: :not_found unless @agreement.present?
    end
end