/**
 * Definition for singly-linked list.
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
class Solution {
    fun mergeKLists(lists: Array<ListNode?>): ListNode? {
        if (lists.isEmpty()) return null
        
        val priorityQueue = PriorityQueue<ListNode>(compareBy { it.`val` })
        
        for (node in lists) {
            if (node != null) {
                priorityQueue.add(node)
            }
        }
        
        val dummy = ListNode(0)
        var current: ListNode? = dummy
        
        while (priorityQueue.isNotEmpty()) {
            val smallestNode = priorityQueue.poll()
            current?.next = smallestNode
            current = current?.next
            
            if (smallestNode.next != null) {
                priorityQueue.add(smallestNode.next)
            }
        }
        
        return dummy.next
    }
}


fun createLinkedList(values: List<Int>): ListNode? {
    if (values.isEmpty()) return null
    val dummy = ListNode(0)
    var current = dummy
    for (value in values) {
        current.next = ListNode(value)
        current = current.next!!
    }
    return dummy.next
}

fun linkedListToList(node: ListNode?): List<Int> {
    val result = mutableListOf<Int>()
    var current = node
    while (current != null) {
        result.add(current.`val`)
        current = current.next
    }
    return result
}

