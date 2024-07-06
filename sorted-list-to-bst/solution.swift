// Beats 97.14% of swift submissions.
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        func findSize(_ head: ListNode?) -> Int {
            var current = head
            var size = 0
            while current != nil {
                size += 1
                current = current?.next
            }
            return size
        }
        
        func convertListToBST(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }
            
            let mid = (left + right) / 2
            
            let leftTree = convertListToBST(left, mid - 1)
            
            let node = TreeNode(current!.val)
            node.left = leftTree
            
            current = current?.next
            
            node.right = convertListToBST(mid + 1, right)
            
            return node
        }
        
        let size = findSize(head)
        
        var current = head
        
        return convertListToBST(0, size - 1 )
    }
}

