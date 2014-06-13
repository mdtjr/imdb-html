module IMDB
	module Data
		class Show
			include HTTParty
			base_uri 'www.imdb.com'

			def initialize tt
				@tt = tt.to_i
			end

			def tt
				@tt.to_s.rjust 7, '0'
			end
			def path *args
				File.join *["/title/tt#{tt}", args].flatten
			end
			def http *args
				self.class.get path *args
			end
			def noko *args
				Nokogiri::HTML http *args
			end


			def episodes
				@episodes ||= Episode.parse_params( noko "epcast" )
			end








		end
	end
end