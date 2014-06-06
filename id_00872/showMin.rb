h = Hash.new
open("summary.txt").each_line do |l|
  lang, chooser, penalty, shortest = l.chomp.split("\t").take(4)
  penalty = penalty.split(" ")[0]
  h[lang] = shortest.to_i - penalty.to_i
end

h.sort_by{|l,s| s}.each{|l,s| puts "#{l} = #{s}"}
