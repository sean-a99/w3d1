class Array

  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end
    self
  end


  def my_select(&prc)
    output = []

    self.my_each do |ele|
      if prc.call(ele)
        output << ele
      end
    end
    output
  end




end


# return_value = [1, 2, 3].my_each do |num|
#   puts num
#  end.my_each do |num|
#   puts num
#  end

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []