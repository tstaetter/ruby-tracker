# frozen_string_literal: true

$LOAD_PATH << __dir__
$LOAD_PATH << "#{__dir__}/stubs"
$LOAD_PATH << "#{__dir__}/config"
$LOAD_PATH << "#{__dir__}/service"
$LOAD_PATH << "#{__dir__}/tracking"
$LOAD_PATH << "#{__dir__}/grpc"

require 'dotenv/load'
require 'gruf'
require 'mongoid'
require 'config/gruf'
require 'grpc/tracking_controller'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

module RubyTracker
  VERSION = '0.0.1'
end
=begin
require 'zeitwerk'

# Create standard loader
loader = Zeitwerk::Loader.new
loader.logger = method(:puts)

# Add relevant dirs to load path
loader.push_dir "#{__dir__}/config"
loader.push_dir "#{__dir__}/stubs"
loader.push_dir "#{__dir__}/service"
loader.push_dir "#{__dir__}/tracking"
loader.push_dir "#{__dir__}/grpc"

loader.setup
loader.eager_load
=end

# cli = Gruf::Cli::Executor.new
# cli.run

server = Gruf::Server.new controllers_path: 'grpc'

server.add_service RubyTracker::Tracking::Tracking::Service
server.start!
