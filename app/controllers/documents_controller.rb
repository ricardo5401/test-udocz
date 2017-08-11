class DocumentsController < ApplicationController

	def upload
	end  

	def read
		result = ReadService.new(params).call
		if params[:title_url] && result["status"].to_i == 202
			#@props = result
			#@props["default_assets"] = @default_assets
			#load_page
			#@turbolink = true
			set_meta(result)
		else
			redirect_to '/404'
        end
	end

	private

	def set_meta(result)
		doc = result["document"]
		user = result["user"]
		@metas[:url] = Network.BASE_URL
		@metas[:title] = doc["title"]
		@metas[:description] = doc["summary"] if doc["summary"]
		@metas[:image] = doc["cover"]["url"]
		@metas[:published] = user["username"]
		@metas[:keywords] += ", " + user["username"] + ", " + doc["title"]
	end

	def load_page
		if @props["document"]["html_url"]
			page = Client.get( @props["document"]["html_url"] )
			@head = (page.split('<head>')[1]).split('</head>')[0]
			@head = @head.gsub('<meta charset="utf-8"/>','').
				gsub('<meta name="generator" content="pdf2htmlEX"/>','').
				gsub('<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>','').
				gsub("this.sidebar.classList.add('opened');", '{}').
				gsub("this.cur_page_idx = max_visible_page_idx;", 
				"this.cur_page_idx = max_visible_page_idx; var input = document.getElementById('text-index'); 
				if(input !== undefined){ input.value = (max_visible_page_idx + 1) }").
				gsub("window.history.replaceState(cur_hash, '', '#' + cur_hash);", "").
				gsub("window.history.pushState(detail_str, '', '#' + detail_str);", "")
			body = (page.split('<body>')[1]).split('</body>')[0]
			content = body.split('<div id="page-container">')
			content2 = (content[1]).split('</div>'+"\n"+'<div class="loading-indicator">')
			@sidebar = content[0]
			@page_container = content2[0]
			@loading = '<div class="loading-indicator">' + content2[1]
			base = @props["document"]["html_url"].split(@props["document"]["id"].to_s + "_opt.html")[0]
			base = base.gsub('s3-website-us-east-1', 's3')
			base = base.gsub('http', 'https')
			_search = @props["document"]["id"].to_s + '_opt'
			base += _search
			@page_container = @page_container.gsub(_search, base)
		end
	end

end
