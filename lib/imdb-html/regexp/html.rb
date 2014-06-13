module IMDB
	module REGEXP
		module HTML
			DIV_ID_FOOTER = %r{^\s+<div id="footer".+}m
			DIV_ID_PAGECONTENT = %r{^\s+<div id="pagecontent">.+}m
			LINK_REL_CANONICAL = %r{^\s+<link rel="canonical" href="(.*?)">}
			TITLE = %r{<title>(.*?)</title>}
			META_CONTENT_TYPE = %r{<meta http-equiv="content-type" content="(.*?)">}

			BILLBOARD = %r{<!-- begin injectable INJECTED_BILLBOARD.*?<!-- _get_ad_for_slot(INJECTED_BILLBOARD) -->}m
			BR = %r{<br.*?>}


			TT = %r{/title/tt\K[0-9]+}
			NM = %r{/name/nm\K[0-9]+}
			CH = %r{/character/ch\K[0-9]+}

			TD_NM = %r{<td class="nm"><a href="/name/nm([0-9]+)/">(.*?)</a></td>}
			TD_DDD = %r{<td class="ddd"> \.\.\. </td>}
			IN_PARENS = %r{\((.*?)\)}
			CHAR_CREDIT = %r{<a href="/character/ch([0-9]+)/">(.*?)</a>(?:\s+#{ IN_PARENS })*}
			TD_CHAR = %r{<td class="char">(?:#{ CHAR_CREDIT })(?: / #{ CHAR_CREDIT })*</td> }

			LINK = %r{<a href="/([a-z]+)/([a-z]{2})([0-9]+)/.*?".?>\s*?(\S.*?)</a>}
			LINK_PLUS_PARENS = %r{#{LINK}(?:\s*?#{IN_PARENS})*}

			SPLIT_BEFORE_PAREN = %r{ (?=\()}





		end

	end
end