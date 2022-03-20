# frozen_string_literal: true

class PricesController < ApplicationController
  def index
    if request.format == :csv
      send_data ::PricePresenter::List.new(permitted_params).csv, filename: ::PricePresenter::List.csv_filename
    else
      render body: nil, status: :unsupported_media_type
    end
  end

  private

  def permitted_params
    params.permit(:coin_id)
  end
end
