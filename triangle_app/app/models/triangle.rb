# == Schema Information
#
# Table name: triangles
#
#  id         :integer          not null, primary key
#  body       :text
#  final_sum  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Triangle < ActiveRecord::Base


  def parse_triangle
      self.body.chomp.split("\n").map do |line|
        line.chomp.split(" ")
      end
  end


  def largest_path

    my_triangle = self.parse_triangle.map {|row| row.map{|val| val.to_i }}

    row = 0
    column = 0
    final_sum = 0
    final_sum += my_triangle[row][column]

    my_path = my_triangle.map {|row| row.map {|val| nil}}

    my_path[0][0] = 1

    # find the number of rows in my triangle
    times = (my_triangle.length - 1)

    # iterate through my triangle's rows and find the best numbers in the row below each current number
    times.times do

      if my_triangle[row+1][column] < my_triangle[row+1][column+1]
        my_path[row+1][column+1] = 1
        column = column +1
      else
        my_path[row+1][column] = 1
      end

      # add the best number from the next triangle row to my total sum
      final_sum += my_triangle[row+1][column]
      self.final_sum = final_sum

      row = row+1
    end

    return my_path

  end

    # def convert_file(text_file)
    #   if self.rows[0] == nil

    #   File.open(text_file, "r").each_line do |line|
    #     temp = line.chomp.split("\n")
    #     temp = temp[0].split(" ")
    #     temp_to_i = temp.map do |num|
    #       num.to_i
    #     end
    #     row = Row.create(row: temp_to_i)
    #     self.rows <<  row
    #   end

    # end

    # end

    # def create_array_of_rows
    #   if @my_triangle == []
    #         self.rows.each do |this_row|
    #               @my_triangle << this_row.row
    #         end
    #   end
    # end

    # def show_rows
    #   @my_triangle.each do |my_row|
    #        return my_row
    #       end
    # end

    # def show_row(index)
    #   return @my_triangle[index]
    # end


end
