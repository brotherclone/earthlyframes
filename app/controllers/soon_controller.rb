class SoonController < ApplicationController
  def index
    @no_nav = true
    @no_footer = true
  end
end