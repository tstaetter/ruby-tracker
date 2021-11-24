# frozen_string_literal: true

require 'spec_helper'

describe RubyTracker::Tracking::EventResponse do
  context 'when initializing' do
    it 'can create a response w/ valid parameters' do
      expect do
        RubyTracker::Tracking::EventResponse.new session_id: SecureRandom.uuid,
                                                 status: Service::ResponseStatus::UNKNOWN,
                                                 message: 'lorem ipsum'
      end.to_not raise_error
    end

    pending 'cannot create a response w/o required parameters' do
      expect do
        RubyTracker::Tracking::EventResponse.new session_id: SecureRandom.uuid
      end.to raise_error
    end
  end
end
