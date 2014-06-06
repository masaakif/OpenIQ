require 'date'

mon = ARGV[0].to_i
year = ARGV[1].to_i

puts " Su Mo Tu We Th Fr Sa"
line = ""

(1..31).each do |d|
  next unless Date::exist?(year, mon, d)
  day = Date.new(year, mon, d)
  if day.wday == 0 then
    puts line
    line = ""
  end 
  line = " " * day.wday * 3 if line == ""
  line += " " * (2 - Math::log10(d).to_i) + d.to_s
end

puts line
