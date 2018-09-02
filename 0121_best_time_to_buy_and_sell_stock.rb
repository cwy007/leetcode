# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
#
# Say you have an array for which the ith element is the price of a given stock
# on day i.
# If you were only permitted to complete at most one transaction (i.e., buy one
# and sell one share of the stock), design an algorithm to find the maximum profit.
#
# Note that you cannot sell a stock before you buy one.
#
# Example 1:
# Input: [7,1,5,3,6,4]
# Output: 5
# Explanation:
#   Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
#   Not 7-1 = 6, as selling price needs to be larger than buying price.
#
# Example 2:
# Input: [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transaction is done, i.e. max profit = 0.
#
# @param {Integer[]} prices
# @return {Integer}

def max_profit(prices)
  maxprofit, minprice = 0, prices[0]

  prices.each do |price|
    minprice = price if minprice > price
    profit = price - minprice

    maxprofit = profit if maxprofit < profit
  end

  maxprofit
end

prices1 = [7,1,5,3,6,4]
p max_profit(prices1)  # => 5

prices2 = [7,6,4,3,1]
p max_profit(prices2)  # => 0

prices2 = [7,6,4,3,122]
p max_profit(prices2)  # => 119
