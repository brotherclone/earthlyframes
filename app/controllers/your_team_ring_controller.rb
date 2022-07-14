class YourTeamRingController < ApplicationController
  add_breadcrumb "Home", :root_path
  def index
    add_breadcrumb "Your Team Ring", :your_team_ring_path
  end
end