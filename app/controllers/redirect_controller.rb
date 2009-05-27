class RedirectController < ApplicationController
  def index
		page = Page.find(:first, :conditions => ["permalink LIKE ?", "#{params[:path].first}%"])
#		render :text => params.inspect
		redirect_to page_path(page)
  end

end
