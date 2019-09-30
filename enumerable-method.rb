# frozen_string_literal: true

module Enumerable
  # my_each
  def my_each

    for i in (0...length).each do |i|
      yield self[i]
    end
    # Analysis:
    # Self represent the current object, returns the elements of the array
    # Yield asks for a block
  end

  # my_each_with_index
  def my_each_with_index

    for i in (0...length).each do |i|
      yield self[i], i
    end
  end

  # my_select
  def my_select

    #new array
    select_arr = []

    my_each do |i|
        select_arr << i if yield(i)
    end
    select_arr
    #select: Returns a new array containing all elements of enum for which the given block returns a true value.
    end
end

#my_all?
def my_all?
    #all: The method returns true if ALL elements are true (or empty array). 
    n = self.length

    select_arr = []

    self.my_each do |i|
        if yield(i)
            select_arr << i
        end
    end

 return select_arr.length == n
end

#my_any?
def my_any?
    #any: The method returns true if AT LEAST one element is true (or non empty array).

    select_arr = self.my_select do |i|
           yield(i)
       end

    return select_arr.length > 0
   end

    #my_none?
    def my_none?
        #none: The method returns true if NO elements are true (or empty array). 

        select_arr = self.my_select {|i| yield(i)}
        return !(select_arr.length > 0)
    end

     #my_count
     def my_count(x)
        x= nil
        #count: The count method takes an enumerable collection and counts how many elements match the given criteria.

        if !block_given? && x == nil
            select_arr = []

            self.my_each do |i|
                select_arr << i
            end
            return select_arr.length
        end

        if !block_given? && x != nil

            select_arr = []

            self.my_each do |i|
                if i == x
                    select_arr << i
                end
            end
            return select_arr.length
        end

        if block_given? && x == nil
            select_arr = self.my_select {|i| yield(i)}

            return select_arr.length
        end
        
    
    end