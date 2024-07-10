impl Solution {
    pub fn solve_n_queens(n: i32) -> Vec<Vec<String>> {
        fn is_valid(board: &Vec<Vec<char>>, row: usize, col: usize, n: usize) -> bool {
            for i in 0..row {
                if board[i][col] == 'Q' {
                    return false;
                }
            }
            let (mut i, mut j) = (row as i32, col as i32);
            while i >= 0 && j >= 0 {
                if board[i as usize][j as usize] == 'Q' {
                    return false;
                }
                i -= 1;
                j -= 1;
            }
            let (mut i, mut j) = (row as i32, col as i32);
            while i >= 0 && j < n as i32 {
                if board[i as usize][j as usize] == 'Q' {
                    return false;
                }
                i -= 1;
                j += 1;
            }
            true
        }

        fn solve(
            board: &mut Vec<Vec<char>>,
            row: usize,
            n: usize,
            solutions: &mut Vec<Vec<String>>,
        ) {
            if row == n {
                solutions.push(board.iter().map(|row| row.iter().collect()).collect());
                return;
            }

            for col in 0..n {
                if is_valid(board, row, col, n) {
                    board[row][col] = 'Q';
                    solve(board, row + 1, n, solutions);
                    board[row][col] = '.';
                }
            }
        }

        let mut board = vec![vec!['.'; n as usize]; n as usize];
        let mut solutions = vec![];
        solve(&mut board, 0, n as usize, &mut solutions);
        solutions
    }
}
