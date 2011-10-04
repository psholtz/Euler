;;
;; Problem 3
;;

;; 
;; Define a fast procedure for calculating exponents:
;;
(defn square [n] (* n n))

(defn expmod [base exp m]
  (cond (= exp 0) 1
  	(even? exp) (rem (square (expmod base (/ exp 2) m)) m)
	:else (rem (* base (expmod base (- exp 1) m)) m)))

;;
;; Define a fast procedure for testing primality.
;;
;; Warning: This procedure is probablitistic! 
;; It's not guaranteed to return the correct answer, 
;; but by repeated application, we can reduce our error 
;; rate to an acceptable level.
;;
;; The procedure tests for primes as follows:
;;
;; (a) Define a "test" to be evaluation of (expmod a (- n 1) n) for a sample number "a"
;; (b) We will run the test for (- n 1)
;; (c) We will run the test for (- n 2)
;; (d) We will run the test for three randomly selected integers in the range 2 to (- n 3), inclusive.
;; (e) If each of the above five tests described in (b), (c) and (d) returns 1, we can be relatively
;;     certain that we have a prime, and we will return "true"
;; (f) For the numbers 2, 3, 4, and 5 we return the answer in "hard-coded" fashion.
;;
(defn random [n]
  (Math/floor (rand n)))

(defn prime? [n]
  ;; get a random sample from the restricted range we're searching
  (defn get-random-a []
    (int (+ 2 (random (- n 4)))))

  ;; define the "expmod" test
  (defn test-value [a]
    (= (expmod a (- n 1) n) 1))

  ;; perform the probablistic test
  (cond (= n 2) true
    	(= n 3) true
	(= n 4) false
	(= n 5) true
	:else (and (test-value (- n 1))
	      	   (test-value (- n 2))
		   (test-value (get-random-a))
		   (test-value (get-random-a))
		   (test-value (get-random-a)))))

;;
;; Define an infinite sequence from which we can "pluck" primes:
;;
(def nums (iterate inc 2))

;;
;; Let's define our target number, and let's take note that we only need 
;; to test primes less than (or equal to) the square root of our target:
;;
(def x 600851475143)

;;
;; Generate a list of all the primes less than or equal to the square root of target:
;;
(def q (filter prime? (take (int (Math/sqrt x)) nums)))

;;
;; From this list, we only want to select those primes which are factors of our target:
;;
(defn is-factor? [n] (= (rem x n) 0))

;;
;; Generate a list of the prime factors of target;
(def w (filter is-factor? q))

;;
;; The list only has 4 elements:
;;
(nth w 0)
;; ==> 71
(nth w 1)
;; ==> 839
(nth w 2)
;; ==> 1471
(nth w 3)
;; ==> 6857

;;
;; A quick check verifies that all four numbers are prime:
;;
(prime? 71)
;; ==> true
(prime? 839)
;; ==> true
(prime? 1471)
;; ==> true
(prime? 6857)
;; ==> true

;;
;; Moreover, we can quickly verify that our target is the product of these four primes:
;;
(= x (* 71 839 1471 6857))

;;
;; The largest prime factor of our target is thus 6857.
;;
