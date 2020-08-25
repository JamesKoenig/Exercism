#lang racket

; I derived exact polynomials for this solution when I did this in vimscript
;   so I just copied those over
; if you want to do things with finite differences in general, I recommend the
; book Concrete Mathematics A Foundation For Computer Science by Graham, 
; Knuth, and Patashnik. particularly chapter 2

; writing this, though, made me want to look into representing any nth-order
; polynomial within Racket.  This method will do for this exercise, but I'll 
; probably look into it as an exercise per se stesso.

(define (sum-of-squares n)
  (/ (+ (* 2 (expt n 3))
        (* 3 (expt n 2))
        n)
     6))

(define (square-of-sum n)
  (/ (+ (expt n 4)
        (* 2 (expt n 3))
        (expt n 2))
     4))

(define (difference n)
  (/ (+ (* 3  (expt n 4))
        (* 2  (expt n 3))
        (* -3 (expt n 2))
        (* -2 n))
     12))

(provide sum-of-squares square-of-sum difference)
