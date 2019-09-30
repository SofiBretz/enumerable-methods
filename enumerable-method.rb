module Enumerable

#my_each
def my_each
    for i in 0...self.length
        yield self[i]
    end
    #Analysis:
    #Self represent the current object, returns the elements of the array
    #Yield asks for a block
end

#my_each_with_index
def my_each_with_index

    for i in 0...self.length
        yield self[i], i
    end
end

#my_selected
def my_select

    selected = []
       self.my_each do |i|

           if yield(i)
               selected << i
           end
       end
      selected
   end
   