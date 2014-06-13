module IMDB
	module Data
		class Show
			include HTTParty
			base_uri 'www.imdb.com'
			headers 'Content-Type' => 'utf-8'

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
				Episode.parse_params( noko "epcast" )
			end

			def json_path
				File.join "/home/mdt/g/imdb-memo/json/#{tt}.json"
			end

			def self.process tt
				show = Show.new tt
				File.open show.json_path, "w" do |j|
					j.puts JSON.pretty_generate( show.episodes )
				end
			end






		end
	end
end