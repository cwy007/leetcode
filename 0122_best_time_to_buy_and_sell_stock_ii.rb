# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/
#
# Say you have an array for which the ith element is the price of a given stock
# on day i.
#
# Design an algorithm to find the maximum profit. You may complete as many
# transactions as you like (i.e., buy one and sell one share of the stock
# multiple times).
#
# Note: You may not engage in multiple transactions at the same time
# (i.e., you must sell the stock before you buy again).
#
# Example 1:
# Input: [7,1,5,3,6,4]
# Output: 7
# Explanation:
#   Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
#   Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
#
# Example 2:
# Input: [1,2,3,4,5]
# Output: 4
# Explanation:
#   Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
#   Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
#   engaging multiple transactions at the same time. You must sell before buying again.
#
# Example 3:
# Input: [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transaction is done, i.e. max profit = 0.
#
# @param {Integer[]} prices
# @return {Integer}

def max_profit(prices)
  return 0 if prices.length < 2

  proc_for_map = proc { |p1, p2| [p2 - p1, 0].max }
  prices.each_cons(2).map(&proc_for_map).reduce(&:+)
end

prices1 = [7,1,5,3,6,4]
p max_profit(prices1)  # => 7

prices2 = [1,2,3,4,5]
p max_profit(prices2)  # => 4

prices3 = [7,6,4,3,1]
p max_profit(prices3)  # => 0

prices4 = []
p max_profit(prices4)  # => 0

prices5 = [1]
p max_profit(prices5)  # => 0

# Enumerable#each_cons
#
# each_cons(n) { ... } → nil
# each_cons(n) → an_enumerator
# Iterates the given block for each array of consecutive <n> elements.
# If no block is given, returns an enumerator.
#
# e.g.:
# (1..10).each_cons(3) { |a| p a }
#
# outputs below:
# [1, 2, 3]
# [2, 3, 4]
# [3, 4, 5]
# [4, 5, 6]
# [5, 6, 7]
# [6, 7, 8]
# [7, 8, 9]
# [8, 9, 10]
