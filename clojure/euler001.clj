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