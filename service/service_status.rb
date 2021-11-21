# frozen_string_literal: true

module Service
  # Service states
  module ServiceStatus
    UNKNOWN       = -1
    INITIALIZING  = 1
    RUNNING       = 2
    SHUTTING_DOWN = 3
    SHUTDOWN      = 4
  end
end
