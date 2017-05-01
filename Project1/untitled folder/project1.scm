#lang racket

(require racket/trace)

;;; aturgut@ku.edu.tr  	    	  	  
;;;  	    	  	  
;;; Comp200 Project 1  	    	  	  
;;;  	    	  	  
;;; Before you start:  	    	  	  
;;; * Please read the "Project 1" handout.
;;;   (both available under Assignments on course website)
;;; * Plan your work with pencil and paper before starting to code.
;;;  	    	  	  
;;; While you are working:  	    	  	  
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code.
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;;  	    	  	  
;;;     *** NOTHING WRITTEN GETS EXCHANGED ***
;;;  	    	  	  
;;; When you are done:  	    	  	  
;;; * Perform a final save and check-in.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please email comp200help@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;;  	    	  	  
;;;     *** IF LOADING GIVES ERRORS YOUR PROJECT WILL NOT BE GRADED ***
;;;  	    	  	  
;;; * Before the definition of each procedure, please write a description
;;; * about what the procedure does and what its input and output should
;;; * be, making sure the lines are commented out with semi-columns.
;;;  	    	  	  
;;;  	    	  	  
;;; The following lines are necessary, please do not delete:
(define your-answer-here -1)  	    	  	  
;;;  	    	  	  
;;;  	    	  	  
;;;  	    	  	  
;;; A world with gorillas throwing explosive bananas
;;;  	    	  	  
;; Some utility definitions have been provided for you to make your
;; work easier.  Also some of the constants and procedures such as
;; gravity acceleration 9.8m/s2 or (degree2radian deg) are defined as
;; you can see below.  	    	  	  
  	    	  	  
(define pi (acos -1))			; value of pi for degree2radian
  	    	  	  
(define g 9.8)				; gravitational constant
  	    	  	  
;; Hint::for some values the degree2radian approaches to zero so do
;; not panic if do not get exactly zero while you are testing the test
;; cases.  	    	  	  
  	    	  	  
(define degree2radian  	    	  	  
  (lambda (deg)  	    	  	  
    (/ (* deg pi) 180.)))  	    	  	  
  	    	  	  
;; After each problem below, some test cases and their results are
;; given to use to check your results.
;;  	    	  	  
;; Please write brief comments where you see a "YOUR DOCUMENTATION
;; HERE" label and also write 3 extra test cases with their results
;; where you see a "YOUR TEST CASES" label.
;;  	    	  	  
  	    	  	  
  	    	  	  
;; Problem 1  	    	  	  
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	   	    	  	  
(define position  	    	  	  
  (lambda (a v u t)  	    	  	  

    (+ (/ (* a t t ) 2) (* v t ) u)
    
    ))

; In that implementation position of the banana were calculated according to given formula "ut = 1∕2 a t2 + v t + u"
; a represent accelaration
; v represent velocity
; t represent time
; u represent 
  	    	  	  
; Test cases  	    	  	  
;(position 0 0 0 0) 	; -> 0
;(position 0 0 20 0) 	; -> 20
;(position 0 5 10 10) 	; -> 60
;(position 2 2 2 2)	; -> 10
;(position 5 5 5 5)	; -> 92 1/2
  	    	  	  
; YOUR TEST CASES HERE...  	    	  	  
;(position 0 0 30 0)	; ->  30	    	  	  
;(position 1 0 10 10)	; ->  60	    	  	  
;(position 1 10 10 10)	; ->  160	 	    	  	  
  	    	  	  

;; Problem 2  	    	  	  
  	    	  	  
; Finds first root of az^2 + bz + c = 0
;  	    	  	  
(define root1  	    	  	  
  (lambda (a b c) (if (<= 0 (- (* b b) (* 4 a c ) )) 	    	  	  
(/ (- (sqrt(- (* b b) (* 4 a c))) b) (* 2 a ) ) 	    	  	  
    #f )))

; It finds first root of the given equation, if b^2 - 4ac < 0 returns #f
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
(define root2  	    	  	  
  (lambda (a b c)  (if (<= 0 (- (* b b) (* 4 a c ) ))	    	  	  
(/ (- (* (sqrt(- (* b b) (* 4 a c))) -1) b) (* 2 a ) ) 	    	  	  
  #f  )))

; It finds second root of the given equation if b^2 - 4ac < 0 returns #f
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
(define larger-root  	    	  	  
  (lambda (a b c)  (cond ((equal? (root1 a b c) #f) #f)
                         ((equal? (root2 a b c) #f) #f)

                         (else 
                         
(if (>= (root2 a b c) (root1 a b c)) (root2 a b c) (root1 a b c))
    
    ))))

; This code compares first and second root of the equation and code returns largest one. if roots #f, code returns #f
  	    	  	  
; Test cases  	    	  	  
;(root1 5 3 6)           ; ->   be careful about these kinds of conditions. #f
;(root2 6 3 6)           ; ->   be careful about these kinds of conditions. #f
;(larger-root 1 0 -4)	 ; -> 2
;  	    	  	  
; YOUR TEST CASES HERE...  	    	  	  
;(larger-root 1 5 4)		; -> -1	    	  	  
;(larger-root 1 -5 4)		; ->  4	    	  	  
;(larger-root 1 7 -9)	        ; ->  approx 1.11
  	    	  	  
;; Problem 3  	    	  	  
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
(define flight-time  	    	  	  
  (lambda (vertical-velocity elevation)

   (larger-root  -4.9 vertical-velocity elevation )))
; This code gives a flight time of the +y motion under the gravitional force.
; Quadratic formula of the flight time was implemented. (Note g = 9.8)
; Formula = (-1/2)*g*t^2 + vertical-velocity*time + elevation.
; This code, solves the quadratic equation, and returns largest root of the equation.

; According to that two diffrent root found,
; negative root should be ignored since time variable could not be negative.
; as a result code returns with positive root of the equation. 

;
  	    	  	  
; Test cases

;(flight-time 0 0)	; -> 0
;(flight-time 0 100)	; -> approx 4.5
;(flight-time 100 0)	; -> approx 20.4
;(flight-time 100 100)	; -> approx 21.4
;  	    	  	  
; YOUR TEST CASES HERE...  	    	  	  

;(flight-time 0 200)     ; -> approx 6.4 	    	  	  
;(flight-time 200 0)	; -> approx 40.8  	    	  	  
;(flight-time 200 200)	; -> approx 41.8 
  	    	  	  
;; Problem 4  	    	  	  
  	    	  	  
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;

(define degrees2radian (lambda (deg)
(/ (* deg pi) 180.)))

(define distance  	    	  	  
  (lambda (angle velocity elevation) (cond ((= angle 90) 0)

                                           
  	((and (< angle 90) (< 0 angle)) (* (flight-time
             (* velocity (sin (degrees2radian angle)))
             elevation)
            (* (cos (degrees2radian angle)) velocity)))

        (else (* (sqrt (/ (* 2 elevation   ) 9.8)) velocity)))))

; This code takes x and y vectors of the veloecity vector with trigonometric calculation.
; It takes angle between velocity vector and x axis. (angle converted from degree to radian)
; Code returns with distance of the flight of the vertical projecitle motion.
; In the code first flight time calculated with flight-time and velocity*sin(angle), then it is multiplied by 
; velocity*cos(theta)

; Test cases -- (distance angle velocity elevation)
;(distance 45 0 100)	; -> 0
;(distance 0 10 0)	; -> 0
;(distance 90 10 0)	; -> 0
;(distance 45 10 0)	; -> approx 10.2
;(distance 30 10 0)	; -> approx 8.8
;(distance 90 10 100)	; -> 0
;(distance 45 10 100)  	; -> approx 37.4   	  	  
;(distance 30 10 100)  	; -> approx 43.8   	    	  	  	    	  	  
;  	    	  	  
; YOUR TEST CASES HERE...  	    	  	  
;(distance 10 10 100)	; ->  approx 46.3	    	  	  
;(distance 15 10 100)	; ->  approx 46.3	    	  	  
;(distance 25 10 100)	; ->  approx 45.0
;(distance 0  10 10)    ; ->  approx 14.3
;(distance 18 11 10)    ; ->  approx 19.0  	    	  	  
  	    	  	  
;; Problem 5  	    	  	  
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
(define hit?  	    	  	  
  (lambda (angle velocity elevation burst-radius target-distance)
(and
 (if (>= (+ (distance angle velocity elevation) burst-radius) target-distance) #t #f)
 (if (<= (- (distance angle velocity elevation) burst-radius) target-distance) #t #f)
 )))

; This code returns with boolean answer. If banana hits,it returns true, if it does not hit the target, it returns false.
; Hit estimation, controlled with comparasion between distance of the flight and target distance - + burst radius
  	    	  	  
; Tests  	    	  	  
;(distance 45 10 0)	; -> approx 10.2
;(hit? 45 10 0 1 10)	; -> #t
;(hit? 45 10 0 1 50)	; -> #f
;  	    	  	  
; YOUR TEST CASES HERE...  	    	  	  
;(hit? 30 45 0 1 10)	; -> #f target distance 10+Burst - distance 179
;(distance 30 45 0)     ; -> 179
;(hit? 25 30 0 1 10)	; -> #f target distance 10+Burst - distance 45
;(distance 15 30 0)     ; -- 45
;(hit? 10 10 10 6 10)	; -> #f target distance 10+Burst - distance 16
;(distance 10 10 10)    ; -> 16
	    	  	  
;; Problem 6  	    	  	  
  	    	  	  
;;;Reading input from user.  	    	  	  
(define (read-prompt msg)  	    	  	  
  (display msg)  	    	  	  
  (read))  	    	  	  
  	    	  	  
; game  	    	  	  
;  	    	  	  
; With your procedures above, we have enough to play the game!
;  	    	  	  
; Note that this procedure uses some gory Scheme internally
; that you are not yet expected to understand. Treat this as
; a black box and don't worry about the internal details.
;  	    	  	  
  	    	  	  
(define play  	    	  	  
  (lambda (separation burst-radius height1 height2)
    (display "G1 (")  (display height1) (display "m high)")
    (display " --- ") (display separation)
    (display "m  --- G2 (")  (display height2) (display "m high)" )
    (newline)  	    	  	  
    (let* ((angle1 (read-prompt "Player 1 Angle: "))
	   (velocity1 (read-prompt "Player 1 Velocity: "))
	   (angle2    (read-prompt "Player 2 Angle: "))
	   (velocity2 (read-prompt "Player 2 Velocity: ")))
      (cond ((hit? angle1 velocity1 height1 burst-radius separation)
	     (display "Player 2 destroyed!")
	     (newline))  	    	  	  
	    ((hit? angle2 velocity2 height2 burst-radius separation)
	     (display "Player 1 destroyed!")
	     (newline))  	    	  	  
	    (else  	    	  	  
	     (newline)  	    	  	  
	     ; Feedback to player 1
	     (display "Player 1's banana went ")
	     (display (distance angle1 velocity1 height1))
	     (display "m") (newline)
	     ; Feedback to player 2
	     (display "Player 2's banana went ")
	     (display (distance angle2 velocity2 height2))
	     (display "m") (newline)
	     ; Loop  	    	  	  
	     (play separation burst-radius height1 height2))))))
  	    	  	  
; Try it out by evaluating the following:
; (play 10 1 3 2)  	    	  	  
  	    	  	  
; Insert a transcript of your play here, by cutting and pasting from
; the DrRacket console.  	    	  	  
; YOUR TRANSCRIPT HERE

;G1 (3m high) --- 10m  --- G2 (2m high)
;Player 1 Angle: 15
;Player 1 Velocity: 5
;Player 2 Angle: 10
;Player 2 Velocity: 10

;Player 1's banana went 4.4701875191611355m
;Player 2's banana went 8.274211345223776m
;G1 (3m high) --- 10m  --- G2 (2m high)
;Player 1 Angle: 10
;Player 1 Velocity: 20
;Player 2 Angle: 16
;Player 2 Velocity: 5

;Player 1's banana went 23.89844915893977m
;Player 2's banana went 3.820067741397428m
;G1 (3m high) --- 10m  --- G2 (2m high)
;Player 1 Angle: 10
;10
;Player 1 Velocity: 10
;Player 2 Angle: Player 2 Velocity: 10
;Player 2 destroyed!
  	    	  	  
  	    	  	  
;; Problem 7  	    	  	  
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
(define short?  	    	  	  
  (lambda (angle velocity elevation target-distance)
(if (< (distance angle velocity elevation) target-distance) 	    	  	  
    #t #f)))  	    	  	  
  	    	  	  
(define long?  	    	  	  
  (lambda (angle velocity elevation target-distance)
(if (> (distance angle velocity elevation) target-distance) 	    	  	  
    #t #f)))


(define *min-velocity* 0 )  	    	  	  
(define *max-velocity* 50)  	    	  	  
  	    	  	  
(define find-velocity  	    	  	  
  (lambda (angle elevation burst-radius target-distance)
    (find-velocity-helper angle *min-velocity* *max-velocity*
			  elevation burst-radius target-distance)))
  	    	  	  
(define find-velocity-helper  	    	  	  
  (lambda (angle min-vel max-vel elevation burst-radius target-distance)
    ;; idea is to try two extremes, if out of range return #f
    ;; else use binary search  	    	  	  
    (cond

      ((short? angle max-vel elevation target-distance) #f)
          
      ((long?  angle min-vel elevation target-distance) #f)
          
      ((hit? angle (* .5 (+ min-vel max-vel)) elevation  burst-radius target-distance)  (* .5 (+ min-vel max-vel)))	 
          
      (else  ( if (long? angle  (/ (+ max-vel min-vel) 2)  elevation target-distance   )
               (find-velocity-helper angle
                                      min-vel
                                 (/ (+ max-vel min-vel) 2)
                                      elevation
                                      burst-radius
                                      target-distance)

                (find-velocity-helper angle
                                 (/ (+ max-vel min-vel) 2)
                                      max-vel
                                      elevation
                                      burst-radius
                                      target-distance)))  	    	  	  
    )))

; This code works recursively, its base case is hit? if returns #t, code was break and gives a result "(/ (+ max-vel min-vel) 2)"
; Moreover, short? and long? methods tries two extrem conditions, which are shows that, any value between 0-50, not gives a correct hit for given angle. 
; short? --------|hit -------|target-distance > it shows that conditon "|" shows that points. if this condition happend in the entered values it retursn #t otherwise, it returns #f
; long?  --------|target-distance--------|hit > it shows that conditon "|" shows that points. if this condition happend in the entered values it retursn #t otherwise, it returns #f
; In find-velocity-helper, it works recursively part of the code, it does a binary search, and estimate mid-value and check right or left of the mid-values ranges. 

; What is the order of growth of your procedure in time?
; Order of the growth of my procedure is ..... 

;; YOUR TEST CASES HERE  	    	  	  
; (long? 10 10 10 10 )                  ; ->  Distance 15.9  Target-Distance 10 #t    	  	  
; (short? 10 10 10 17)			; ->  Distance 15.9  Target-Distance 17 #t 	    	  	  

;(find-velocity 10 10 30 20    )        ; -> 25.0
;(distance      10 25 30       )        ; -> 72.79
;(hit?          10 25 10 30 20 )        ; -> #t
;(find-velocity 20 30 40 60    )        ; -> 25.0
;(find-velocity 18 10 1  20    )        ; -> 11.0 

;(distance 18 50 10 ) ; This test case was used in Problem 8, and proof my result is correct. 176.14 m
;(distance 18 11 10 ) ; This test case was used in Problem 8, and proof my result is correct. 19.0 mit is in range !!!
;(distance 18 0  10 ) ; This test case was used in Problem 8, and proof my result is correct  0 m
;(trace find-velocity)
;(trace find-velocity-helper) ; Trace was used to track problems which was faced during to coding...
;(trace hit?) ; helper traces for find-velocity-helper
;(trace long?) ; helper traces for find-velocity-helper
;(trace short?) ; helper traces for find-velocity-helper
;(trace distance) ; helper traces for find-velocity-helper

;(short? 18 50 10 20) ; This test case was used in Problem 8, and proof my result is correct. #f 
;(long?  18 0 10 20)  ; This test case was used in Problem 8, and proof my result is correct. #f
;(short? 18 11 10 20) ; This test case was used in Problem 8, and proof my result is correct. #f
;(long?  18 11 10 20) ; This test case was used in Problem 8, and proof my result is correct. #t

;(find-velocity 18 10 1  20 ) ; This test case was used in Problem 8, and proof my result is coorect.  11.0 m/s

;; Problem 8  	    	  	  
  	    	  	  
; Some scheme stuff to communicate with gorilla. Don't
; worry about the details, just the interface
;  	    	  	  
(define tell-gorilla  	    	  	  
  (lambda (angle velocity)  	    	  	  
    (if (or (not angle) (not velocity))
	 (display (list "Sorry, no angle and velocity works"))
	 (display (list "Throw at" angle "degrees and" velocity "meters/sec")))
    (list angle velocity)))  	    	  	  
  	    	  	  
; Tests  	    	  	  
;(tell-gorilla 30 15)  	    	  	  
;(tell-gorilla #f 15)  	    	  	  
;(tell-gorilla 30 #f)  	    	  	  
  	    	  	  	    	  	  
; A bogus find-throw procedure that
; simply refuses to find a correct solution, but
; instead just tells the gorilla anything (not a
; smart thing for a pet programmer to do!)
;  	    	  	  
; Hint: Do something that is more clever then the below procedure:)!!
;  	    	  	  
;(define find-throw  	    	  	  
;  (lambda (elevation burst-radius target-distance)
;    (tell-gorilla 45 10)))  	    	  	  
  	    	  	  
;(find-throw 10 default-radius default-target)
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
(define find-throw  	    	  	  
  (lambda (elevation burst-radius target-distance)
    (find-throw-helper 0 elevation burst-radius target-distance)))
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
(define find-throw-helper  	    	  	  
  (lambda (angle elevation burst-radius target-distance)

    (cond

      ((= target-distance 0) (tell-gorilla #f #f))

      ((= angle 90) (tell-gorilla #f #f )) ; it breaks loop ;Base Case

      ((equal? #f (find-velocity angle elevation burst-radius target-distance)) (find-throw-helper (+ angle 1) elevation burst-radius target-distance)) ; recursive trigger
      ((hit? angle (find-velocity angle elevation burst-radius target-distance) elevation burst-radius target-distance) ; it breaks loop ;Base Case 
        
       (tell-gorilla angle (find-velocity angle elevation burst-radius target-distance) )  )  

       
      
     (else  (tell-gorilla #f #f )  ) ; it breaks loop ;Base Case
        
        )
    ))

; This code do a linear search between 0 - 90, it takes justi elevation burst-radisu target distance, and gives a fit angle and velocity to hit target. In this code
; find-velocity was used for finding velocity, each angle between 0-90, code do a binary search between 0 - 50 m/s.
; code can give diffrent results according to initial angle, both diffrent angle results gives a true results, it is shown in the test case section of this problem.

; if find-velocity returns false 
  	    	  	  
; Test cases
;  	    	  	  
;Find throw angle and velocity
;(trace find-throw)
;(trace find-throw-helper)
;(trace find-velocity)
;(trace find-velocity-helper)
;(find-throw  10 1 20) ; -> (18 11) - other values may work ; !!!! It gives this result when initial angle is equal to 18
;Otherwise result is  (0 13.5)
;(distance  18 11  10) ;-> 19.00 with initial angle (+1 19 -1), so it hits. 
;(distance  0 13.5 10) ;-> 19.28 with initial angle (+1 19 -1), so it hits also. 

; Verify that the suggested angle and velocity goes the distance:
;
;  	    	  	  
; Hint: Does find-throw give the correct results when you check it
; with the distance procedure?  	    	  	  
;  	    	  	  
; YOUR TEST CASES HERE...  	    	  	  
(find-throw 10 1   0)  ; ->  	    	  	  
(find-throw 20 0  50)	; ->  	    	  	  
(find-throw 0  0  50)  ; ->
(find-throw 50 1  50)  ; ->
(find-throw 50 0   0)  ; ->
(find-throw 0 50   0)  ; ->
(find-throw 0  0   0)	; ->  	    	  	  
  	    	  	  
;; Problem 9  	    	  	  
  	    	  	  
; How many bananas in a bundle survive a bounce
;  	    	  	  
(define num-survive  	    	  	  
  (lambda (num)  	    	  	  
    (if (even? num)  	    	  	  
	(/ num 2)  	    	  	  
	(/ (- num 1) 2))))  	    	  	  
  	    	  	  
; Tests  	    	  	  
;(num-survive 5)	; -> 2  	    	  	  
;(num-survive 2)	; -> 1  	    	  	  
;(num-survive 1)	; -> 0  	    	  	  
;  	    	  	  
;YOUR TEST CASES HERE...
;(num-survive 20); -> 10 	    	  	  
;(num-survive 50); -> 25	    	  	  
;(num-survive 61); -> 30 // checks odd numbers  	    	  	  
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
(define bundle-bounces  	    	  	  
  (lambda (num)  (if (= num 1) ; base case when it is return true, loop is brook.
                     (- num 1)
                     ( + (bundle-bounces (num-survive num) ) 1))))
    
   
  	   	  	  
; Test cases  	    	  	  
;(bundle-bounces 5)	; -> 2
;(bundle-bounces 20)	; -> 4
;  	    	  	  
; YOUR TEST CASES HERE...  	    	  	  
;(bundle-bounces 30)	; -> 4 	    	  	  
;(bundle-bounces 51)	; -> 5 	    	  	  
;(bundle-bounces 50)	; -> 5

; This code works with recursively, it includes num-survive, and its base case is when num equls to 1, it returns -1 of the number, since last hit which is explosiun
; can't count according to manual of the homework . This code takes number, and returns number.
  	    	  	  
  	    	  	  
;; Problem 10  	    	  	  
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
(define bundle-distance  	    	  	  
  (lambda (num angle velocity elevation)
  (cond ((= num 1) (distance angle velocity elevation)) ; base case
        ((< num 1)                          0) ; base case 
   (else  (+ (bundle-distance (num-survive num)  angle (* 2 velocity) 0)  (distance angle velocity elevation))))
    ))

; This code recursively take number of the bundle, angle initial velocity and elevation, and it returns sum of all each bundle-distances.
; Base cases were indicated on the code. 


;Comment on the similarity and differences between your implementation of this bundle­-distance procedure
;and the bundle-­bounces procedure. : Similarity of both prodecures is both of them count recursively. And both of them have almost same base case. (= num 1)
;but in additionally, bundle distance have extra one more base case. (< num 1) 

  	    	  	  
; Hint: be careful about the test cases
; Test cases  	    	  	  
;(distance 0 10 50)		; -> approx 31.9
;(bundle-distance 1 0 10 50)	; -> approx 31.9 ****(one base case)****
;(bundle-distance 0 0 10 50)	; -> 0           ****(another base case)****
;(bundle-distance 5 0 10 50)	; -> approx 31.9
;(bundle-distance 5 90 10 50)	; -> 0
;  	    	  	  
;(bundle-distance  2 45 10 50)  ; -> 69	    	  	  
;(bundle-distance 20 45 10 50)	; farther -> 3497
;  	    	  	  
; YOUR TEST CASES HERE...  	    	  	  
;(distance 20 30 56 )           ; ->  129.28	    	  	  
;(bundle-distance 1 20 30 56)	; ->  129.28	    	  	  
;(bundle-distance 2 20 30 56)	; ->  365.41	    	  	  
  	    	  	  
  	    	  	  
;; Problem 11  	    	  	  
  	    	  	  
; YOUR DOCUMENTATION HERE...  	    	  	  
;  	    	  	  
; Hint: Think about how you code the previus find-throw for the case
; without bundle and find out what extra procedures you will need :)
;  	    	  	  

;Test Cases

;(trace hit-bundle?)
;(trace find-throw-bundle)
;(trace find-throw-bundle-helper)
;(trace find-velocity)
;

(define find-bundle-throw  	    	  	  
  (lambda (num elevation burst-radius target-distance)

    -1
    ))  	   	  	  
  	    	  	  
; Test cases  	    	  	  
(define default-radius 1)  	    	  	  
(define default-target 10)  	    	  	  
; Some previous single-banana throws...
;(find-throw          10 default-radius default-target)
;(find-bundle-throw 1 10 default-radius default-target)
;  	    	  	  
; Test - when single banana fails, can a bundle succeed?
(find-throw           50 default-radius 400)	; -> (#f #f)
(find-bundle-throw 10 50 default-radius 400)    ; -> (73 9)
;  	    	  	  
; YOUR TEST CASES HERE...  	    	  	  
;			; ->  	    	  	  
;			; ->  	    	  	  
;			; ->  	    	  	  
  	    	  	  
  	    	  	  
; Congratulations! You have reached the end of Project 1!
; We encourage you to work with your project partner on problem sets
; as long as you acknowledge it and so long as you observe the rules
; on collaboration (see the Comp101 Syllabus section on
; Collaboration).  	    	  	  
  	    	  	  
; If you cooperated with other students, tutors, or others, please
; indicate your consultants' names.  Otherwise, write "I worked alone
; using only the course reference materials."
