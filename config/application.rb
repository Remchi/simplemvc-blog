require 'simplemvc'

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

module Blog
  class Application < Simplemvc::Application
  end
end
