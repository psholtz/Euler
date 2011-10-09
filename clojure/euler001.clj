;;
;; Problem 1
;;
;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
;; The sum of these multiples is 23.
;;
;; Find the sum of all the multiples of 3 or 5 below 1000.
;;

(defn euler001 [n]
  (defn sum-iter [i total]
    (cond (>= i n) total
          (or (= (rem i 3) 0) (= (rem i 5) 0)) (sum-iter (+ i 1) (+ i total))
          :else (sum-iter (+ i 1) total)))
  (sum-iter 1 0))

;;
;; Run the test:
;;
(euler001 1000)
;; ==> 233168

;; ================== 
;; ALTERNATE SOLUTION
;; ================== 
;;
;; A more "functional" way to get the same answer might have been something like the following.
;;
;; First define a stream of integers that we can cull from:
;;
(def nums (iterate inc 1))

;;
;; Define a "filter" procedure to test whether we want to keep the particular number:
;;
(def divisible? [x] (or (= (rem x 3) 0) (= (rem x 5) 0)))

;;
;; Finally, filter and reduce the number stream up to the point we are looking for:
;;
(defn euler001b [n]
  (reduce + 0 (filter divisible? (take (- n 1) nums))))

;;
;; Run the tests:
;;
(euler001b 10)
;; ==> 23
(euler001b 1000)
;; ==> 233168