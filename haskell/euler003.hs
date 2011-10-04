--
-- Problem 3
-- 
-- [WORKING]
--

--
-- Define a fast procedure for calculating base raised to exponent, mod m:
--
square n = n * n

expmod base exp m | exp == 0 = 1
                  | even exp = rem (square (expmod base (exp `div` 2) m)) m
                  | otherwise = rem (base * (expmod base (exp - 1) m)) m

--
-- Define a fast algorithm for testing primality:
--
testValue a n = (expmod a (n-1) n) == 1

isPrime n | n == 2 = True
          | n == 3 = True
          | n == 4 = False
          | n == 5 = True
          | otherwise = (testValue (n-1) n) && 
                        (testValue (n-2) n) 