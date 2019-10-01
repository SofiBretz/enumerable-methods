# frozen_string_literal: true

module Enumerable
  # my_each
  def my_each
    (0...length).each do |i|
      yield self[i]
    end
    # Analysis:
    # Self represent the current object, returns the elements of the array
    # Yield asks for a block
  end

  # my_each_with_index
  def my_each_with_index
    (0...length).each do |i|
      yield self[i], i
    end
  end

  # my_select
  def my_select
    # new array
    select_arr = []

    my_each do |i|
      select_arr << i if yield(i)
    end
    select_arr
    # select: Returns a new array containing all elements of enum for which the given block returns a true value.
  end

  # my_all?
  def my_all?
    # all: The method returns true if ALL elements are true (or empty array).

    length.times do |i|
      return false unless yield self[i]
    end
    true
  end

  # my_any?
  def my_any?
    # any: The method returns true if AT LEAST one element is true (or non empty array).

    selected = my_select do |i|
      yield(i)
    end
    !selected.empty?
  end

  # my_none?
  def my_none?
    # none: The method returns true if NO elements are true (or empty array).

    selected = my_select { |i| yield(i) }
    selected.length <= 0
  end

  # my_count
  def my_count
    # count: The count method takes an enumerable collection and counts how many elements match the given criteria.
    count = 0
    my_each do |element|
      count += 1 if !block_given? || yield(element)
    end
    count
  end

  # my_map
  def my_map(proc = nil)
    result = []
    my_each do |element|
      result << (block_given? ? yield(element) : proc.call(element))
    end
    result
  end

  # my_inject
  def my_inject(initial = nil)
    result = initial

    my_each do |element|
      result = if result.nil?
                 element
               else
                 yield(result, element)
               end
    end
    result
  end
end

class Array
  include Enumerable
end

def multiply_else(arr)
  arr.my_inject { |sum, x| sum * x }
end

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
