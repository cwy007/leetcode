# https://leetcode.com/problems/power-of-two/description/
#
# Given an integer, write a function to determine if it is a power of two.
#
# Example 1:
# Input: 1
# Output: true
# Explanation: 20 = 1
#
# Example 2:
# Input: 16
# Output: true
# Explanation: 24 = 16
#
# Example 3:
# Input: 218
# Output: false
#
# @param {Integer} n
# @return {Boolean}

def is_power_of_two(n)         # n 是否为 2 的乘方
  return false if n <= 0

  while n > 1
    return false if n % 2 != 0  # 不能被 2 整除
    n = n / 2
  end

  return true                   # n == 0 || n == 1
end

p is_power_of_two(1)   # => true
p is_power_of_two(16)  # => true
p is_power_of_two(218) # => false
p is_power_of_two(9)   # => false
p is_power_of_two(32)  # => true
p is_power_of_two(4)   # => true
