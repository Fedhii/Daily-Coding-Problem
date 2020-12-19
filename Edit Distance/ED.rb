# The edit distance between two strings refers to the minimum number of 
# character insertions, deletions, and substitutions required to change one string 
# to the other.For example, the edit distance between “kitten” and “sitting” is 
# three: substitute the “k” for “s”, substitute the “e” for “i”, and append a “g”.

# Given two strings, compute the edit distance between them.

def edit_distance(str1, str2) 
    changes = 0

    while str1.length > 0 && str2.length > 0
        char1 = str1.slice!(0)
        char2 = str2.slice!(0)

        changes += 1 if char1 != char2
    end

    changes + (str1.length - str2.length).abs
end

# p edit_distance("", "")
# p edit_distance("a", "b")
# p edit_distance("abc", "")
# p edit_distance("abc", "abc")
# p edit_distanceear("kitten", "sitting")