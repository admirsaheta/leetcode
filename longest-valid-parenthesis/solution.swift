class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var stack = [Int]()
        stack.append(-1) 
        var maxLength = 0
        
        for (index, char) in s.enumerated() {
            if char == "(" {
                stack.append(index)
            } else {
                stack.popLast()
                if let last = stack.last {
                    maxLength = max(maxLength, index - last)
                } else {
                    stack.append(index)
                }
            }
        }
        
        return maxLength
    }
}

