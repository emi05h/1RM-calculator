#lang racket

(displayln "Input a certain amount of weight and amount of reps done in given exercise -> 1RM will be calculated. ")
(displayln " ")

;; exercises that are taken as correct input (doesn't actually affect calculations of 1RM)
(define (check-input)
  (define correct-strings '("Bench" "bench" "Squat" "squat" "Deadlift" "deadlift"))

;; taking exercise in as input - recursion until correct input given
  (define (prompt-user)
    (display "Enter the exercise performed (Bench/Squat/Deadlift): ")
    (let ((exercise-input (read-line)))
      (if (member exercise-input correct-strings)
          (void)
          (begin
            (displayln "Error: Input is not one of the specified exercises. Try again!")
            (prompt-user)))))

(prompt-user))

;; Epley formula (1 + 0.033 * reps) for calculating 1 rep max
(define (1repmax weight reps)
  (* weight (+ 1 (* 0.033 reps))))

;; taking weight and number of reps as input for calculation
(define (calculate-1rm)
  (display "Enter the weight lifted (in kilograms): ")
  (define weight (string->number (read-line)))
  
  (display "Enter the number of repetitions: ")
  (define reps (string->number (read-line)))
  
  ;; calculation outputted if non-negative numbers
  (if (and (real? weight) (real? reps) (> weight 0) (> reps 0))
      (begin
        (display "Estimated 1RM: ")
        (display (1repmax weight reps))
        (displayln " Kg")
        (displayln " ")
        (displayln "keep up the good work :^)"))
      (displayln "Invalid input. Please enter non-negative numeric values for weight and reps.")))

;; Call function to calculate 1RM
(check-input)
(calculate-1rm)



