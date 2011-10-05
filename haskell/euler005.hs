--
-- Problem 5
-- 
-- 2520 is the smallest number that can be divided by each of the numbers from 1 
-- 10 without any remainder.
--
-- What is the smallest positive number that is evenly divisible by all of the 
-- numbers from 1 to 20?
--

-- !!!!!!!!! 
-- [WORKING]
-- !!!!!!!!! 

--
-- Answer: 232,792,560
--

--
-- A completely "brute-force" way to force your way to solution would be something like the following:
--
-- (1) Develop a procedure that checks to see if n is divisible by k
-- (2) Develop a procedure that checks to see if, given an n, it is divisible by every k in the range [low..high]
-- (3) Filter to find those n in this range which are divisible by every element of the range
-- (4) Select the smallest element returned by the filter
--

--
-- We'll implement this solution, and then we'll demonstrate a much quicker way to arrive at the same answer.
--

isDivisibleByK :: Integral a => a -> a -> Bool
isDivisibleByK n = (\k -> n `mod` k == 0)

findDivisorsInRange :: Integral a => a -> a -> a-> Bool
findDivisorsInRange low high = (\n -> foldr(&&) True (map (isDivisibleByK n) [low..high]))

--
-- To use these procedures to find the numbers, between 1 and 10,000, that meet our criteria, we would write:
--
-- filter ( findDivisorsInRange 1 10 ) [1..10000]
--
-- This call returns:
--
-- [2520, 5040, 7560]
--
-- In other words, the numbers less than 10,000 which are divisible by all the numbers in the range [1..10]
--
-- The answer to the question we seek is 232,792,560, and we can generate this number by making the 
-- following call:
--
-- filter ( findDivisorsInRange 1 20 ) [1..1000000000]
--
-- However, the code runs VERY slowly.. it takes about 10 minutes, on a relatively quick computer, to arrive
-- at the first multiple (i.e., the answer given above).
--
-- There is a better way.
--

-- ++++++++++++++++++++
-- THE PRIME FACTOR BAG
-- ++++++++++++++++++++ 

--
-- Suppose we want to determine the smallest number which is a multiple of all the numbers from 1 to n.
-- A better way to do this is to generate a bag of all the prime factors of all the numbers less than n, 
-- and then simply reduce the bag under multiplication.
--
-- Because we are counting primes only up to 20 (or some other small n), which don't need an especially
-- fast or fancy algorithm to determine whether an integer is prime:
--

isPrime :: Integral a => a -> Bool
isPrime n = (smallestDivisor n) == n

smallestDivisor :: Integral a => a -> a
smallestDivisor n = findDivisor n 2

square :: Num a => a -> a
square n = n * n 

findDivisor :: Integral a => a -> a-> a
findDivisor n test | (square test) > n = n
                   | (isDivisibleByK n) test = test
   		   | otherwise = findDivisor n (test+1)

--
-- Now let's generate a lambda procedure that gives us all the primes less than a certain number n:
--
primes :: Integral a => Int -> [a]
primes n = filter isPrime ( take (n-1) [2..] )

--
-- Finally let's define the procedure we are looking for: return the smallest number which 
-- is a multiple of all numbers up to and including n.
--
multiples n = 1

-- [WORKING]
