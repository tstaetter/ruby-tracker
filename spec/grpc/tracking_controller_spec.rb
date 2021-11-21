# frozen_string_literal: true

require 'spec_helper'
require_relative '../../stubs/messages_pb'

describe TrackingController do
  context 'when receiving stream' do
    let :event do
      create :event
    end

    let :metadata do
      { account_id: 'some-id' }
    end

    subject { run_rpc(:CreateEvent, event, active_call_options: { metadata: metadata }) }

    it 'returns an EventResponse' do
      expect(subject).to be_a RubyTracker::Tracking::EventResponse
      expect(subject.status).to eq Tracking::ResponseStatus::SUCCESS
    end
  end
end
