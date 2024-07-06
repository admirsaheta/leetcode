class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let m = dungeon.count
        let n = dungeon[0].count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        
        dp[m-1][n-1] = max(1, 1 - dungeon[m-1][n-1])
        
        for i in stride(from: m - 2, through: 0, by: -1) {
            dp[i][n-1] = max(1, dp[i+1][n-1] - dungeon[i][n-1])
        }
        
        for j in stride(from: n - 2, through: 0, by: -1) {
            dp[m-1][j] = max(1, dp[m-1][j+1] - dungeon[m-1][j])
        }
        
        for i in stride(from: m - 2, through: 0, by: -1) {
            for j in stride(from: n - 2, through: 0, by: -1) {
                let right = max(1, dp[i][j+1] - dungeon[i][j])
                let down = max(1, dp[i+1][j] - dungeon[i][j])
                dp[i][j] = min(right, down)
            }
        }
        
        return dp[0][0]
    }
}