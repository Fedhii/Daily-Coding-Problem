require 'byebug'
# The power set of a set is the set of all its subsets. Write a function that, 
# given a set, generates its power set.

# For example, given the set {1, 2, 3}, it should 
# return {{}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}}.

# You may also use a list or array to represent a set.

def subsets(nums, i = 0)
    result = [[]]
    
    nums.each do |num|
        len = result.size
        i = 0
        while i < len
            new_subset = result[i] + [num]
            result << new_subset
            i += 1
        end
    end
    result
end


p subsets([1, 2, 3])

# This algorithm is a little different from the video explanations, but you can
# still use decision terminology. The number of "decisions" you can make is dependent
# on the size of the input array. So, for each element of the array, you walk through all
# possible subsets, and you add yourself to it, and add the new subset to the end. 
# That way, every subset that existed before you still exists, and every subset that
# will come behind you will have the opportunity to add themselves to you. Independent 
# of your neighbors and with your neighbors (since we've got all possible options up to you)
# accounted for. 

            # p "result[i]: #{result[i]}, num: #{num}, length: #{len}"