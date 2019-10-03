# frozen_string_literal: true

module Enumerable
  # my_each
  def my_each
    return to_enum unless block_given?

    each { |i| yield(i) }
  end
  # Self represent the current object, returns the elements of the array
  # Yield asks for a block

  # my_each_with_index
  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  # my_select
  def my_select
    # select: Returns a new array containing all elements of enum for which the given block returns a true value.
    return to_enum unless block_given?

    # new array
    array = []
    my_each { |i| array << i if yield(i) }
    array
  end

  # my_all?

  def my_all?
    # all: The method returns true if ALL elements are true (or empty array).

    my_each { |x| return false unless yield(x) }
    true
  end

  # my_any?
  def my_any?
    # any: The method returns true if AT LEAST one element is true (or non empty array).

    my_each { |x| return true if yield(x) }
    false
  end

  # my_none?
  def my_none?
    # none: The method returns true if NO elements are true (or empty array).

    my_each { |x| return false if yield(x) }
    true
  end

  # my_count
  def my_count(items = nil)
    count = 0
    # count: The count method takes an enumerable collection and counts how many elements match the given criteria.

    if block_given?
      my_each { |x| count += 1 if yield(x) == true }
    elsif items.nil?
      my_each { count += 1 }
    else
      my_each { |x| count += 1 if x == items }
    end
    count
    end

  c = 0
  n = 0
  while c < size
    n += 1 if yield(self[c])
    c += 1
  end

  return n
  end

# my_map
def my_map(proc = nil)
  return to_enum(:my_map) unless block_given?

  new_arr = []
  my_each do |p|
    new_arr << if !proc.nil?
                 proc.call(p)
               else
                 yield(p)
               end
  end
  new_arr
end

# my_inject
def my_inject(*args)
  arr = to_a.dup
  if args[0].nil?
    memo = arr.shift
  elsif args[1].nil? && !block_given?
    symbol = args[0]
    memo = arr.shift
  elsif args[1].nil? && block_given?
    memo = args[0]
  else
    memo = args[0]
    symbol = args[1]
  end

  arr[0..-1].my_each do |elem|
    memo = if symbol
             memo.send(symbol, elem)
           else
             yield(memo, elem)
           end
  end
  memo
end

def multiply_els(arr)
  result = arr.my_inject do |mul, num|
    mul * num
  end
  result
end
end 

# rubocop:enable
# Tests:
arr = [1, 3, 5, 9, 7]
# # my_each
# arr.my_each { |element| puts element }
#
# my_each_with_index
# arr.my_each_with_index { |element, index| puts "#{index} -> #{element}" }
#
# my_select
# puts(arr.my_select { |element| element > 5 })
#
# my_all?
# puts(arr.my_all? { |element| element < 10 })
#
# my_any?
# puts(arr.my_any? { |element| element == 1 })
# my_none?
puts(arr.my_none? { |element| element == 10 })

# my_count
puts(arr.my_count { |element| element == 9 })
puts arr.my_count

# my_inject
puts(arr.my_inject { |sum, element| sum + element })

# multiply_els([2,4,5])
puts arr.multiply_els([2, 4, 5])

# my_map (proc)
proc = proc { |element| element * 10 }
puts arr.my_map(proc)

# my_map (block)
puts(arr.my_map { |element| element * 10 })
