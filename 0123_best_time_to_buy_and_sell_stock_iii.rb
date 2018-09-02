# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/description/
#
# Say you have an array for which the ith element is the price of a given stock
# on day i.
#
# Design an algorithm to find the maximum profit. You may complete at most two
# transactions.
#
# Note: You may not engage in multiple transactions at the same time (i.e., you
#   must sell the stock before you buy again).
#
# Example 1:
# Input: [3,3,5,0,0,3,1,4]
# Output: 6
# Explanation:
#   Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
#   Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
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
  profits = Array.new(prices.size)

  # past_maxprofit 某个时间点之前所能获取的最大利润
  past_maxprofit, minprice = 0, prices[0]
  prices.each_with_index do |price, idx|
    minprice = price if minprice > price

    profit = price - minprice
    past_maxprofit = profit if past_maxprofit < profit
    profits[idx] = past_maxprofit
  end

  # future_maxprofit 某个时间点之后所能获取的最大利润
  future_maxprofit, maxprice = 0, prices[-1]
  prices.reverse.each_with_index do |price, idx|
    maxprice = price if maxprice < price
    profit = maxprice - price
    future_maxprofit = profit if future_maxprofit < profit

    profits[-1 + -idx] += future_maxprofit
  end

  profits.max || 0
end

prices1 = [3,3,5,0,0,3,1,4]
p max_profit(prices1) # => 6

prices2 = [1,2,3,4,5]
p max_profit(prices2) # => 4

prices3 = [7,6,4,3,1]
p max_profit(prices3) # => 0

prices4 = []
p max_profit(prices4)  # => 0

prices5 = [1]
p max_profit(prices5)  # => 0

prices6 = [1, 2]
p max_profit(prices6)  # => 1

prices7 = [1, 2, 3]
p max_profit(prices7)  # => 2
