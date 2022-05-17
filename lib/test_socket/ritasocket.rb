#!/usr/bin/env ruby

# var exampleSocket = new WebSocket("ws://141.213.179.84:32123");
# exampleSocket.onopen = function (event) {
#   exampleSocket.send("{'LSARoom': {'Password': 'LSAPassword'}}");
# };
# exampleSocket.onmessage = function (event) {
#   console.log(event.data);
# }


# exampleSocket.send("{'LSARoom':{'BooleanOutputs': {'Turn System On': true},'Password': 'LSAPassword'}}");

# exampleSocket.close();


# -=-=-=--=-=--=-=-=--=-=-=-=

# require 'socket'

# # s = Socket.new Socket::AF_INET, Socket::SOCK_STREAM

# # s.connect Socket.packet_sockaddr_in(80, 'ws://141.213.179.84:32123')

# s = TCPSocket.new("141.213.179.84", 32123)

# # s.send("{'LSARoom':{'Password': 'LSAPassword'}}")
# s.write "{'LSARoom':{'Password': 'LSAPassword'}}"

# while line = s.gets # Read lines from socket
#   puts line         # and print them
# end

# s.close             # close socket when done

# -=-=-=--=-=--=-=-=--=-=-=-=

# require 'websocket-client-simple'

# ws = WebSocket::Client::Simple.connect 'ws://141.213.179.84:32123'

# ws.on :message do |msg|
#   puts msg.data
# end

# ws.on :open do
#   ws.send "{'LSARoom': {'Password': 'LSAPassword'}}"
# end

# -=-=-=--=-=--=-=-=--=-=-=-=

# #!/usr/bin/env ruby
# $:.unshift File.expand_path '../lib', File.dirname(__FILE__)
# require 'websocket-client-simple'

# puts "websocket-client-simple v#{WebSocket::Client::Simple::VERSION}"

# url = ARGV.shift || 'ws://141.213.179.84:32123'

# ws = WebSocket::Client::Simple.connect url

# # ws.on :open do
#   ws.send "{'LSARoom': {'Password': 'LSAPassword'}}"
# # end

# ws.on :message do |msg|
#   puts ">> #{msg.data}"
# end

# ws.on :open do
#   puts "-- websocket open (#{ws.url})"
# end

# ws.on :close do |e|
#   puts "-- websocket close (#{e.inspect})"
#   exit 1
# end

# ws.on :error do |e|
#   puts "-- error (#{e.inspect})"
# end

# loop do
#   ws.send STDIN.gets.strip
# end



# require 'socket'
# port = (ARGV[0] || 32123).to_i
# server = TCPServer.new('141.213.179.84', port)
# while (session = server.accept)
#   puts "Request: #{session.gets}"
#   session.print "HTTP/1.1 200/OK\r\nContent-type: text/html\r\n\r\n"
#   session.print "<html><body><h1>#{Time.now}</h1></body></html>\r\n"
#   session.close
# end


# require 'rubygems'
require 'websocket-client-simple'

ws = WebSocket::Client::Simple.connect 'ws://141.213.179.84:32123'

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  ws.send "{'LSARoom': {'Password': 'LSAPassword'}}"
end

ws.on :close do |e|
  p e
  exit 1
end

ws.on :error do |e|
  p e
end

loop do
#   puts "Enter a thing: "
  # ws.send STDIN.gets.strip
#   puts "Rita said so::"
  # ws.send "{'LSARoom':{'BooleanOutputs': {'Turn System On': true},'Password': 'LSAPassword'}}"
  ws.send "{'LSARoom': {'Password': 'LSAPassword'}}"
end