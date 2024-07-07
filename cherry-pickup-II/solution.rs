impl Solution {
    pub fn cherry_pickup(grid: Vec<Vec<i32>>) -> i32 {
        let rows = grid.len();
        let cols = grid[0].len();

        let mut dp = vec![vec![vec![-1; cols]; cols]; rows];

        dp[0][0][cols - 1] = grid[0][0] + if cols > 1 { grid[0][cols - 1] } else { 0 };

        for row in 1..rows {
            let mut current_dp = vec![vec![-1; cols]; cols];

            for col1 in 0..cols {
                for col2 in 0..cols {
                    if dp[row - 1][col1][col2] != -1 {
                        for i in -1..=1 {
                            for j in -1..=1 {
                                let new_col1 = col1 as i32 + i;
                                let new_col2 = col2 as i32 + j;
                                if new_col1 >= 0
                                    && new_col1 < cols as i32
                                    && new_col2 >= 0
                                    && new_col2 < cols as i32
                                {
                                    let new_col1 = new_col1 as usize;
                                    let new_col2 = new_col2 as usize;

                                    let cherries = grid[row][new_col1]
                                        + if new_col1 != new_col2 {
                                            grid[row][new_col2]
                                        } else {
                                            0
                                        };

                                    current_dp[new_col1][new_col2] = current_dp[new_col1][new_col2]
                                        .max(dp[row - 1][col1][col2] + cherries);
                                }
                            }
                        }
                    }
                }
            }

            dp[row] = current_dp;
        }

        let mut result = 0;
        for col1 in 0..cols {
            for col2 in 0..cols {
                result = result.max(dp[rows - 1][col1][col2]);
            }
        }

        result
    }
}
