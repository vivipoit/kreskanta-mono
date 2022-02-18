# frozen_string_literal: true

def load_mocks(spec_type)
  Dir[Rails.root.join(mocks_path(spec_type))].each { |f| load f }
end

def mocks_path(spect_type)
  "spec/support/mocks/#{spect_type}/**/*.rb"
end
