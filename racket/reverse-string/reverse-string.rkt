#lang racket
(provide my-reverse)

(define (my-reverse s) ;I might redo this without using these builtin functions
    (list->string      ;but this does the task w/o reinventing the wheel
        (reverse
            (string->list s)
            )
        )
    )
