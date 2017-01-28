def sum_to(n)
  return nil if n < 1
  return n if n == 1
  n + sum_to(n - 1)
end

# p "sum_to:"
# p sum_to(5) == 15
# p sum_to(1) == 1
# p sum_to(9) == 45
# p sum_to(-8) == nil

def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1
  nums_array.pop + add_numbers(nums_array)
end

p "----------"
p "add_numbers"
p add_numbers([1, 2, 3, 4]) == 10
p add_numbers([3]) == 3
p add_numbers([-80, 34, 7]) == -39
p add_numbers([]) == nil

# def factorial(n)
#   return n if n == 1
#   n * factorial(n - 1)
# end

# p factorial(4)

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1
  (num - 1) * gamma_fnc(num - 1)
end

p "----------"
p "gamma_fnc"
p gamma_fnc(0) == nil
p gamma_fnc(1) == 1
p gamma_fnc(4) == 6
p gamma_fnc(8) == 5040
