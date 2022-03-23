# frozen_string_literal: true

module ExchangeInfoHelper
  def exchange_info_status(status) # rubocop:disable Metrics/MethodLength
    bg = case status
         when 'PRE_TRADING'
           'warning'
         when 'TRADING'
           'success'
         when 'POST_TRADING', 'AUCTION_MATCH', 'BREAK'
           'info'
         when 'END_OF_DAY'
           'secondary'
         when 'HALT'
           'danger'
         else
           'light'
         end

    content_tag(:span, status, class: ['badge', 'rounded-pill', "bg-#{bg}"])
  end
end
