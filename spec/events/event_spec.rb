# frozen_string_literal: true

require 'spec_helper'
require 'events/event'

describe Events::Event do
  context 'when creating from protocol buffer event' do
    let :event do
      build :event
    end

    let :event_pb do
      RubyTracker::Tracking::Event.decode_json File.read('spec/fixtures/event.json')
    end

    it 'creates an event object from a PB event' do
      expect(described_class.from_pb(event_pb)).to eq event
    end
  end
end
