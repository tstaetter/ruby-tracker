# frozen_string_literal: true
require 'gruf'

Gruf.configure do |c|
  # Clear all interceptors
  c.interceptors.clear
  c.interceptors.use Gruf::Interceptors::Instrumentation::RequestLogging::Interceptor,
                     formatter: :plain, log_parameters: true
  
=begin
  c.server_binding_url = Settings.grpc.server.url
  c.backtrace_on_error = !Rails.env.production?
  c.use_exception_message = !Rails.env.production?
  c.rpc_server_options = {
      pool_size: Settings.grpc.server.pool_size,
      pool_keep_alive: Settings.grpc.server.pool_keep_alive,
      poll_period: Settings.grpc.server.poll_period
  }

  if Settings.grpc.server.tokens.to_s.present?
    c.interceptors.use(
        Gruf::Interceptors::Authentication::Basic,
        credentials: Settings.grpc.server.tokens.to_s.split(',').map { |t| { password: t.strip } }
    )
  end
=end
end
