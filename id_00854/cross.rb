class State
  attr_reader :lshs, :rshs, :canoe, :sp

  def initialize(lshs, rshs, canoe, sp)
    (@lshs, @rshs, @canoe, @sp) = [lshs, rshs, canoe, sp]
  end

  def safe?
    @lshs.safe? && @rshs.safe?
  end

  def stacked?
    @lshs.size > 0 && @sp.size == 0
  end

  def done?
    @lshs.size == 0
  end

  def same?(lsh, rsh, canoe)
    @lshs.to_s == lsh.to_s && @rshs.to_s == rsh.to_s && @canoe.position == canoe.position
  end
end

class Path
  attr_reader :stateSets
  def initialize
    @stateSets = Array.new
  end

  def push(cs)
    @stateSets.push(cs)
  end

  def pop
    @stateSets.pop
  end

  def dup?(l_lsh, l_rsh, canoe)
    @stateSets.any?{|x| x.same?(l_lsh, l_rsh, canoe)}
  end
end

class ShorePicker
  attr_reader :capacity, :shore, :cmb
  def initialize(capa,shore)
    @capacity = capa
    @shore = shore
    @cmb = createCmb
  end

  def size
    @cmb.size
  end

  def pickup
    @cmb.pop.split('')
  end
  
private
  def createCmb
    tary = Array.new
    (1..@capacity).each do |i|
      n = @shore.count - (i - 1)
      n.times do |j|
        t = @shore.to_s[j,i]
        next if tary.any?{|x| x == t}
        tary.push(t)
      end
    end
    tary
  end
end

class Shore
  attr_reader :soldiers, :giants, :name

  def initialize(name, member)
    @name = name
    @soldiers = Array.new
    @giants = Array.new
    add(member.split(""))
  end

  def count
    @soldiers.size + @giants.size
  end

  def safe?
    @soldiers.size >= @giants.size
  end

  def empty?
    (@soldiers.size + @giants.size) == 0
  end

  def add(member)
    member.each do |c|
      c == "S" ? @soldiers.push(c) : @giants.push(c)
    end
  end

  def clone
    Shore.new(@name, to_s)
  end

  def to_s
    "#{@soldiers.join('')}#{@giants.join('')}"
  end
end

class Canoe
  attr_reader :clue, :position
  def initialize(shore)
    @clue = Array.new()
    @position = shore.name
  end

  def ride(c)
    @clue.push(c)
  end

  def move(left, right)
    if @position == left.name
      @position = right.name
      right.add(@clue)
    else
      @position = left.name
      left.add(@clue)
    end
    unload
  end

  def unload
    @clue = Array.new()
  end

  def clone
    ca = Canoe.new(Shore.new(@position, ""))
    @clue.each do |c|
      ca.ride(c)
    end
    ca
  end

  def to_s
    "/(#{@position[0]})#{clue.join('')}/"
  end
end

his = Path.new
lsh_start = Shore.new("Left","SSSTTT")
rsh_start = Shore.new("Right","")
ca_start = Canoe.new(lsh_start)

canoe = ca_start.clone
sp = ShorePicker.new(2,lsh_start)
puts "start #{sp.cmb}"
puts "pickup #{sp.pickup}"
puts "remain #{sp.cmb}"
