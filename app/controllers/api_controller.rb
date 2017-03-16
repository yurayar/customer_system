class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :parse_request, :authenticate_from_token!
  skip_before_filter :authenticate_user!

  private
    def authenticate_from_token!
      if !@json
        render nothing: true, status: :unauthorized
      else
        render nothing: true, status: 404 unless Devise.secure_compare(@json, "45E6C8FB1B93F33A9F81D12DF4979");
      end
    end

    def parse_request
      @json = params[:api_key]
    end
end