# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # Option one: Using stripe mock server
  config.before(:each) do
    StripeMock.start_client
  end

  config.after(:each) do
    StripeMock.stop_client
  end

  require 'thin'
  StripeMock.spawn_server

  # Option two: Without server
  # config.before(:each) do
  #   StripeMock.start
  # end

  # config.after(:each) do
  #   StripeMock.stop
  # end
end
