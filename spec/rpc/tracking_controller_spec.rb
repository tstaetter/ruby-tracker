# frozen_string_literal: true

require 'spec_helper'
require 'stubs/messages_pb'

describe TrackingController do
  context 'when receiving stream' do
    include_context 'Event PB'

    let :metadata do
      { account_id: 'some-id' }
    end

    it 'returns an EventResponse' do
      run_rpc :CreateEvent, event, active_call_options: { metadata: metadata } do |response|
        expect(response).to be_a RubyTracker::Tracking::EventResponse
        expect(response.status).to eq Service::ResponseStatus::SUCCESS
      end
    end
  end
end
