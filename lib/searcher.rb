require 'uri'
require 'cgi'
class Searcher
  SE = {
    :google     => [/^http:\/\/(www\.)?google.*/, 'q'],           
    :yandex     => [/^http:\/\/(www\.)?yandex.*/, 'text'],        
    :yahoo      => [/^http:\/\/search\.yahoo.*/, 'p'],            
    :msn        => [/^http:\/\/search\.msn.*/, 'q'],
    :aol        => [/^http:\/\/search\.aol.*/, 'userQuery'],
    :altavista  => [/^http:\/\/(www\.)?altavista.*/, 'q'],
    :feedster   => [/^http:\/\/(www\.)?feedster.*/, 'q'],
    :lycos      => [/^http:\/\/search\.lycos.*/, 'query'],
    :alltheweb  => [/^http:\/\/(www\.)?alltheweb.*/, 'q']    
  }

  def self.parse(string)
    uri = URI.parse string
    if (s = SE.detect {|v| string.match(v[1][0])})      
      {
        :se => s[0],
        :keywords => CGI.parse(uri.query)[s[1][1]][0]
      }
    else
      nil
    end
  end  
  
end