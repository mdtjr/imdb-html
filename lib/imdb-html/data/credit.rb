module IMDB
	module Data
		class Credit
			include IMDB::REGEXP::HTML

			def initialize noko_tr
				@tr = noko_tr
			end
			attr_reader :tr

			def name
				tr.at('td.nm').text
			end
			def nm
				tr.at('td.nm a')["href"][ NM ]
			end
			def roles
				roles, parens = tr.at('td.char').inner_html.split( SPLIT_BEFORE_PAREN )
				roles = "" unless roles
				parens = "" unless parens

				etc = parens.scan( IN_PARENS ).flatten
				roles.split(" / ").map do |role|

					name_of_role = role.gsub(%r{<.*?>},"").strip
					role_ch = role[ CH ]

					hash = {:char => name_of_role}
					hash[:ch] = role_ch.to_i if role_ch
					etc.each{ |thing| hash[ thing.to_sym ] = true }
					hash
				end
			end





		end
	end
end