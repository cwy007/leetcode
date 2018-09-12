# https://leetcode.com/problems/contains-duplicate/description/
#
# Given an array of integers, find if the array contains any duplicates.
#
# Your function should return true if any value appears at least twice in
# the array, and it should return false if every element is distinct.
#
# Example 1:
# Input: [1,2,3,1]
# Output: true
#
# Example 2:
# Input: [1,2,3,4]
# Output: false
#
# Example 3:
# Input: [1,1,1,3,3,4,3,2,4,2]
# Output: true
#
# @param {Integer[]} nums
# @return {Boolean}

def contains_duplicate(nums)
  map = {}

  nums.each do |num|
    return true if map[num]
    map[num] = true
  end

  false
end

nums1 = [1,2,3,1]
p contains_duplicate(nums1)     # => true

nums2 = [1,2,3,4]
p contains_duplicate(nums2)     # => false

nums3 = [1,1,1,3,3,4,3,2,4,2]
p contains_duplicate(nums3)     # => true
