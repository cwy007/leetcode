# https://leetcode.com/problems/zigzag-conversion/description/
#
# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of
# rows like this: (you may want to display this pattern in a fixed font for better
# legibility)
#
# P   A   H   N
# A P L S I I G
# Y   I   R
#
# And then read line by line: "PAHNAPLSIIGYIR"
#
# Write the code that will take a string and make this conversion given a number
# of rows:
#
# string convert(string s, int numRows);
#
# Example 1:
# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"
#
# Example 2:
# Input: s = "PAYPALISHIRING", numRows = 4
# Output: "PINALSIGYAHRPI"
# Explanation:
#
# P     I    N
# A   L S  I G
# Y A   H R
# P     I
#
# @param {String} s
# @param {Integer} num_rows
# @return {String}

def convert(s, num_rows)
  return s.dup if num_rows == 1 || s.size <= num_rows

  newstr, cycle = '', 2 * num_rows - 2
  0.upto(num_rows - 1) do |row|
    0.upto(s.size.fdiv(cycle).ceil - 1) do |kth|
      base = kth * cycle                        # base 当前周期的开始索引

      newstr << s[base + row].to_s              # base + cycle 下一个周期的开始索引
      newstr << s[base + cycle - row].to_s if row.between?(1, num_rows - 2) # 第 2 行或倒数第 2 行
    end
  end
  newstr
end


s = "PAYPALISHIRING"
num_rows = 3
p convert(s, num_rows)    # => "PAHNAPLSIIGYIR"

num_rows = 4
p convert(s, num_rows)    # => "PINALSIGYAHRPI"
