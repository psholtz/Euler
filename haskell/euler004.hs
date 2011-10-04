
cartesianProduct xs ys = [ (x,y) | x <- xs, y <- ys ]

multiplyPair x = fst x * snd x 

isPalindrome x = true

q = map multiplyPair ( cartesianProduct [10..99] [10..99] )


