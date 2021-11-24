# frozen_string_literal: true

require 'spec_helper'
require 'stubs/messages_pb'
require 'google/protobuf/timestamp_pb'

shared_context 'Event PB' do
  let :user do
    build :user
  end

  let :client do
    build :client
  end

  let :sent_at do
    Google::Protobuf::Timestamp.new seconds: Time.now.to_i, nanos: 0
  end

  let :properties do
    [
      RubyTracker::Tracking::Property.new(name: 'foo', value: 'bar'),
      RubyTracker::Tracking::Property.new(name: 'lorem', value: 'ipsum')
    ]
  end

  let :event do
    lambda do
      RubyTracker::Tracking::Event.new name: 'Rspec test event',
                                       user: user,
                                       client: client,
                                       sent_at: sent_at,
                                       properties: properties
    end
  end
end
