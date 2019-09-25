#|
Daniel Pelagio
23/09/2019

program to find the minimum number divisible up to certain number
|#

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