# https://leetcode.com/problems/happy-number/description/
#
# Write an algorithm to determine if a number is "happy".
#
# A happy number is a number defined by the following process: Starting with any
# positive integer, replace the number by the sum of the squares of its digits,
# and repeat the process until the number equals 1 (where it will stay), or it
# loops endlessly in a cycle which does not include 1. Those numbers for which
# this process ends in 1 are happy numbers.
#
# Example:
#
# Input: 19
# Output: true
# Explanation:
#   12 + 92 = 82
#   82 + 22 = 68
#   62 + 82 = 100
#   12 + 02 + 02 = 1
#
# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  map = {}
  while true
    s = 0
    while n > 0
      s = s + (n % 10) * (n % 10)     # 加上个位的平方
      n = n / 10                      # 先减去个位，然后十位，百位 ...
    end
    return true if s == 1
    return false if map[s]            # 出现循环的时候，返回 false

    map[s], n = true, s
  end
end

puts is_happy(19)   # => true
puts is_happy(20)   # => false
puts is_happy(21)   # => false
puts is_happy(333)  # => false
