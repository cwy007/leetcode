# https://leetcode.com/problems/group-anagrams/description/
#
# Given an array of strings, group anagrams together.
#
# Example:
# Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
# Output:
# [
#   ["ate","eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]
#
# Note:
# All inputs will be in lowercase.
# The order of your output does not matter.
#
# @param {String[]} strs
# @return {String[][]}

def group_anagrams(strs)
  proc_for_group = proc { |s| s.chars.sort.join }
  proc_for_order = proc { |a, b| b.size <=> a.size }

  strs.group_by(&proc_for_group).values.map(&:sort).sort(&proc_for_order)
end

strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
p group_anagrams(strs)   # => [["ate", "eat", "tea"], ["nat", "tan"], ["bat"]]


# Enumerable#group_by
#
# group_by { |obj| block } → a_hash
# group_by → an_enumerator
# Groups the collection by result of the block. Returns a hash where the keys
# are the evaluated result from the block and the values are arrays of elements
# in the collection that correspond to the key.
#
# If no block is given an enumerator is returned.
#
# (1..6).group_by { |i| i%3 }   #=> {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}
