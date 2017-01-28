require "byebug"

# class Array
#   def deep_dup
#     out = []
#     self.each do |el|
#       if el.is_a?(Array)
#         out << el.deep_dup
#       else
#         out << el
#       end
#     end
#
#     out
#   end
# end

# p [1, [2], [3, 7, 8, [4]]].deep_dup

def range(start, last)
  return [] if last < start
  return [last] if start == last
  [start] + range(start + 1, last)
end


# p range(2, 10)
# p range(10, 2)


def recursive_sum(arr)
  return arr.first if arr.length == 1
  arr.first + recursive_sum(arr[1..-1])

end

# p recursive_sum([1,2,3,4])


def iterative_sum(arr)
  arr.inject(:+)
end
#
# p iterative_sum([1,2,3,4])

def recursion_one(base, power)
  return 1 if power == 0
  base * recursion_one(base, power - 1)

end

# p recursion_one(2, 4)

def recursion_two(base, power)
  return 1 if power == 0
  return base if power == 1
  if power.even?
    recursion_two(base, power / 2) ** 2
  else
    base * (recursion_two(base, (power - 1) / 2) ** 2)
  end
end

# p recursion_two(2, 4)


def ifibonacci(num)
  base = [0,1]
  (num-2).times do
    base << base[-2] + base[-1]
  end
  base
end

def rfibonacci(num)
  if num == 2
    fibs = [0,1]
  else
    fibs = rfibonacci(num - 1)
    fibs << fibs[-2] + fibs[-1]
  end
end

# p rfibonacci(6)# == [0,1,1,2,3,5]
# p ifibonacci(6) == [0,1,1,2,3,5]
class Array

  def deep_dup
    out = []

    self.each do |el|
      if el.is_a?(Array)
        out << el.deep_dup
      else
        out << el
      end
    end
    out
  end


  def isubsets
    result = [[]]
    self.each do |num|
      temp_array = result.map {|arr| arr + [num]}
      result += temp_array
    end
    result
  end

  def isubsets2
    out = []
    # self.each do |el|
    #   if el >=0
    #     out << self.drop(1)
    #   else
    #     out << self.combination(self.length).to_a
    #   end
    # end
    # out
  end

  def rsubsets
    return [[]] if self.empty?
    smaller_subset = self[0..-2].rsubsets
    new_subset = smaller_subset.map do |sub|
      sub + [self[-1]]
    end
    smaller_subset + new_subset
  end

  # def rpermutation
  #   out = []
  #   if self.length == 2
  #     out << self
  #     out << self.rotate
  #     return out
  #   end
  #   # debugger
  #
  #   # debugger
  #   current_array = self[1..-1].rpermutation.to_a
  #   current_array.each do |num|
  #     out << current_array
  #   end
  #   # debugger
  #   [self[0]] + out
  # end

  def rpermutation
    if self.length <= 1
      return [self]
    end

    result = []
    first = self.first
    sub_perm = self[1..-1].rpermutation
    sub_perm.each do |arr|
      (0..arr.length).each do |idx|
        result << arr.dup.insert(idx, first)
      end
    end
    result
  end

  def ipermutation
    out = []
    self.each do |el|
      count = self.length - 1
      temp = self.dup
      temp.delete(el)
      # out << [el] + temp
      temp.combination(self.length - 1).to_a.map {|combo| out += [el] + combo}

      # until count < 0 do
      #   out << [el] + temp.rotate(count)
      #   count -= 1
      # end
    end
    out
  end

end

# ([1, [2, 2], 3, [4, [2, 3, [4, 2]]]]).deep_dup
# p ([1, 2,3]).isubsets
# p ([1, 2,3]).rsubsets
# p ([1, 2, 3, 4]).rpermutation
# p ([1, 2, 3, 4]).ipermutation


def bsearch(array, target)
  return nil if array.empty?
  middle_pos = array.length / 2
  middle_el = array[middle_pos]
  # return middle_pos if middle_el == target
  #
  # if middle_pos > target
  #   position = bsearch(array.take(middle_pos), target)
  #   # return position + middle_pos + 1
  # else
  #   position = bsearch(array.drop(middle_pos + 1), target)
  #   if position.nil?
  #     return nil
  #   else
  #     return position + middle_pos + 1
  #   end
  # end
  case target <=> array[middle_pos]
  when -1
    bsearch(array.take(middle_pos), target)
  when 0
    middle_pos
  when 1
    position = bsearch(array.drop(middle_pos + 1), target)
    position.nil? ? nil : position + middle_pos + 1
  end

end

p bsearch([1, 2, 3], 1) == 0
p bsearch([1, 2, 3], 2) == 1
p bsearch([1, 2, 3], 3) == 2
p bsearch([1, 3, 4, 5, 7, 11, 14, 22], 22) == 7
p bsearch([1, 3, 4, 5, 7, 11, 14, 22], 3) == 1
p bsearch([1, 3, 4, 5, 7, 11, 14, 22], 5) == 3
