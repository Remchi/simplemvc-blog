class MyPagesController < Simplemvc::Controller
  def about
    render :about, name: "Rem", last_name: "Zolotykh"
  end
end
