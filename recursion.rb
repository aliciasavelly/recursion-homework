# require "byebug"

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
  (num-2).times { base << base[-2] + base[-1] }
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
      el.is_a?(Array) ? out << el.deep_dup : out << el
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

  def rsubsets
    return [[]] if self.empty?
    smaller_subset = self[0..-2].rsubsets
    new_subset = smaller_subset.map do |sub|
      sub + [self[-1]]
    end
    smaller_subset + new_subset
  end

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

# p [1, [2], [3, 7, 8, [4]]].deep_dup
# p bsearch([1, 2, 3], 1) == 0
# p bsearch([1, 2, 3], 2) == 1
# p bsearch([1, 2, 3], 3) == 2
# p bsearch([1, 3, 4, 5, 7, 11, 14, 22], 22) == 7
# p bsearch([1, 3, 4, 5, 7, 11, 14, 22], 3) == 1
# p bsearch([1, 3, 4, 5, 7, 11, 14, 22], 5) == 3
