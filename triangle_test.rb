# import triangle data from text file and populate my triangle array
my_triangle = []
File.open("triangle.txt", "r").each_line do |line|
   temp = line.chomp.split("\n")
   temp = temp[0].split(" ")
   temp_to_i = temp.map do |num|
      num.to_i
   end
   my_triangle << temp_to_i
end

# prepare a number in first triangle row and the numbers in the row below that number
number = 0
number1 = 0
# prepare my final sum
final_sum = 0
final_sum += my_triangle[number][number1]

# find the number of rows in my triangle
times = (my_triangle.length - 1)

# iterate through my triangle's rows and find the best numbers in the row below each current number
times.times do
  if my_triangle[number+1][number1] < my_triangle[number+1][number1+1]
    number1 = number1 +1
  end

# add the best number from the next triangle row to my total sum
  final_sum += my_triangle[number+1][number1]

  number = number+1
end

# return best possible answer from this triangle
puts final_sum























