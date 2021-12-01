# frozen_string_literal: true

require_relative '../../stubs/messages_pb'
require 'google/protobuf/timestamp_pb'
require 'google/protobuf/repeated_field'

FactoryBot.define do
  factory :event_pb, class: RubyTracker::Tracking::Event do
    name { 'Rspec test event' }
    user { build :user }
    client { build :client }
    sent_at { Google::Protobuf::Timestamp.new seconds: Time.now.to_i, nanos: 0 }
    properties {
      Google::Protobuf::RepeatedField.new :'ruby_tracker.tracking.Property', [RubyTracker::Tracking::Property.new(name: 'foo', value: 'bar'), RubyTracker::Tracking::Property.new(name: 'lorem', value: 'ipsum')]
    }
  end
end
