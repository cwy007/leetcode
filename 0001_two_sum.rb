# https://leetcode.com/problems/two-sum/description/
# 
#  Given an array of integers, return indices of the two numbers
# such that they add up to a specific target.
#
# You may assume that each input would have exactly one solution,
# and you may not use the same element twice.
#
# Example:
# Given nums = [2, 7, 11, 15], target = 9,
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].
#
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  h = {}
  nums.each_with_index do |num, i|
    val = h[target-num]
    return [val, i] if val

    h[num] = i
  end
  []
end

p two_sum([1], 1)                    # => []
p two_sum([1, 3, 5, 7], 8)           # => [1, 2]
p two_sum([1, 3, 5, 7, 9], 12)       # => [2, 3]
p two_sum([1, 3, 5, 7, 9, 11], 18)   # => [3, 5]
p two_sum([2, 4, 6, 8, 10], 8)       # => [0, 2]
