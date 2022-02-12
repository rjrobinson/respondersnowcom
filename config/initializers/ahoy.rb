# frozen_string_literal: true

module Ahoy
  class Store < Ahoy::DatabaseStore
  end
end
# set to true for JavaScript tracking
Ahoy.api = false

# better user agent parsing
Ahoy.user_agent_parser = :device_detector
