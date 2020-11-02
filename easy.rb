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

p decoded("4A3B2C1D2A") == "AAAABBBCCDAA"