class TagsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @tag = Tag.find_by(:uuid => params[:uuid])
    respond_to do |format|
      format.json {render :json => @tag}
    end

  end

end
