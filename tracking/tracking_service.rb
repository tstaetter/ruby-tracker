# frozen_string_literal: true

require_relative '../service/service'
require 'mongo'

module Tracking
  # TrackingService creates events in the DB
  class TrackingService < Service::Service
    def initialize
      super

      @_db = ENV['MONGODB_URI']
      @status = Service::ServiceStatus::INITIALIZING
    end

    def startup(**_params)
      @status = Service::ServiceStatus::RUNNING
    rescue StandardError => e
      raise Service::StartupError, e
    end

    def shutdown(**_params)
      @status = Service::ServiceStatus::SHUTDOWN
    end
  end
end
