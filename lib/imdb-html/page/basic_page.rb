module IMDB
	module Page
		class BasicPage
			include HTTParty
			base_uri IMDB::BASE_URI
			include IMDB::REGEXP::HTML

			def self.stub(stub_str)
				self.base_uri File.join self.base_uri, stub_str
			end



			def target raw_html
				raw_html[ DIV_ID_PAGECONTENT ][ DIV_ID_FOOTER ]
				.sub(BILLBOARD, "")
				.gsub(BR, "")
			end

			def noko
				Nokogiri::HTML.parse target
			end







		end
	end
end