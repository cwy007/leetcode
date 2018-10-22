# https://leetcode.com/problems/add-binary/description/
#
# Given two binary strings, return their sum (also a binary string).
#
# The input strings are both non-empty and contains only characters 1 or 0.
#
# Example 1:
# Input: a = "11", b = "1"
# Output: "100"
#
# Example 2:
# Input: a = "1010", b = "1011"
# Output: "10101"
# 
# @param {String} a
# @param {String} b
# @return {String}

def add_binary(a, b)
  result, i, j, carry = '', a.length, b.length, 0

  while (i > 0 || j > 0)
    sum = carry
    sum += a[i -= 1].to_i if i > 0
    sum += b[j -= 1].to_i if j > 0

    result << (sum % 2).to_s
    carry = sum / 2
  end

  result << carry.to_s if carry != 0
  result.reverse
end

p add_binary('11', '1')         # => '100'
p add_binary('1010', '1011')    # => '10101'
p add_binary('110', '1')        # => '111'
p add_binary('1110', '1')       # => '1111'
