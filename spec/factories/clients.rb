# frozen_string_literal: true

require_relative '../../stubs/messages_pb'

FactoryBot.define do
  factory :client, class: RubyTracker::Tracking::Client do
    id { SecureRandom.uuid }
    server { build :server_client }
  end

  factory :server_client, class: RubyTracker::Tracking::ServerClient do
    os { Gem::Platform.local.os }
    os_version { Gem::Platform.local.version }
    framework { 'ruby' }
  end

  factory :native_client, class: RubyTracker::Tracking::NativeClient do
    os { 'iOS' }
    os_version { '20' }
    platform { 'iPhone' }
  end

  factory :browser_client, class: RubyTracker::Tracking::BrowserClient do
    user_agent do
      %(Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko)
        Version/15.0 Safari/605.1.1)
    end
    navigator { build :navigator_safari }
  end
end
