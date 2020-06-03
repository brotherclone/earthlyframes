class YourTeamRingArchiveController < ApplicationController

  add_breadcrumb "Home", :root_path

  def index
    @no_nav = true
  end
end
