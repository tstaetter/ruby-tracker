# frozen_string_literal: true

require_relative '../../stubs/messages_pb'

FactoryBot.define do
  factory :user, class: RubyTracker::Tracking::User do
    stranger_id { SecureRandom.uuid }
    external_id { SecureRandom.uuid }
    email { "hugo-#{SecureRandom.alphanumeric 10}@boss.com" }
  end
end
