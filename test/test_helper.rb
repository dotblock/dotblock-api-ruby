require 'rubygems'
require 'test/unit'
require 'shoulda'

begin
  require 'turn'
rescue LoadError
end

require 'dotblock_api'

if ENV['DOTBLOCK_USERNAME'].nil? || ENV['DOTBLOCK_PASSWORD'].nil? || ENV['DOTBLOCK_SERVERID'].nil?
  abort <<-MSG

  Run tests with DOTBLOCK_USERNAME, DOTBLOCK_PASSWORD, and DOTBLOCK_SERVERID eg:

  DOTBLOCK_USERNAME=josh@dotblock.com DOTBLOCK_PASSWORD=pwn13s DOTBLOCK_SERVERID=123456 rake test

  MSG
end