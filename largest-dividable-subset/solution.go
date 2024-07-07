func largestDivisibleSubset(nums []int) []int {
    n := len(nums)
    if n == 0 {
        return nil
    }
    
    sort.Ints(nums)
    
    dp := make([]int, n)
    previousIndex := make([]int, n)
    
    for i := range dp {
        dp[i] = 1
        previousIndex[i] = -1
    }
    
    maxSize := 1
    maxIndex := 0
    
    for i := 1; i < n; i++ {
        for j := 0; j < i; j++ {
            if nums[i] % nums[j] == 0 && dp[j] + 1 > dp[i] {
                dp[i] = dp[j] + 1
                previousIndex[i] = j
            }
        }
        if dp[i] > maxSize {
            maxSize = dp[i]
            maxIndex = i
        }
    }
    
    result := []int{}
    for maxIndex != -1 {
        result = append(result, nums[maxIndex])
        maxIndex = previousIndex[maxIndex]
    }
    
    for i, j := 0, len(result)-1; i < j; i, j = i+1, j-1 {
        result[i], result[j] = result[j], result[i]
    }
    
    return result
}
