# Run - length encoding is a fast and simple method of encoding strings.
# The basic idea is to represent repeated successive characters as a single count 
# and character. For example, the string "AAAABBBCCDAA" would be encoded as "4A3B2C1D2A".

# Implement run - length encoding and decoding.You can assume the string to be 
# encoded have no digits and consists solely of alphabetic characters.
# You can assume the string to be decoded is valid.

# class String
#   def numeric?
#     Float(self) != nil rescue false
#   end
# end

def decoded(str)
    new_str = ""

    (0...str.length).each do |idx|
        result = Integer(str[idx]) rescue false
        if result
            counter = Integer(str[idx])
            while counter > 0
                new_str += str[idx + 1]
                counter -= 1
            end
        end
    end

    new_str
end

# p decoded("4A3B2C1D2A") == "AAAABBBCCDAA"

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

p edit_distance("", "")
p edit_distance("a", "b")
p edit_distance("abc", "")
p edit_distance("abc", "abc")
p edit_distanceear("kitten", "sitting")
