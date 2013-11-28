require 'simplemvc'

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

require 'my_pages_controller'

module Blog
  class Application < Simplemvc::Application
  end
end
