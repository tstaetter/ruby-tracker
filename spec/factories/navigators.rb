# frozen_string_literal: true

require_relative '../../stubs/messages_pb'

FactoryBot.define do
  factory :navigator_safari, class: RubyTracker::Tracking::Navigator do
    app_code_name { 'Mozilla' }
    app_name { 'Netscape' }
    app_version { '5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15' }
    cookie_enabled { true }
    language { 'de-DE' }
    platform { 'MacIntel' }
    product { 'Gecko' }
    product_sub { '20030107' }
    vendor { 'Apple Computer, Inc.' }
    vendor_sub { '' }
  end

  factory :navigator_chrome, class: RubyTracker::Tracking::NativeClient do
    app_code_name { 'Mozilla' }
    app_name { 'Netscape' }
    app_version { '5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36' }
    cookie_enabled { true }
    language { 'de-DE' }
    platform { 'MacIntel' }
    product { 'Gecko' }
    product_sub { '20100101' }
    vendor { 'Google Inc.' }
    vendor_sub { '' }
  end

  factory :navigator_firefox, class: RubyTracker::Tracking::BrowserClient do
    app_code_name { 'Mozilla' }
    app_name { 'Netscape' }
    app_version { '5.0 (Macintosh)' }
    cookie_enabled { true }
    language { 'de' }
    platform { 'MacIntel' }
    product { 'Gecko' }
    product_sub { '20100101' }
    vendor { '' }
    vendor_sub { '' }
  end
end
