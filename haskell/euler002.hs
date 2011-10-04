--
-- Each new term in the Fibonacci sequence is generated by adding the previous two terms.
-- By starting with 1 and 2, the first 10 terms will be:
--
-- 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
--
-- By considering the terms in the Fibonacci sequence whose values do not exceed four
-- million, find the sum of the even-valued terms.
--

-- Define a "fast" Fibonacci calculator

fib n = fibiter 1 0 0 1 n

fibiter a b p q count | count == 0 = b
                     | even count = fibiter a b (p*p + q*q) (2*p*q + q*q) (count `div` 2)
                     | otherwise = fibiter (b*q + a*q + a*p) (b*p + a*q) p q (count - 1)

-- Playing around, we see that "fib 33"	is the largest member of the Fibonacci
-- sequence which is still smaller than	4,000,000. We thus have:

sum (filter even (map fib [ x | x <- [1..33]] ) )

-- 4,613,732

-- If we didn't	know that 33 was the limit point, we could use a set comprehension as before:

sum (filter even (map fib [ x |	 x <- [1..100], fib x < 4000000] ) )

-- 4,613,732

