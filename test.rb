# Tests:
arr = [1, 3, 5, 9, 7]

# my_each
arr.my_each { |element| puts element }

# my_each_with_index
arr.my_each_with_index { |element, index| puts "#{index} -> #{element}" }

# my_select
puts arr.my_select { |element| element > 5 }

# my_all?
puts arr.my_all? { |element| element < 10 }

# my_any?
puts arr.my_any? { |element| element == 1 }

# my_none?
puts arr.my_none? { |element| element == 10 }

# my_count
puts arr.my_count { |element| element == 9 }
puts arr.my_count

# my_inject
puts arr.my_inject { |sum, element| sum + element }

# multiply_else([2,4,5])
puts multiply_else([2, 4, 5])

# my_map (proc)
proc = proc { |element| element * 10 }
puts arr.my_map(proc)

# my_map (block)
puts arr.my_map { |element| element * 10 }
