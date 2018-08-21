# https://leetcode.com/problems/multiply-strings/description/
#
# Given two non-negative integers num1 and num2 represented as strings,
# return the product of num1 and num2, also represented as a string.
#
# Example 1:
# Input: num1 = "2", num2 = "3"
# Output: "6"
#
# Example 2:
# Input: num1 = "123", num2 = "456"
# Output: "56088"
#
# Note:
# The length of both num1 and num2 is < 110.
# Both num1 and num2 contain only digits 0-9.
# Both num1 and num2 do not contain any leading zero, except the number 0 itself.
# You must not use any built-in BigInteger library or convert the inputs to
# integer directly.

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  return '0' if num1.length == 0 || num2.length == 0
  len1 = num1.length
  len2 = num2.length
  result = Array.new(len1+len2, 0)  # [0, 0, .. , 0, 0].length == len1 + len2
  (len1-1).downto(0).each do |i|
    (len2-1).downto(0).each do |j|
      mul = num1[i].to_i * num2[j].to_i
      pos_low = i + j + 1           # 低位
      pos_high = i + j              # 高位
      mul += result[pos_low]        # 乘积 + 低位值
      result[pos_low] = mul % 10    # 更新低位的值
      result[pos_high] += mul / 10  # 更新高位的值
    end
  end
  result.join('').to_i.to_s         # '0123'.to_i # => 123，去掉 leading zero
end

p multiply('2', '3')      # => '6'
p multiply('123', '456')  # => '56088'
p multiply('123', '45')   # => '5535'
p multiply('17', '18')    # => '306'
p multiply('25', '26')    # => '650'
p multiply('123', '')     # => '0'

p multiply('2'*112, '3'*112)
# => "740740740740740740740740740740740740740740740740740740740740740740740740
#     7407407407407407407407407407407407407405925925925925925925925925925925925
#     925925925925925925925925925925925925925925925925925925925925925925925925
#     925926"
