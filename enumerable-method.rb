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
end

# my_all?
def my_all?
  # all: The method returns true if ALL elements are true (or empty array).
  n = length

  select_arr = []

  my_each do |i|
    select_arr << i if yield(i)
  end

  select_arr.length == n
end

# my_any?
def my_any?
  # any: The method returns true if AT LEAST one element is true (or non empty array).

  select_arr = my_select do |i|
    yield(i)
  end

  !select_arr.empty?
end

# my_none?
def my_none?
  # none: The method returns true if NO elements are true (or empty array).

  length.times do |i|
    return false if yield self[i]
  end
  true
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

class Array
  include Enumerable
end

def multiply_els(arr)
  arr.my_inject { |sum, x| sum * x }
end

# Tests:
array = [1, 2, 3, 4]

# my_each
# array.each { |x| puts x +1}
# puts ''
# array.my_each { |x| puts x +1}

# my_each_with_index
# array.each_with_index {|number, index| puts array [number] = index}
# puts ""
# array.my_each_with_index {|number, index| puts array [number] = index}

# my_select
# array.select {|element| puts element.even? }
# puts ""
# array.my_select {|element| puts element.even? }
