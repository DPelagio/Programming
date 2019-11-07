#|
Daniel Pelagio
07/11/2019

Concurrency Programming
|#

#lang racket

(define (starting)
    (display "This is the thread")
)

(define (main)
    (display "Main Thread\n")
    ; Run the thread
    (thread (lambda () (printf "Thread 1: ~a\n" (current-thread))))
    (thread (lambda () (display "Thread 2\n")))
    (thread (lambda () (display "Thread 3\n")))
    (display "Main Finishing\n")
)

(define (main2)
    (display "The main thread\n")
    (define counter 
        (thread 
            (lambda ()
                (let loop
                    ([n 0])
                    (if (< n 10)
                        (begin 
                            (printf "Iteration ~a in thread\n" n)
                            (sleep 0.2)
                            (loop (+ n 1))
                        )
                        (printf "Thread finishing\n")
                    )   
                )
            )
        )
    )
    ;(thread-wait counter)
    (display "Main thread finished")
)


(define (counter-fun)
    ;Loop inside a function
    (let loop
        ([n 0])
        (if (equal? (thread-receive) 'hello)
            (begin 
                (printf "Iteration ~a in thread\n" n)
                (sleep 0.2)
                (loop)
            )
            (printf "Thread finishing\n")
        ) 
    )
)

(define (main3)
    (display "The main thread\n")
    (define counter (thread counter-fun))
    (let loop
        ([n 0])
        (if (< n 10)
            (begin
                (thread-send counter 'hello)
                (loop (+ n 1))
            )
            (thread-send counter 'finish)
        )
    )
    (display "Main thread finishing\n")
)
