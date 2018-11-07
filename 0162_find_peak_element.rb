# https://leetcode.com/problems/find-peak-element/description/
#
# A peak element is an element that is greater than its neighbors.
#
# Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element
# and return its index.
#
# The array may contain multiple peaks, in that case return the index to any one
#   of the peaks is fine.
#
# You may imagine that nums[-1] = nums[n] = -∞.
#
# Example 1:
# Input: nums = [1,2,3,1]
# Output: 2
# Explanation: 3 is a peak element and your function should return the index number 2.
#
# Example 2:
# Input: nums = [1,2,1,3,5,6,4]
# Output: 1 or 5
# Explanation: Your function can return either index number 1 where the peak element is 2,
#              or index number 5 where the peak element is 6.
#
# Note:
# Your solution should be in logarithmic complexity.
#
# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  lbound, ubound = 0, nums.size - 1  # lbound, ubound 分别为数组下限和数组上限

  while ubound - lbound > 1          # 上下限不相邻时，不断循环
    m = (ubound + lbound) / 2        # m 为上下限的中间位置

    if nums[m] < nums[m + 1]         # 根据值的比较结果，移动下限或上限到位置 m
      lbound = m
    else
      ubound = m
    end
  end

  return ubound if nums[lbound] < nums[ubound] # 根据不同位置的值的大小，返回值大的数据所在的位置
  return lbound
end

nums = [1,2,3,1]
p find_peak_element(nums) # => 2

nums = [1,2,1,3,5,6,4]
p find_peak_element(nums) # => 1 or 5
