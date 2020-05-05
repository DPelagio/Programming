#|
Daniel Pelagio
23/09/2019

program to find the minimum number divisible up to certain number
|#

#lang racket

(define (divisible? test limit)
	(if (= limit 1) 
		#t
		(if (= 0 (modulo test limit))
			(divisible? test (- limit 1)) 
			#f
		)
	)
)

(define (divisible-up-2 limit)
	(let loop
		(
			[test (* limit (- limit 1))]
			[limit limit]
		)
		(
			if (divisible? test limit)
				(test)
				(loop (+ test limit) limit)
		)
	)
)

;Writing to a file
;Overwriting

(define out (open-output-file "test.txt" #:exists 'truncate))
(write "This is only a test 1\n" out)
(display "This is only a test 2\n" out)
(display "This is only a test 3\n" out)
(display "This is only a test 4\n" out)
(close-output-port out)

;read from a file

(define in (open-input-file "test.txt"))
(read-line in)
(close-input-port in)


