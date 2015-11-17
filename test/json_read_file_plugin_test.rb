require_relative "test_helper.rb"
require "test/unit"
require_relative "../src/json_read_plugin.rb"

class TestJsonReadPluginApp < Test::Unit::TestCase

    def test_jsonreadfile
        JsonReadPluginPluginApp.new(ARGV)
    end

end
