module BbcodeHelper
	def parse_bbcode(param_string)
		# use parse_text in views to turn bbcode into appropriate html
		# Simple Text Styling
		param_string.gsub!( /\[b\](.*?)\[\/b\]/im, '<span style="font-weight: bold;">\1</span>' )
		param_string.gsub!( /\[u\](.*?)\[\/u\]/im, '<span style="text-decoration: underline;">\1</span>' )
		param_string.gsub!( /\[i\](.*?)\[\/i\]/im, '<span style="font-style: italic;">\1</span>' )
		
		# size and color
		param_string.gsub!( /\[size=['"]?(.*?)['"]?\](.*?)\[\/size\]/im, '<span style="font-size: \1px;">\2</span>' )
		param_string.gsub!( /\[color=['"]?(.*?)['"]?\](.*?)\[\/color\]/im, '<span style="color: \1;">\2</span>' )
 
		# images
		param_string.gsub!( /\[img size=['"]?(\d+)x(\d+)['"]?\](.*?)\[\/img\]/i, '<img src="\3" style="width: \1px; height: \2px;" />' )
		param_string.gsub!( /\[img\](.*?)\[\/img\]/i, '<img src="\1" />' )  
 
		# urls
		param_string.gsub!(/\[url target=['"]blank['"]\]([^\[]+?)\[\/url\]/i, "<a href=\"\1\" target=\"_blank\">\1</a>")
		param_string.gsub!(/\[url=['"]?(.*?)['"]? target=['"]?_?blank['"]?\](.+?)\[\/url\]/i, "<a href=\"\1\" target=\"_blank\">\2</a>")
		param_string.gsub!(/\[url\]([^\[]+?)\[\/url\]/i, "<a href=\"\1\">\1</a>")
		param_string.gsub!(/\[url=['"]?(.*?)['"]?\](.+?)\[\/url\]/i, "<a href=\"\1\">\2</a>")
 
		# youtube and google videos
		param_string.gsub!( /\[youtube\](.*?)\?v=([\w\d\-]+)\[\/youtube\]/i, '<object width="400" height="330"><param name="movie" value="http://www.youtube.com/v/\2"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/\2" type="application/x-shockwave-flash" wmode="transparent" width="400" height="330"></embed></object>' )
    param_string.gsub!( /\[youtube\](.*?)\/v\/([\w\d\-]+)\[\/youtube\]/i, '<object width="400" height="330"><param name="movie" value="http://www.youtube.com/v/\2"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/\2" type="application/x-shockwave-flash" wmode="transparent" width="400" height="330"></embed></object>' )
    param_string.gsub!( /\[gvideo\](.*?)\?docid=([-]{0,1}\d+)\[\/gvideo\]/i, '<embed style="width:400px; height:326px;" id="VideoPlayback" type="application/x-shockwave-flash" src="http://video.google.com/googleplayer.swf?docId=\2" flashvars=""> </embed>' )
 
		return param_string
	end
	
	def parse_text(param_string)
		strip_html(param_string)
		parse_bbcode(param_string)
		parse_spacing(param_string)
		return param_string
	end
 
	# escape < and > to remove any html
	def strip_html(param_string)
		param_string.gsub!('<', '&lt;')
		param_string.gsub!('>', '&gt;')
		return param_string
	end
 
	# turn new lines into <br /> to format the spacing properly
	def parse_spacing(param_string)
		param_string.gsub!( /\r\n?/, "\n" )
		param_string.gsub!( /\n/, "<br />" )
		return param_string
	end
end