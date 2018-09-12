# https://leetcode.com/problems/candy/description/
# https://leetcode.com/problems/candy/solution/
#
# There are N children standing in a line. Each child is assigned a rating value.
#
# You are giving candies to these children subjected to the following requirements:
#
# Each child must have at least one candy.
# Children with a higher rating get more candies than their neighbors.
# What is the minimum candies you must give?
#
# Example 1:
# Input: [1,0,2]
# Output: 5
# Explanation:
#   You can allocate to the first, second and third child with 2, 1, 2 candies
#   respectively.
#
# Example 2:
# Input: [1,2,2]
# Output: 4
# Explanation:
#   You can allocate to the first, second and third child with 1, 2, 1 candies
#   respectively. The third child gets 1 candy because it satisfies the above
#   two conditions.
#
# @param {Integer[]} ratings
# @return {Integer}

def candy(ratings)
  left2right = Array.new(ratings.size, 1)
  right2left = Array.new(ratings.size, 1)
  sum = 0

  (1...ratings.size).each do |i|
    if ratings[i] > ratings[i - 1]
      left2right[i] = left2right[i - 1] + 1
    end
  end

  (ratings.size - 2).downto(0).each do |i|
    if ratings[i] > ratings[i + 1]
      right2left[i] = right2left[i + 1] + 1
    end
  end

  (0...ratings.size).each do |i|
    sum += (left2right[i] >= right2left[i] ?  left2right[i] : right2left[i])
  end

  sum
end


ratings1 = [1, 0, 2]
p candy(ratings1)              # => 5

ratings2 = [1, 2, 2]
p candy(ratings2)              # => 4

ratings3 = [12, 4, 3, 11, 34, 34, 1, 67]
p candy(ratings3)              # => 16
