Socket.tcp($config[:server], 1666) do |sock|
  sock.puts $config[:api_key]
  
  while message = sock.gets
    p [:message, message] if $debug
    TerminalNotifier.notify message, title: "Gistflow"
  end
end
