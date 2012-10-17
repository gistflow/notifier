log_path = File.expand_path('../log', __FILE__)
$stdout.reopen("#{log_path}/stdout.log", "wb")
$stderr.reopen("#{log_path}/stderr.log", "wb")

$LOAD_PATH << File.expand_path('../vendor/bundle/ruby/1.9.1/gems/terminal-notifier-1.4.2/lib/', __FILE__)
$LOAD_PATH << File.expand_path('../vendor/bundle/ruby/1.9.1/gems/json-1.7.5/lib/', __FILE__)

require 'terminal-notifier'
require 'yaml'
require 'socket'
require 'yaml'

$debug = !!ENV['TEST']
$config = YAML.load_file(File.expand_path('../config.yml', __FILE__))

if $debug
  $config[:server] = '0.0.0.0'
  $config[:api_key] = '123'
end

# require File.expand_path('../lib/customization', __FILE__)
require File.expand_path('../lib/server', __FILE__)