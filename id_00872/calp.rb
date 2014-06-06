def ppenal(b)
	puts b
	print "size=#{b.size}, "
	print "kinds=#{b.split('').sort.uniq.size}, "
	puts  "penalty=#{b.size * b.split('').sort.uniq.size}\n\n"
end

(:A..:z)
#puts ""
#ppenal("(:A..:z).each{|c|$><<c}")
ppenal("print(('A'to'z')mkString)")
ppenal('print((for(i<-0 to 25)yield"aAあアアあAa"map((_+i)toChar))mkString)')
ppenal('for(i<-0 to 25)print("aAあアアあAa"map(x=>(x+i)toChar)mkString)')
ppenal("('A'to'z')mkString")
ppenal("('A'to'z')map(print)")
ppenal("'A'to'z' map print")
ppenal("'A'to'z'map print")
ppenal("print('A'to'z')")
ppenal("print((``/:'A'to'z')(_+_))")
ppenal("for i in[0:0x3a]:>>chr(i+65)")
ppenal("for i in[65:123]:>>chr(i)")
ppenal("for i in[64:122]:>>chr(++i)")
ppenal("for i in[0101:123]:>>chr(i)")
ppenal("for i in[021:0113]:>>chr(i+060)")
ppenal("char(65:122)")
ppenal('disp("A":"z")')
ppenal("for z in'A'..'z':stdout.write z")
ppenal("say (65..122)>>.chr")
ppenal("print((``/:('A'to'z'))(_+_))")
