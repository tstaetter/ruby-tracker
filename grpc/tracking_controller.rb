# frozen_string_literal: true

require 'stubs/tracking_service_services_pb'
require 'tracking/tracking_service'

##
# gRPC controller implementing TrackingService
#
class TrackingController < ::Gruf::Controllers::Base
  bind ::RubyTracker::Tracking::Tracking::Service

  def initialize(method_key:, service:, rpc_desc:, active_call:, message:)
    super

    @_service = Tracking::TrackingService.new
    @_service.startup
  end

  ##
  # Receive a stream of [RubyTracker::Tracking::Event] objects
  # @return [RubyTracker::Tracking::EventResponse]
  #
  def create_event
    session_id = request.metadata['session_id']
    # Handle event stream
    request.messages do |event|
      puts event.user.stranger_id
    end

    RubyTracker::Tracking::EventResponse.new session_id: session_id, status: 0
  end
end
