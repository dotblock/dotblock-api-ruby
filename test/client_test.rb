require File.dirname(__FILE__) + '/test_helper.rb'

class DotBlockAPIClientTest < Test::Unit::TestCase
  context "DotBlockAPI Client instance" do
    setup do
      @serverid = ENV['DOTBLOCK_SERVERID']
      @api = DotBlockAPI::Client.new(ENV['DOTBLOCK_USERNAME'], ENV['DOTBLOCK_PASSWORD'])
    end

    context "client info actions" do

      should "return client info" do
        assert_not_nil @api.client_info
      end

      should "update client info" do
        old_info = @api.client_info
        new_info = @api.update_client_info({'firstname' => 'Bender', 'lastname' => 'Rodriguez'})
        assert old_info['firstname'] != new_info['firstname']
        assert old_info['lastname'] != new_info['lastname']
        assert new_info['firstname'] == 'Bender'
        assert new_info['lastname'] == 'Rodriguez'
      end

    end

    context "server actions" do

      should "return list of all servers" do
        assert_not_nil @api.server_list
      end

      should "return info for a server" do
        assert_not_nil @api.server_info(@serverid)
      end

      should "reboot a server" do
        assert @api.reboot_server(@serverid)['response'] == 'success'
      end

      should "boot a server" do
        assert @api.boot_server(@serverid)['response'] == 'success'
      end

      should "suspend a server" do
        assert @api.suspend_server(@serverid)['response'] == 'success'
      end

      should "resume a server" do
        assert @api.resume_server(@serverid)['response'] == 'success'
      end

      should "shutdown a server" do
        assert @api.shutdown_server(@serverid)['response'] == 'success'
      end

    end

  end
end