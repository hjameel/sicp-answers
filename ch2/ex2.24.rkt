#lang racket
;; Exercise 2.24

(require "helpers.rkt")

(list 1 2)
;; is equivalent to
(cons 1
      (cons 2 nil))

;; therefore
(list 1 (list 2 (list 3 4)))
;; is equivalent to
(list 1 (list 2 (cons 3
                      (cons 4 nil))))
;; which is equivalent to
(list 1 (cons 2
              (cons (cons 3
                          (cons 4 nil))
                    nil)))
;; which is equivalent to
(cons 1 (cons (cons 2
                    (cons (cons 3
                                (cons 4 nil))
                          nil))
              nil))

;; which would be printed as
'(1 (2 (3 4)))

;; The box and pointer diagram would look as follows:
;; +---+---+     +---+---+
;; | 1 | --+---->|   | / |
;; +-+-+-+-+     +-+-+-+-+
;;                 |
;;                 V
;;               +---+---+     +---+---+
;;               | 2 | --+---->|   | / |
;;               +-+-+---+     +-+-+-+-+
;;                               |
;;                               V
;;                             +---+---+     +---+---+
;;                             | 3 | --+---->| 4 | / |
;;                             +---+---+     +---+---+

;; In tree form this would be
;;   /\
;;  /  \
;; 1   /\
;;    /  \
;;   2   /\
;;      /  \
;;     3    4
