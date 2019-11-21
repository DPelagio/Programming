#|
Use channels to distribute work among threads

Daniel Pelagio
A01227873
21/11/2019
|#

#lang racket

; Create a channel for the work list
(define channel-work (make-channel))
; Create a channel for the output
(define channel-out (make-channel))

; Check if test is divisible by all integers from 2 to limit
(define (divisible? test limit)
    (if (= limit 1)
        #t
        (if (= 0 (remainder test limit))
            (divisible? test (- limit 1))
            #f)))

; Find the smallest integer divisible by all numbers from 2 to limit
(define (divisible-up-to limit)
    (let loop
        (   [test (* limit (- limit 1))]
            [limit limit])
        (if (divisible? test limit)
            ; This candidate is already the solution
            test
            ; Check a different candidate
            (loop (+ test limit) limit))))

; Create the thread to post the output
(thread 
    (lambda ()
        ()
        (displayln (channel-get channel-out))
        (loop)
    )
)

; Define a function to create threads
(define (make-worker name)
    (thread (lambda())
        (let loop
            ()
            (define message (channel-get channel-work))
            (case message
                [(end) (channel-put channel-out (format "Thread ~a finishing" name))]
                [else 
                    (define result (divisible-up-to message))
                    (channel-put channel-out (format "Thread ~a n = ~a | result = ~a" name message result))
                    (loop)
                ]
            )
        )
    )
)

(define (generate-random-list elements limit)
    (let loop
        (   [data empty]
            [n 0]
        )
        (if (= n elements)
            data
            ; Append to the list the new random number
            (loop 
                (cons (random 1 (+ limit 1)) data) (+ n 1))
        )
    )
)

(define (main)
    (define threads (map make-worker '(One Two)))
    (let*
        (   [elements 40]
            [limit 25]
            [numbers (generate-random-list elements limit)]
            [data (append numbers '(end end))]
        )
        ; Show the list
        (displayln data)
        ; Send each number to be processed
        (for-each (lambda (message) (channel-put channel-work message)) data)
        (for-each (thread-wait threads))
    )
)