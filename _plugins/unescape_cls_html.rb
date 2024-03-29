require 'cgi'
require 'citeproc/ruby'

class CiteProc::Ruby::Formats::Html
  def prefix
    CGI.unescape_html options[:prefix]
  end

  def suffix
    CGI.unescape_html options[:suffix]
  end
end