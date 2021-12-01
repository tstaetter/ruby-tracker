# frozen_string_literal: true

module Events
  # Event PORO for further processing
  class Event
    attr_reader :identifier, # event identifier
                :sent_at, # Time the event was sent by the client
                :created_at, # Time the event was created at
                :customer_id, # The client ID object identifying the customer (user, 3rd party etc.)
                :client_token, # Token uniquely identifies the client
                :properties # Key/value pairs (String => Object)

    class << self
      # Generate new event from protobuf event
      # @param [RubyTracker::Tracking::Event] event_pb
      # @return [Events::Event]
      def from_pb(event_pb)
        new.tap do |ne|
          ne.identifier = event_pb.name
          ne.sent_at = Time.at(event_pb.sent_at.seconds, event_pb.sent_at.nanos / 10**6)
          ne.created_at = Time.now
          ne.properties = event_pb.properties.map { |p| [p.name, p.value] }.to_h
        end
      end
    end
  end
end
