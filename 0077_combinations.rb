# https://leetcode.com/problems/combinations/description/
#
# Given two integers n and k, return all possible combinations of k numbers
# out of 1 ... n.
#
# Example:
# Input: n = 4, k = 2
# Output:
#   [
#     [2,4],
#     [3,4],
#     [2,3],
#     [1,2],
#     [1,3],
#     [1,4],
#   ]
#
# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}

def combine(n, k)
  Array(1..n).combination(k).to_a
end

p combine(4, 2)  # => [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
p combine(4, 3)  # => [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
