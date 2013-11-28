require './config/application.rb'

map "/" do
  run HomeController.action(:index)
end

map "/my_pages" do
  map "/about" do
    run MyPagesController.action(:about)
  end
  map "/tell_me" do
    run MyPagesController.action(:tell_me)
  end
end


run Blog::Application.new
