require 'net/http'
require 'uri'

open("words.txt").lines do |w|
  w.chomp!
  a = Net::HTTP.get URI.parse("http://try.undo.jp/spacetalky/api.cgi?input=#{w}")
  puts "#{w} = #{a}"
end
