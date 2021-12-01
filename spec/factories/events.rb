# frozen_string_literal: true

require_relative '../../stubs/messages_pb'

FactoryBot.define do
  factory :event, class: Events::Event do
    identifier {}
    sent_at {}
    created_at {}
    customer_id {}
    client_token {}
    properties { [] }
  end
end
