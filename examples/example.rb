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
api.boot_server(123456)

# Reboot server 123456
api.reboot_server(123456)

# Suspend server 123456
api.suspend_server(123456)

# Resume server 123456
api.resume_server(123456)

# Shutdown server 123456
api.shutdown_server(123456)
