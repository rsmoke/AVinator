require 'faye/websocket'
require 'eventmachine'
require "rack"
require "thin"
require 'em-redis'

app = lambda do |env|
  EM.run {
    redis = EM::Protocols::Redis.connect
    redis.errback do |code|
      puts "Error code: #{code}"
    end
    ws = Faye::WebSocket::Client.new('ws://141.213.179.84:32123')
  
    ws.on :open do |event|
      p [:open]
      ws.send("{'LSARoom': {'Password': 'LSAPassword'}}")
    end
  
    ws.on :message do |event|
      p "We are responding"
      redis.set "LSARoom", event.data do |response|
        redis.get "LSARoom" do |response|
          p response
        end
      end
      # p [:message, event.data]
    end
  
    ws.on :close do |event|
      p [:close, event.code, event.reason]
      ws = nil
    end
  }
end

Rack::Handler::Thin.run app
