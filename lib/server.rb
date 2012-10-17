begin
  TCPSocket.open($config[:server], 1666) do |sock|
    sock.puts $config[:api_key]
  
    while data = sock.gets("\0")
      p [:data, data] if $debug
      data = data.delete("\0")
      message = YAML.load(data)
      TerminalNotifier.notify message[:title], {
        :title => "Gistflow Notifier",
        :open  => message[:url]
      }
    end
  end
rescue => e
  puts e.to_s if $debug
  sleep 60
  retry
end