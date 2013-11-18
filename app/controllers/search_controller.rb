
class SearchController < ApplicationController

	def index
		
		query = params[:q]
		
		#@pages = Page.where("title LIKE :sq OR summary LIKE :sq OR body LIKE :sq ", {:sq => "%#{query}%"})

		@search = Page.search do
					  fulltext query
					  paginate :page => 1, :per_page => 10
					end

		@pages = @search.results
	end

end
