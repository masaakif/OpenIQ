W,H = 4,4
U,D,L,R = 0b1000, 0b0100, 0b0010, 0b0001

@width, @height = W-1, H-1
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@cnt, @cnt1x1 = 0, 0
@cross = []

def search(pos)
  if pos == @width * @height then # end of search
    @cnt += 1
    cell = Array.new(W*H, true)
    @cross.each_with_index{|c,i|
      x,y = i % @width, i / @width
      cell[x + y * W] = false if (c & U == 0) || (c & L == 0)
      cell[(x+1), + 
    }
    return
  end
end
