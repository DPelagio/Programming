#|
Daniel Pelagio
26/09/2019

program to determine if a number is prime
Receives as argument a number, and returns true or false, indicating whether the argument is a prime number
|#

(define (prime? number)
	(prime_recursive number 2)
)

(define (prime_recursive number it)
	(if (= it number)
		#t
		(if (= (modulo number it) 0)
			#f
			(prime_recursive number (+ it 1))
		)
	)
)

(define (prime-less-than number)
	(prime-less-than-recursive number)
)

(define (prime-less-than-recursive number)
	(let loop
		(	[number number]
        	[cont 2]
            [result '()]
        )
		(if (= cont number)
			(display result)
			(if (prime? cont)
				(loop number (+ cont 1) (append result (list cont)))
            	(loop number (+ cont 1) result)
			)
		)
	)
)

(define (nth-prime number)
	(nth-prime-recursive number 2 0)
)

(define (nth-prime-recursive number it prime-n)
	(if (= prime-n number)
		(display (- it 1))
		(if (prime? it)
			(nth-prime-recursive number (+ it 1) (+ prime-n 1))
			(nth-prime-recursive number (+ it 1) prime-n)
		)
	)
)



