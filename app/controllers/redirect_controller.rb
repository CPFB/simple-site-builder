class RedirectController < ApplicationController
  def index
		page = Page.find_by_permalink(params[:path])
#		render :text => params.inspect
		redirect_to page_path(page)
  end

end
