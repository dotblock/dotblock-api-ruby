require 'json'
require 'net/http'

module DotBlockAPI
  class Client

    def initialize(username, password)
      @username = username
      @password = password
    end

    def ping
      send_request("/v1/ping")
    end

    def client_info
      send_request("/v1/account.json")
    end

    def update_client_info(params = {})
      info = Hash[params.map { |key, val| ["info[#{key}]", val] }]
      send_request("/v1/account.json", 'PUT', info)
    end

    def server_list
      send_request("/v1/servers.json")
    end

    def server_info(id)
      send_request("/v1/servers/#{id}.json")
    end

    def reboot_server(id)
      send_request("/v1/servers/#{id}.json", 'PUT', { "action" => "reboot" })
    end

    def boot_server(id)
      send_request("/v1/servers/#{id}.json", 'PUT', { "action" => "boot" })
    end

    def suspend_server(id)
      send_request("/v1/servers/#{id}.json", 'PUT', { "action" => "suspend" })
    end

    def resume_server(id)
      send_request("/v1/servers/#{id}.json", 'PUT', { "action" => "resume" })
    end

    def shutdown_server(id)
      send_request("/v1/servers/#{id}.json", 'PUT', { "action" => "shutdown" })
    end

  private

    def send_request(url, method = 'GET', params = {})
      url = URI.parse("http://api.dotblock.com#{url}")
      req = case method.to_s.upcase
      when 'GET'
        Net::HTTP::Get.new(url.path)
      when 'PUT'
        Net::HTTP::Put.new(url.path)
      else
        raise "Invalid method"
      end

      req.basic_auth(@username, @password)

      unless method == 'GET' || params.empty?
        req.set_form_data(params)
      end

      res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }

      JSON.parse(res.body)
    rescue
      nil
    end
  end
end
