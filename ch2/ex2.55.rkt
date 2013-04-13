#lang racket
;; Exercise 2.55

(car ''abracadabra)

;; Expands to:
(car '(quote abracadabra))

;; This is a two element list, with the first element, "quote"
