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

  def my_reject(&prc)
    output = []
    self.my_each { |ele| output << ele unless prc.call(ele) }
    output
  end
  
  def my_any?(&prc)
    self.my_each {|ele| return true if prc.call(ele) }
    false
  end

  def my_all?(&prc)
    self.my_each {|ele| return false unless prc.call(ele)}
    true
  end

  def my_flatten
    output = []

    self.my_each do |ele|
      unless ele.is_a?(Array)
        output << ele
      else
        output.concat(ele.my_flatten)
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

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# p [1, 2, 3, [4, 5]].my_flatten