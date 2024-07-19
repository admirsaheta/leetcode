(define/contract (lucky-numbers matrix)
  (-> (listof (listof exact-integer?)) (listof exact-integer?))
  (define (min-with-index lst)
    (let loop ([lst lst] [min-val (first lst)] [min-index 0] [index 0])
      (cond
        [(empty? lst) (cons min-val min-index)]
        [(< (first lst) min-val) (loop (rest lst) (first lst) index (+ index 1))]
        [else (loop (rest lst) min-val min-index (+ index 1))])))
  (define (get-column matrix col-index)
    (map (lambda (row) (list-ref row col-index)) matrix))
  (define (is-max-in-column? val col)
    (not (for/or ([x col])
           (> x val))))
  (define min-row-values
    (map (lambda (row) (min-with-index row)) matrix))
  (define lucky-nums
    (filter
      (lambda (pair)
        (let* ([min-val (car pair)]
               [col-index (cdr pair)])
          (is-max-in-column? min-val (get-column matrix col-index))))
      min-row-values))
  (map car lucky-nums))
