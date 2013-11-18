class PagesController < ApplicationController
	def index
		@page = Page.where({page_id: 0}).first
	end

	def all
		@pages = Page.all
	end

	def show
		@page = Page.find(params[:id])
	end

	def edit
	  @page = Page.find(params[:id])
	end

	 def update
	  @page = Page.find(params[:id])
	 
	  if @page.update(post_params)
	    redirect_to @page
	  else
	    render 'edit'
	  end
	end

	def new
		@page = Page.new
		@parent_id = parent_id
	end

	def create	
	  @page = Page.new(post_params)
	  
	  if parent_id > 0
	  	@parent_page = Page.find(parent_id)
	  	@page = @parent_page.pages.create(post_params)
	  end
	 
	  if @page.save
	    redirect_to @page
	  else
	    render 'new'
	  end
	end

	private
	  def post_params
	    params.require(:page).permit(:title, :summary, :body, :view, :type, :access)
	  end

	  def parent_id
	  	(params[:parent_id]) ? Integer(params[:parent_id]) : 0
	  end
end
