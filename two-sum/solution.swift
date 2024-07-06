class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            let complement = target - num
            if let complementIndex = hashMap[complement] {
                return [complementIndex, index]
            }
            hashMap[num] = index
        }
        
        return []
    }
}

let solution = Solution()
print(solution.twoSum([2,7,11,15], 9)) 
print(solution.twoSum([3,2,4], 6)) 
print(solution.twoSum([3,3], 6)) 
