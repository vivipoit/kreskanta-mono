# frozen_string_literal: true

module AccountHelper
  def balance_zero?(balance)
    (balance[:free] == '0.00000000' && balance[:locked] == '0.00000000') ||
      (balance[:free] == '0.00' && balance[:locked] == '0.00') ||
      (balance[:free] == '0.0' && balance[:locked] == '0.0')
  end
end
