class AboutController < ApplicationController
  add_breadcrumb "Home", :root_path
  def index
    add_breadcrumb "About", :about_path
  end
end