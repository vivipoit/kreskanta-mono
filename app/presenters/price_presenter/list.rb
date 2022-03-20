# frozen_string_literal: true

require 'csv'

module PricePresenter
  class List
    def initialize(params)
      @coin = Coin.find(params[:coin_id])
    end

    def csv
      CSV.generate(headers: true) do |csv|
        csv << headers_and_attributes

        coin.prices.each do |price|
          csv << headers_and_attributes.map { |attr| price.send(attr) }
        end
      end
    end

    def self.csv_filename
      'kreskanta-mono-prices.csv'
    end

    private

    attr_reader :coin

    def headers_and_attributes
      %w[
        name
        price
        price_change
        change_percentage
        change_direction
        created_at
      ]
    end
  end
end
