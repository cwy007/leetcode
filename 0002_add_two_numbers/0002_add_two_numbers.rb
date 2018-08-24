# https://leetcode.com/problems/add-two-numbers/description/
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
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end
#
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}


<<<<<<< Updated upstream
require 'linked_list'

def add_two_numbers(l1, l2)
  n1, n2, n3, l3, carry = l1, l2, nil, nil, 0

  while n1 || n2
    n1 ? (v1 = n1.val; n1 = n1.next) : (v1 = 0)
    n2 ? (v2 = n2.val; n2 = n2.next) : (v2 = 0)

    sum = v1 + v2 + carry
    carry, digit = sum.divmod(10)

    n = ListNode.new(digit)
    n3 ? (n3.next = n; n3 = n) : (n3 = n; l3 = n3)
  end
  n3.next = ListNode.new(carry) if carry.nonzero?

  l3
end

# 243
# 564

#
# def add_two_numbers(l1, l2)
#   n1, n2, n3, l3, carry = l1, l2, nil, nil, 0
#
#   while n1 || n2
#     n1 ? (v1 = n1.val; n1 = n1.next) : (v1 = 0)
#     n2 ? (v2 = n2.val; n2 = n2.next) : (v2 = 0)
#
#     sum = v1 + v2 + carry
#     carry, digit = sum.divmod(10)
#
#     n = ListNode.new(digit)
#     n3 ? (n3.next = n; n3 = n) : (n3 = n; l3 = n3)
#   end
#   n3.next = ListNode.new(carry) if carry.nonzero?
#
#   l3
# end
=======
require_relative 'linked_list'

def add_two_numbers(l1, l2)                          # l1, l2 为两个链表
  dummy_head = ListNode.new(0)                       # 链表的假的头部节点
  n1, n2, curr, carry = l1&.head, l2.head, dummy_head, 0

  while n1 || n2
    x = n1 ? n1.val : 0
    y = n2 ? n2.val : 0
    sum = carry + x + y
    carry = sum / 10
    curr.next = ListNode.new(sum % 10)
    curr = curr.next
    n1 = n1&.next
    n2 = n2&.next
  end
  curr.next = ListNode.new(carry) if carry > 0
  LinkedList.new(dummy_head.next)
end

# 新建两个链表 list1, list2
node1 = ListNode.new(2)
list1 = LinkedList.new(node1)
[4, 3].each { |n| list1.insert(ListNode.new(n)) }

node2 = ListNode.new(5)
list2 = LinkedList.new(node2)
[6,4].each { |n| list2.insert(ListNode.new(n)) }

p list3 = add_two_numbers(list1, list2)
# <LinkedList:0x00007fb14d886750
#   @head=#<ListNode:0x00007fb14d8867f0 @val=7,
#     @next=#<ListNode:0x00007fb14d8867a0 @val=0,
#       @next=#<ListNode:0x00007fb14d886778 @val=8,
#         @next=nil>>>,
#   @tail=#<ListNode:0x00007fb14d8867f0 @val=7,
#     @next=#<ListNode:0x00007fb14d8867a0 @val=0,
#       @next=#<ListNode:0x00007fb14d886778 @val=8,
#         @next=nil>>>
# >

p list1.to_array                    # => [2, 4, 3]
p list2.to_array                    # => [2, 4, 3]
p list3.to_array                    # => [7, 0, 8]
p list3.iterate                     # => [7, 0, 8]
p list3.iterate { |val| val * 2 }   # => [14, 0, 16]
p list3.iterate { |val| val ** 2 }  # => [49, 0, 64]
>>>>>>> Stashed changes
