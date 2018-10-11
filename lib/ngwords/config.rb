require 'settingslogic'

module Ngwords
  class Settings < Settingslogic
    source "#{Rails.root}/config/ngwords.yml"
    namespace Rails.env
  end
end
