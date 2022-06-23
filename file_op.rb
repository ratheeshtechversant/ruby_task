# The filename with a timestamp in it’s name
# (the format of the timestamp date should be “anyfilename_22ndSep202009:52”.

tstamp = Time.now.strftime '_%d%b%Y%H:%M'
f = File.open("file.txt","r")
# f2 = File.new("file#{tstamp}.txt","w")
# f2.puts(f.map{|x| x})
# f2.puts(f.read)
# puts f.read

# Use the iterators: collect and map for looping.

# f.collect do |x|
#   puts x
# end
# f.map do |x|
#   puts x
# end
# puts f.collect { |e| e}
# puts f.map { |e| e}

# Calculate the number of duplicate occurrences of an alphabet
# and record it into another file as a hash.
a = f.read.split(//)
# puts a
b = []
dup_alph = {}
arr_count = []
(a.each{|x| b << x.downcase if x.match(/[A-Za-z]/)})
b_uniq = b.uniq
b_uniq.each do |x|
  count = 0
    b.each{|y| count +=1 if x == y}
  dup_alph[x] = count -1
  arr_count << count-1
end
h1 = File.new("hash.txt","w+")
h1.puts(dup_alph)

# Use iterator “inject” to calculate the sum total of duplicate occurrences.
sum = arr_count.inject(:+)
puts sum

# Print out the special characters found in the file by implementing a custom exception.
class MyError < StandardError
  attr_reader:special
  def initialize(arr)
    @special = arr.select{|x| x if x.match(/[!£$@%^&*():<>?:;~#_+-\/\\]/)}
  end
end

begin
  raise MyError.new(a)
rescue => e
  puts e.special
end
# a.each {|x| puts x if x.match(/[!£$@%^&*():<>?:;~#_+-\/\\]/)}
