impl Solution {
    pub fn first_missing_positive(mut nums: Vec<i32>) -> i32 {
        let n = nums.len() as i32;

        for i in 0..nums.len() {
            let mut num = nums[i];
            while num > 0 && num <= n && nums[(num - 1) as usize] != num {
                let temp = nums[(num - 1) as usize];
                nums[(num - 1) as usize] = num;
                num = temp;
            }
        }

        for i in 0..nums.len() {
            if nums[i] != (i as i32 + 1) {
                return (i as i32 + 1);
            }
        }

        return n + 1;
    }
}
