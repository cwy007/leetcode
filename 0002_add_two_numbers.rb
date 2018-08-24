# https://leetcode.com/problems/add-two-numbers/description/
# https://leetcode.com/problems/add-two-numbers/solution/
# 
# You are given two `non-empty` linked lists representing two non-negative
# integers. The digits are stored in `reverse order` and each of their nodes
# contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero,
# except the number 0 itself.
#
# Example:
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.
#
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end
#
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}


def add_two_numbers(l1, l2)                       # 参数为两个链表 l1, l2
  n1, n2, n3, l3, carry = l1, l2, nil, nil, 0     # n1, n2, n3, l3, carry 分别为
                                                  # 节点 1,2,3, 链表 l3, 进位 carry
  while n1 || n2
    # 节点存在时，取出节点 n1 的值，然后，将节点 n1 向后移 1 位 (`n1.next`)
    n1 ? (v1 = n1.val; n1 = n1.next) : (v1 = 0)
    n2 ? (v2 = n2.val; n2 = n2.next) : (v2 = 0)

    sum = v1 + v2 + carry
    carry, digit = sum.divmod(10)                  # 更新进位 carry 和准备新节点的值 digit

    n = ListNode.new(digit)                        # 新建一个节点
    # 确定循环中链表 l3 上的当前节点 n3
    n3 ? (n3.next = n; n3 = n) : (n3 = n; l3 = n3)
  end
  n3.next = ListNode.new(carry) if carry.nonzero?  # 进位 carry 不为 0 时，在 n3 后新建一个节点

  l3                                               # 返回链表 l3
end

node1 = ListNode.new(2)
node1.next = ListNode.new(4)
node1.next.next  = ListNode.new(3)
p list1 = node1
# <ListNode:0x00007ff0848f1d90 @val=2,
#   @next=#<ListNode:0x00007ff0848f1d68 @val=4,
#     @next=#<ListNode:0x00007ff0848f1d18 @val=3,
#       @next=nil>>>

node2 = ListNode.new(5)
node2.next = ListNode.new(6)
node2.next.next  = ListNode.new(4)
p list2 = node2
# <ListNode:0x00007faccd0c5310 @val=5,
#   @next=#<ListNode:0x00007faccd0c52c0 @val=6,
#     @next=#<ListNode:0x00007faccd0c5298 @val=4,
#       @next=nil>>>

p list3 = add_two_numbers(list1, list2)
# <ListNode:0x00007ff3c88b4c50 @val=7,
#   @next=#<ListNode:0x00007ff3c88b4c00 @val=0,
#     @next=#<ListNode:0x00007ff3c88b4b88 @val=8,
#        @next=nil>>>
