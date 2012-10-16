require 'socket'
require 'terminal-notifier'
require 'yaml'
require 'json'

log_path = File.expand_path('../log', __FILE__)
$stdout.reopen("#{log_path}/stdout.log", "w+")
$stderr.reopen("#{log_path}/stderr.log", "w+")

$debug = !!ENV['TEST']
$config = YAML.load_file(File.expand_path('../config.yml', __FILE__))

if $debug
  $config[:server] = '0.0.0.0'
  $config[:api_key] = '123'
end

# require File.expand_path('../lib/customization', __FILE__)
require File.expand_path('../lib/server', __FILE__)