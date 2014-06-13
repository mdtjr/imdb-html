module IMDB
	class Nokogiri::XML::Node

		def cast
			pattern = %w{td.ddd td.ellipsis}.detect{ |css_pattern| at(css_pattern) }
			css(pattern).map(&:parent) if pattern
		end

		def tn15content
			at('div#tn15content')
		end

		def p_seasons
			tn15content.at('p').css('a').map{ |a| a["href"][/#season-\K.+/] }.compact
		end

		def episodes_h4
			name == "h4" ? [self] : css('h4')
		end

		def link
			css('@href').count == 1 ? at('@href').value : nil
		end




	end
end