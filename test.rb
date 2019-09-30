# frozen_string_literal: true

pets = {} # pets will be = a new hash
%w[cat dog wombat].each_with_index do |item, index| # this new hash will have item and index with the following format
  pets[item] = index
end
p pets # I'm printing the new hash
#=> {"cat"=>0, "dog"=>1, "wombat"=>2}

# how to p it? any, all, none
%w[ant bear cat].all? { |word| word.length >= 3 } #=> true cheking if all elements corresponding the condition
%w[ant bear cat].all? { |word| word.length >= 4 } #=> false
%w[ant bear cat].any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].any? { |word| word.length >= 4 } #=> true cheking if ANY elements corresponding the condition
%w[ant bear cat].none? { |word| word.length >= 4 } #=> false cheking if ''none elements'' corresponding the condition

# select:
[1, 2, 3, 4, 5].select { |num| puts num.even? } #=> [2, 4] #select thing by given specific condition inside a block

# count how many elements have inside the given array
ary = [1, 2, 4, 2]
ary.count #=> 4
ary.count(2) #=> 2
ary.count(&:even?) #=> 3

# map: Returns a new array with the results of running block once for every element in enum.
# If no block is given, an enumerator is returned instead.
(1..4).map { |i| i * i } #=> [1, 4, 9, 16]
(1..4).collect { 'cat' } #=> ["cat", "cat", "cat", "cat"]

# inject
# Same using a block and inject
(5..10).inject { |sum, n| sum + n } #=> 45 = 5+6+7+8+9+10
