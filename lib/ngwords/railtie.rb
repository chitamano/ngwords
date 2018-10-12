module Ngwords
  class Railtie < ::Rails::Railtie
    initializer 'ngwords' do |_app|
      ActiveSupport.on_load :after_initialize do
        require 'ngwords/config'
      end
    end
  end
end
