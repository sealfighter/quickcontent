module PagesHelper

	def breadcrumb(page)

		links = Array.new()
		#links.push(page)
		parent_id = page.id

		while parent_id > 0 
			page_link = Page.find(parent_id)
			if page_link.page_id == 0 
				page_link.title = "Home"
			end
			links.push(page_link)
			parent_id = page_link.page_id
		end

		return links.reverse
	end

end
