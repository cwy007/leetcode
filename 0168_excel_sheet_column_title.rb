# https://leetcode.com/problems/excel-sheet-column-title/description/
#
# Given a positive integer, return its corresponding column title as appear
# in an Excel sheet.
#
# For example:
#     1 -> A
#     2 -> B
#     3 -> C
#     ...
#     26 -> Z
#     27 -> AA
#     28 -> AB
#     ...
#
# Example 1:
# Input: 1
# Output: "A"
#
# Example 2:
# Input: 28
# Output: "AB"
#
# Example 3:
# Input: 701
# Output: "ZY"
#
# @param {Integer} n
# @return {String}

def convert_to_title(n)
  m = {}
  Range.new('A', 'Z').each_with_index { |ch, idx| m[idx] = ch }

  str = ''
  while n > 0
    str.insert(0, m[(n - 1) % 26])
    n = (n - 1) / 26
  end
  str
end


p convert_to_title(1)      # => 'A'
p convert_to_title(28)     # => 'AB'
p convert_to_title(701)    # => 'ZY'
