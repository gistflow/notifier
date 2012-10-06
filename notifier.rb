require 'socket'
require 'terminal-notifier'

$debug = ENV['TEST'] == 'yep'

Socket.tcp('0.0.0.0', 1666) do |sock|
  sock.puts "123"
  
  while message = sock.gets
    p [:message, message] if $debug
    TerminalNotifier.notify message, title: "New notification"
  end
end
