# https://leetcode.com/problems/majority-element/description/
#
# Given an array of size n, find the majority element. The majority element is
# the element that appears more than ⌊ n/2 ⌋ times.
#
# You may assume that the array is non-empty and the majority element always
# exist in the array.
#
# Example 1:
# Input: [3,2,3]
# Output: 3
#
# Example 2:
# Input: [2,2,1,1,1,2,2]
# Output: 2
#
# @param {Integer[]} nums
# @return {Integer}

def majority_element(nums)
  map = {}
  limit = nums.size / 2

  nums.each do |num|
    map[num] = (map[num] || 0) + 1
    return num if map[num] > limit
  end
  nil
end

nums = [3, 2, 3]
p majority_element(nums) # => 3

nums = [2, 2, 1, 1, 1, 2, 2]
p majority_element(nums) # => 2

nums = [2, 2, 1, 1, 1, 2, 2, 33, 33, 33, 33, 33, 33, 33, 33]
p majority_element(nums) # => 33

nums = [2, 2, 1, 1, 1, 2, 2, 33, 33, 33, 33, 33, 33, 33]
p majority_element(nums) # => nil
