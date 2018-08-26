# https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
#
# Given a string, find the length of the longest substring without repeating characters.
#
# Example 1:
# Input: "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", which the length is 3.
#
# Example 2:
# Input: "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
#
# Example 3:
# Input: "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
#              Note that the answer must be a substring,
#              "pwke" is a subsequence and not a substring.
#
# @param {String} s
# @return {Integer}

def length_of_longest_substring(s)
  substr, maxlen = '', 0

  s.each_char do |char|
    if substr.include?(char)
      maxlen = substr.length if maxlen < substr.length
      substr = substr[(substr.index(char) + 1)..-1]
    end
    substr << char
  end
  maxlen = substr.length if maxlen < substr.length

  maxlen
end

p length_of_longest_substring("abcabcbb") # => 3
p length_of_longest_substring("bbbbb") # => 1
p length_of_longest_substring("pwwkew") # => 3
