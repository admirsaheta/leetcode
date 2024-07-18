#lang racket

(require racket/contract)

(define/contract (three-consecutive-odds arr)
  (-> (listof exact-integer?) boolean?)
  (let loop ([lst arr])
    (cond
      [(< (length lst) 3) #f]
      [(and (odd? (first lst))
            (odd? (second lst))
            (odd? (third lst)))
       #t] 
      [else (loop (rest lst))]))) 