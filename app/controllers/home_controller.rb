class HomeController < ApplicationController

  add_breadcrumb "Home", :root_path

  def index
    @cardholder = []
  end

end
