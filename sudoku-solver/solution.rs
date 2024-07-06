impl Solution {
    pub fn solve_sudoku(board: &mut Vec<Vec<char>>) {
        Self::solve(board);
    }

    fn solve(board: &mut Vec<Vec<char>>) -> bool {
        for i in 0..9 {
            for j in 0..9 {
                if board[i][j] == '.' {
                    for num in '1'..='9' {
                        if Self::is_valid(board, i, j, num) {
                            board[i][j] = num;
                            if Self::solve(board) {
                                return true;
                            }
                            board[i][j] = '.';
                        }
                    }
                    return false;
                }
            }
        }
        true
    }

    fn is_valid(board: &Vec<Vec<char>>, row: usize, col: usize, num: char) -> bool {
        for i in 0..9 {
            if board[row][i] == num
                || board[i][col] == num
                || board[row / 3 * 3 + i / 3][col / 3 * 3 + i % 3] == num
            {
                return false;
            }
        }
        true
    }
}
