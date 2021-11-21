# frozen_string_literal: true

require 'spec_helper'

describe Tracking::TrackingService do
  context 'when initializing' do
    it 'can create instance' do
      expect do
        described_class.new
      end.to_not raise_error
    end

    it 'can startup the service' do
      expect do
        described_class.new.startup
      end.to_not raise_error
    end
  end

  context 'when retrieving status' do
    it 'returns status "INITIALIZING" after initialization' do
      expect(described_class.new.status).to eq Service::ServiceStatus::INITIALIZING
    end

    it 'returns status "RUNNING" after startup' do
      expect(described_class.new.startup).to eq Service::ServiceStatus::RUNNING
    end
  end
end
