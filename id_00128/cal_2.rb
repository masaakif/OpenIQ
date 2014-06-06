require 'date'

mon = ARGV[0].to_i
year = ARGV[1].to_i

calendar = "\n%14s\n\n" % "#{year}/#{mon}" + " Su Mo Tu We Th Fr Sa"

if Date::exist?(year, mon, 1)
  first_date = Date.new(year, mon, 1)
  calendar += "\n" + " " * first_date.wday * 3
else
  puts "invalid parameters given, Year = #{year}, Month = #{mon}" 
  exit
end

(1..31).each do |d|
  next unless Date::exist?(year, mon, d)
  calendar += "\n" if Date::new(year,mon, d).wday == 0 and d > 1
  calendar += "%3d" % d
end

puts calendar
