require 'date'

class Ticket
  attr_reader :name, :sd, :ed, :country
  def initialize(line)
    @name = line
    @country = line.split(" ")[0]
    (@sd,@ed) = line.split(" ")[1].split("-").map{|x| Date.strptime("2000/#{x}","%Y/%m/%d")}
  end
  
  def to_s
    " #{@country}"
  end
end

class PackageCreator
  def self.create(ary)
    createMain(ary, Array.new)
  end

private
  def self.createMain(orig, dest)
    t = dest.empty? ? find(orig, nil) : find(orig, dest.last)

    if t.nil? 
      dest
    else
      createMain(orig, dest.push(t))
    end
  end

  def self.find(ary, ticket)
    t_ary = ticket.nil? ? ary : ary.find_all{|x| (x.sd - ticket.ed) > 0}
    t_ary.size == 0 ? nil : t_ary.sort{|x,y| x.ed <=> y.ed}[0]
  end
end

a = Array.new

open("tickets.txt").lines do |l|
  a.push(Ticket.new(l.chomp))
end

answer = PackageCreator.create(a)
print answer.size
puts answer.sort{|x,y| x.country <=> y.country}.join
