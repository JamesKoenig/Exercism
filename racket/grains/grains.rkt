#lang racket

; each square has the double of the previous, where the first has 1, so this is
; a geometric sequence by progression of powers of 2, starting with 1
; which is itself equivalent to two to the power of 0
(define (square n)
  (expt 2 (- n 1))
  )

; a way of looking at this, is, since this is a progression of powers of 2, is
; a binary number where each of the bits is set to 1, which is itself one less
; than the value of the next square in the sequence
; as such this could just as easily have been defined as 
;   (- (square (+ 64 1)) 1)
(define total
    (- (expt 2 64) 1)
  )

(provide square total)
