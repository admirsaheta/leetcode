(define (factorial n)
  (cond
    [(zero? n) 1]
    [else (* n (factorial (sub1 n)))]))

(define/contract (get-permutation n k)
  (-> exact-integer? exact-integer? string?)
  (let loop ((nums (build-list n add1))
             (k (sub1 k))               
             (result ""))
    (if (null? nums)
        result
        (let* ((n (length nums))
               (fact (factorial (sub1 n)))
               (index (quotient k fact))
               (new-k (modulo k fact)))
          (loop (remove (list-ref nums index) nums)
                new-k
                (string-append result (number->string (list-ref nums index))))))))