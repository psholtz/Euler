#
# Problem 1
# 
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.#
#

# 
# Use set comprehensions to define an array "a".
# Use "inject" to reduce the array using addition.
#
def euler001(n)
  a = (1..(n-1)).map { |x| (x % 3 == 0) || (x % 5 == 0) ? x : nil }.compact
  a.inject{|sum,x| sum + x}
end

euler001(10)
# ==> 23

euler001(1000)
# ==> 233,168