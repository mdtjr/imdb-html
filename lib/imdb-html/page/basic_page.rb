module IMDB
	module Page
		class BasicPage
			#include HTTParty
			#base_uri IMDB::BASE_URI
			#include IMDB::REGEXP::HTML

			@@save_file ||= File.open("links_memo", "a")



			def self.stub(stub_str)
				self.base_uri File.join self.base_uri, stub_str
			end

			def self.memoize_links io_paths
				io_paths.each_with_index do |path, idx|
					self.commit(path)
					print "\b"*(idx.to_s.length) + idx.to_s + "/#{io_paths.count}"
				end
				self.end
			end






			def target raw_html
				raw_html[ DIV_ID_PAGECONTENT ][ DIV_ID_FOOTER ]
				.sub(BILLBOARD, "")
				.gsub(BR, "")
			end

			def noko
				Nokogiri::HTML.parse target
			end

			def self.links lines
				lines.map do |line|
					line.scan(%r{href=".*?"})
				end
			end

			def self.save_file
				@@save_file
			end

			def self.commit io_path
				save_file.puts links File.readlines(io_path)
			end

			def self.end
				@@save_file.close
			end





		end
	end
end