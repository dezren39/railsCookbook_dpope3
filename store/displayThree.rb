numbers = Array.new 
3.times do |i|
print "Enter a number: "
numbers[i] = gets
numbers[i].chop!
end
numbers.each{|n| print "#{n}\n"}