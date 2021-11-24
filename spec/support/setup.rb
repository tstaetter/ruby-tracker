# frozen_string_literal: true

dir = File.realpath '.'

$LOAD_PATH.unshift "#{dir}/grpc"
$LOAD_PATH.unshift "#{dir}/tracking"
$LOAD_PATH.unshift "#{dir}/service"
# $LOAD_PATH.unshift "#{dir}/config"
$LOAD_PATH.unshift "#{dir}/stubs"
$LOAD_PATH.unshift dir

require 'dotenv/load'
require 'gruf'
require 'tracking/tracking_service'
require 'service/service_status'
require 'service/response_status'
require 'grpc/tracking_controller'

require_relative './event_context'
