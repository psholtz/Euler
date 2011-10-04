--
-- Problem 4
--
-- A palindromic number reads the same both ways. The largest palindrome made from the product
-- of two 2-digit numbers is 9009 = 91 x 99. 
--
-- Find the largest palindrome made from the product of two 3-digit numbers.
--

--
-- Define a palindrome function that takes two lists as arguments, and returns the 
-- list of palindromes that they generate:
--
palindrome xs ys = [ x*y | x <- xs, y <- ys, reverse( show( x * y ) ) == show( x * y ) ]

--
-- Pluck out the largest element in the generated list:
--
biggestPalindrome xs ys = maximum ( palindrome xs ys )

-- 
-- Run the tests:
--
x = [10..99]
biggestPalindrome x x
-- ==> 9009

y = [100..999]
biggestPalindrome y y
-- ==> 906609
