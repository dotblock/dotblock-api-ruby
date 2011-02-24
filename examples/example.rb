require 'rubygems'
require 'dotblock_api'

api = DotBlockAPI::Client.new('josh@dotblock.com', 'pwn13s')

# Ping
api.ping

# Get client info
api.client_info

# Update client info
api.update_client_info("firstname" => "Bender", "lastname" => "Rodriguez")

# List servers
api.server_list

# Show server info for 123465
api.server_info(123456)

# Boot server 123456
api.boot(123456)

# Reboot server 123456
api.reboot(123456)

# Suspend server 123456
api.suspend(123456)

# Resume server 123456
api.resume(123456)

# Shutdown server 123456
api.shutdown(123456)
