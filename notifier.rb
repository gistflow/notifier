require 'socket'

Socket.tcp('0.0.0.0', 1666) do |sock|
  sock.puts "123"
  
  while message = sock.gets
    TerminalNotifier.notify message, title: "New notification"
  end
end
