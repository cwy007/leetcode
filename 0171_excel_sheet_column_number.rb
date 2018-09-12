# https://leetcode.com/problems/excel-sheet-column-number/description/
#
# Given a column title as appear in an Excel sheet, return its corresponding
# column number.
#
# For example:
#
#     A -> 1
#     B -> 2
#     C -> 3
#     ...
#     Z -> 26
#     AA -> 27
#     AB -> 28
#     ...
#
# Example 1:
# Input: "A"
# Output: 1
#
# Example 2:
# Input: "AB"
# Output: 28
#
# Example 3:
# Input: "ZY"
# Output: 701
#
# @param {String} s
# @return {Integer}

def title_to_number(s)
  char_to_num, num = {}, 0
  Range.new('A', 'Z').each_with_index do |char, idx|
    char_to_num[char] = idx + 1
  end

  s.each_char do |char|
    num = num * 26 + char_to_num[char]
  end
  num
end

p title_to_number('A')          #=> 1
p title_to_number('B')          #=> 2
p title_to_number('C')          #=> 3
p title_to_number('Z')          #=> 26
p title_to_number('AA')         #=> 27
p title_to_number('AB')         #=> 28
p title_to_number('ZY')         #=> 701
