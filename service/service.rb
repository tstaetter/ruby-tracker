# frozen_string_literal: true

require_relative 'service_status'

module Service
  # Raised, when startup failed
  class StartupError < StandardError; end

  # Base service class
  class Service
    attr_reader :status

    # @return current status
    def initialize
      @status = ServiceStatus::UNKNOWN
    end

    # @abstract
    # Startup and initialize the service
    # @param [Hash] _params Optional parameters
    # @raise StartupError
    # @return current status
    def startup(**_params)
      raise NotImplementedError
    end

    # @abstract
    # Shutdown the service and subsequent services
    # @param [Hash] _params Optional parameters
    # @return current status
    def shutdown(**_params)
      raise NotImplementedError
    end
  end
end
