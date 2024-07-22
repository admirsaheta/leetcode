(define (sort-people names heights)
(define pairs (map cons heights names)) ;
(define sorted-pairs (sort pairs > #:key car))
(map cdr sorted-pairs)) 