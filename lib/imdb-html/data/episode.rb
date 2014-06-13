module IMDB
	module Data
		class Episode
			include IMDB::REGEXP

			def self.parse_params noko_h4
				noko_h4.episodes_h4.map do |h4|
					self.new(h4).to_h
				end
			end



			def initialize noko_h4
				@h4 = noko_h4
			end
			attr_reader :h4

			def season_number
				num = h4.text[ CONTENT::SEASON ]
				num ? num.rjust(2,'0') : "??"
			end
			def episode_number
				num = h4.text[ CONTENT::EPISODE ]
				num ? num.rjust(2,'0') : "??"
			end
			def se
				["S", season_number, "E", episode_number].join
			end
			def title
				h4.at('a').text
			end
			def tt
				h4.at('a')["href"][ HTML::TT ]
			end
			def date
				Date.parse h4.next_element.text
			end
			def description
				h4.next_element.next_element.next.text
			end
			def cast
				h4.next_element.next_element.next_element.next_element.cast.map do |elem|
					credit = IMDB::Data::Credit.new elem
					{:name => credit.name, :nm => credit.nm.nil? ? 0 : credit.nm.to_i, :roles => credit.roles}
				end rescue nil
			end
			def to_h
				hash = {:se => se, :title => title}
				hash[:tt] = tt.to_i if tt
				hash[:air_date] = date
				hash[:description] = description.empty? ? nil : description
				hash[:cast] = cast
				hash
			end





		end
	end
end