# https://carlosplusplus.github.io/blog/2013/08/08/linked-lists-and-ruby/
#
# Define a Node class that holds the following:
#   => next: stores the next Node in the Linked List.
#   => value: stores the value of the current list element.

class ListNode                     # 链表节点
  attr_accessor :val, :next
  def initialize(val)
    @val = val                     # 当前节点的值
    @next = nil                    # 下一个节点
  end
end

# Define a LinkedList class the holds the following:
#   => head: pointer to the head of the Linked List.
#   => tail: pointer to the tail of the Linked List.

class LinkedList
  attr_accessor :head, :tail

  # Initialize head and tail to same initial Node.
  def initialize (head)
    raise "LinkedList must be initialized with a Node." unless head.is_a?(ListNode)

    @head = head
    @tail = head
  end

  # Insert Node after the tail of the LinkedList.
  def insert(node)
    @tail.next = node
    @tail      = @tail.next
  end

  # Print out all the values of the LinkedList in order.
  def print
    current_node = @head

    arr = []
    while current_node != nil
      arr << current_node.val
      # puts "\tLL Node Value = #{current_node.val}"
      current_node = current_node.next
    end
    p arr
  end

  # Iterate through LinkedList and perform block actions.
  def iterate
    if block_given?
      current_node = @head

      while current_node != nil
        yield current_node.val
        current_node = current_node.next
      end
    else
      print
    end
  end
end

#############
# TESTBENCH #
#############

puts "\nCreating LinkedList of 5 Node elements with values 1-5.\n"

h    = ListNode.new(1)
list = LinkedList.new(h)

(2..5).each {|n| list.insert(ListNode.new(n)) }

puts "\nCurrent values contained in LinkedList:\n"

list.print

puts "\n"
puts "Values of head and tail of LinkedList:\n"

puts "\tValue of LL Head = #{list.head.val}"
puts "\tValue of LL Tail = #{list.tail.val}"

puts "\n"
puts "Iterating through LinkedList without a block prints the list.\n"

list.iterate

puts "\n"
puts "Iterating through the LinkedList with a block runs the block on each element.\n"

list.iterate {|n| puts "\tLL Node Value squared = #{n ** 2}"}

puts "\n"
