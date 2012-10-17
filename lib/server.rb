begin
  $stdout.puts "it works #{Time.now}"
  Socket.tcp($config[:server], 1666) do |sock|
    sock.puts $config[:api_key]
  
    while data = sock.gets
      p [:data, data] if $debug
      message = YAML.parse(data)
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