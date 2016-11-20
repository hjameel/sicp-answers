#lang planet neil/sicp

;; Pascals triangle

(define (pascal row column)
  (cond ((or (zero? column) (eq? row column)) 1)
        (else (+ (pascal (- row 1) column)
                 (pascal (- row 1) (- column 1))))))

(display "First row\n")
(eq? 1 (pascal 0 0))

(display "Second row\n")
(eq? 1 (pascal 1 0))
(eq? 1 (pascal 1 1))

(display "Third row\n")
(eq? 1 (pascal 2 0))
(eq? 2 (pascal 2 1))
(eq? 1 (pascal 2 2))

(display "Fourth row\n")
(eq? 1 (pascal 3 0))
(eq? 3 (pascal 3 1))
(eq? 3 (pascal 3 2))
(eq? 1 (pascal 3 3))

(display "Fifth row\n")
(eq? 1 (pascal 4 0))
(eq? 4 (pascal 4 1))
(eq? 6 (pascal 4 2))
(eq? 4 (pascal 4 3))
(eq? 1 (pascal 4 4))
