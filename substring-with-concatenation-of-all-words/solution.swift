class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard !s.isEmpty, !words.isEmpty else { return [] }
        
        let wordLength = words[0].count
        let totalWordsLength = wordLength * words.count
        let sLength = s.count
        
        guard sLength >= totalWordsLength else { return [] }
        
        var wordCount: [String: Int] = [:]
        for word in words {
            wordCount[word, default: 0] += 1
        }
        
        var result: [Int] = []
        let sArray = Array(s)
        
        for i in 0..<wordLength {
            var left = i
            var currentCount: [String: Int] = [:]
            var wordWindow = 0
            
            for j in stride(from: i, to: sLength - wordLength + 1, by: wordLength) {
                let wordStart = j
                let wordEnd = j + wordLength
                let word = String(sArray[wordStart..<wordEnd])
                
                if let _ = wordCount[word] {
                    currentCount[word, default: 0] += 1
                    wordWindow += 1
                    
                    while currentCount[word]! > wordCount[word]! {
                        let leftWord = String(sArray[left..<left + wordLength])
                        currentCount[leftWord]! -= 1
                        left += wordLength
                        wordWindow -= 1
                    }
                    
                    if wordWindow == words.count {
                        result.append(left)
                    }
                } else {
                    currentCount.removeAll()
                    wordWindow = 0
                    left = j + wordLength
                }
            }
        }
        
        return result
    }
}

