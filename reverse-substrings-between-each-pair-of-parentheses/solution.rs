impl Solution {
    pub fn reverse_parentheses(s: String) -> String {
        let mut stack: Vec<String> = Vec::new();
        let mut current_string = String::new();

        for ch in s.chars() {
            if ch == '(' {
                stack.push(current_string);
                current_string = String::new();
            } else if ch == ')' {
                let mut temp = current_string.chars().rev().collect::<String>();
                if let Some(mut prev) = stack.pop() {
                    prev.push_str(&temp);
                    current_string = prev;
                }
            } else {
                current_string.push(ch);
            }
        }

        current_string
    }
}
