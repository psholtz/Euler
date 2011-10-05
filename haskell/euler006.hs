--
-- Problem 6
--
-- The sum of the squares of the first ten natural numbers is 385.
--
-- The square of the sum of the first ten natural numbers is 3025.
--
-- The difference between these two is 2640.
--
-- What is the corresponding difference for the first 100 natural numbers?
--

--
-- Define the procedures we need:
--
square x = x * x
sum1 n = foldr (+) 0 ( map square [1..n] )
sum2 n = square ( foldr (+) 0 [1..n] )
diff n = sum2(n) - sum1(n)

--
-- The answer is given by invoking "diff 100":
--
-- ==> 25,164,150
--