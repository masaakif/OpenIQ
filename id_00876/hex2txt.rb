def convert(input)
  input.split('\\').map do |s|
    a = (s[0] == 'x') ? s[1..-1].hex : s.oct
    print a.chr
  end
  puts ""
end

open("hex.txt").each_line do |l|
  convert(l.chomp)
end

