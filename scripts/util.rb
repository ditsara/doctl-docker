require 'json'

module Util
  module_function

  def config
    @config ||= JSON.parse File.read('/app/config.json')
  end
end
