def decoder src
  last = src.length - 1
  decoded = ""
  for i in 0..last do
    c = i.even? ? src[i] : (src[i] == 'b' ? src[i-1] : "")
    decoded += c
  end
  decoded
end

open("result.txt").lines do |l|
  results = l.split(" = ")
  puts results[1].chomp + ":" + results[0]
end
