# frozen_string_literal: true

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.define_derived_metadata(file_path: Regexp.new('/spec/lib/')) do |metadata|
    metadata[:type] = :lib
  end
  config.define_derived_metadata(file_path: Regexp.new('/spec/lib/tasks/')) do |metadata|
    metadata[:type] = :task
  end
end
