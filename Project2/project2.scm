;;; aturgut@ku.edu.tr    Mon Oct 26 13:35:17 2015
;;;  	    	  	  
;;; Comp200 Project 2  	    	  	  
;;;  	    	  	  
;;; Due Nov 1, 2015  	    	  	  
;;;  	    	  	  
;;; Before you start:  	    	  	  
;;;  	    	  	  
;;; * Please read the detailed instructions for this project from the
;;; file project2.pdf available in the Assignments section of the
;;; course website.  	    	  	  
;;;  	    	  	  
;;; * Please read "Project Submission Instructions" carefully and make
;;; sure you understand everything before you start working on your
;;; project in order to avoid problems.
;;;  	    	  	  
;;; While you are working:  	    	  	  
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code.
;;; * Remember our collaboration policy: you can discuss with your friends but
;;;  	    	  	  
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;;  	    	  	  
;;; When you are done:  	    	  	  
;;; * Perform a final save and check-in.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200help@ku.edu.tr if you have any questions.
;;; * Make sure your file loads and runs without errors.
;;;  	    	  	  
;;;   *** IF (load "project2.scm") GIVES ERRORS OR WE CANNOT RUN YOUR PROJECT, IT WILL NOT BE GRADED ***
;;;  	    	  	  
  	    	  	  
;;; DO NOT CHANGE FOLLOWING LINES, THEY ARE NECESSARY FOR THE WHOLE PROJECT.
;;; WHILE SOLVING PROBLEMS YOU CAN USE THE PROCEDURES DEFINED HERE, IT WILL EASE YOUR WORK.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#lang racket  	    	  	  
(require math/bigfloat)  	    	  	  
; Ignore the following. This is necessary so the file loads without errors initially:
(define your-answer-here #f)  	    	  	  
  	    	  	  
; make-play will make a list then given two strings
; e.g. (make-play "c" "c") => ("c" "c")
(define make-play list)  	    	  	  
  	    	  	  
; The empty history when noone  	    	  	  
; has started to played yet  	    	  	  
(define the-empty-history '())  	    	  	  
  	    	  	  
; extend-history adds the new element
; to the history when someone plays
(define extend-history cons)  	    	  	  
  	    	  	  
; empty-history? is a procedure that
; returns boolean true if the history is empty
(define empty-history? null?)  	    	  	  
  	    	  	  
; History of players is kept in a list.
; The last action is found by most-recent-play procedure.
(define most-recent-play car)  	    	  	  
  	    	  	  
; All the actions except the most recent
; one are found with rest-of-plays procedure.
(define rest-of-plays cdr)  	    	  	  
  	    	  	  
; The play-loop procedure takes as its  arguments two prisoner's
; dilemma strategies, and plays an iterated game of approximately
; one hundred rounds.  A strategy is a procedure that takes
; two arguments: a history of the player's previous plays and
; a history of the other player's previous plays.  The procedure
; returns either a "c" for cooperate or a "d" for defect.
(define (play-loop strat0 strat1)
  (define (play-loop-iter strat0 strat1 count history0 history1 limit)
    (cond ((= count limit) (print-out-results history0 history1 limit))
	    (else (let ((result0 (strat0 history0 history1))
			      (result1 (strat1 history1 history0)))
		      (play-loop-iter strat0 strat1 (+ count 1)
				        (extend-history result0 history0)
					  (extend-history result1 history1)
					    limit)))))
  (play-loop-iter strat0 strat1 0 the-empty-history the-empty-history
		    (+ 90 (random 21))))
  	    	  	  
; The following procedures are used to compute and print
; out the players' scores at the end of an iterated game
(define (print-out-results history0 history1 number-of-games)
  (let ((scores (get-scores history0 history1)))
    (newline)  	    	  	  
    (display "Player 1 Score:  ")
    (display (* 1.0 (/ (car scores) number-of-games)))
    (newline)  	    	  	  
    (display "Player 2 Score:  ")
    (display (* 1.0 (/ (cadr scores) number-of-games)))
    (newline)))  	    	  	  
  	    	  	  
(define (get-scores history0 history1)
  (define (get-scores-helper history0 history1 score0 score1)
    (cond ((empty-history? history0)
	      (list score0 score1))
	    (else (let ((game (make-play (most-recent-play history0)
					        (most-recent-play history1))))
		      (get-scores-helper (rest-of-plays history0)
					      (rest-of-plays history1)
					           (+ (get-player-points 0 game) score0)
						        (+ (get-player-points 1 game) score1))))))
  (get-scores-helper history0 history1 0 0))
  	    	  	  
  (define (get-player-points num game)
  (list-ref (get-point-list game) num))
  	    	  	  
(define *game-association-list*
  ;; format is that first sublist identifies the players' choices
  ;; with "c" for cooperate and "d" for defect; and that second sublist
  ;; specifies payout for each player
  '((("c" "c") (3 3))  	    	  	  
    (("c" "d") (0 5))  	    	  	  
    (("d" "c") (5 0))  	    	  	  
    (("d" "d") (1 1))))  	    	  	  
  	    	  	  
; Note that you will need to write extract-entry in Problem 1
(define (get-point-list game)  	    	  	  
  (cadr (extract-entry game *game-association-list*)))
  	    	  	  
; A sampler of strategies  	    	  	  
  	    	  	  
(define (NASTY my-history other-history)
  "d")  	    	  	  
  	    	  	  
(define (PATSY my-history other-history)
  "c")  	    	  	  
  	    	  	  
(define (SPASTIC my-history other-history)
  (if (= (random 2) 0)  	    	  	  
      "c"  	    	  	  
      "d"))  	    	  	  
  	    	  	  
(define (EGALITARIAN  my-history other-history)
  (define (count-instances-of test hist)
    (cond ((empty-history? hist) 0)
	  ((string=? (most-recent-play hist) test)
	   (+ (count-instances-of test (rest-of-plays hist)) 1))
	  (else (count-instances-of test (rest-of-plays hist)))))
  (let ((ds (count-instances-of "d" other-history))
	(cs (count-instances-of "c" other-history)))
    (if (> ds cs) "d" "c")))  	    	  	  
  	    	  	  
(define (EYE-FOR-EYE my-history other-history)
  (if (empty-history? my-history)
      "c"  	    	  	  
      (most-recent-play other-history)))
;;; DO NOT CHANGE THE ABOVE LINES, THEY ARE NECESSARY FOR THE WHOLE PROJECT.
;;; WHILE SOLVING PROBLEMS YOU CAN USE THE PROCEDURES DEFINED HERE, IT WILL EASE YOUR WORK.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;;:;::;::;
;;; Problem 1  	    	  	  
  	    	  	  
; Description for extract-entry: (before the definition of each procedure,
; please write a description about what the procedure does and what
; its input and output should be, making sure the lines are commented
; out with semi-colons)  	    	  	  
  	    	  	  
; HINT: You can make use of list-ref
; (list-ref *game-association-list* 0) ==> (("c" "c") (3 3))
; (list-ref *game-association-list* 1) ==> (("c" "d") (0 5))


;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!;
;                                                                                                                                                                           ;
;      All comperisons between stratiges already done for us. So that I only added some info for my code! Such as input-output and code description almost line-by-line.    ; 
;                                                                  For All Problems !!                                                                                      ;
;                                                                                                                                                                           ;
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!;


(define (extract-entry play *game-association-list*)

  (cond ((equal? play (cons "c" (cons "c" '()))) (list-ref *game-association-list* 0)) ;It makes "c" "c" pair and gives the corespound of the pairn in the game-acc-list.  
        ((equal? play (cons "c" (cons "d" '()))) (list-ref *game-association-list* 1)) ;It makes "c" "d" pair and gives the corespound of the pairn in the game-acc-list.  
        ((equal? play (cons "d" (cons "c" '()))) (list-ref *game-association-list* 2)) ;It makes "d" "c" pair and gives the corespound of the pairn in the game-acc-list.  
        ((equal? play (cons "d" (cons "d" '()))) (list-ref *game-association-list* 3)) ;It makes "d" "d" pair and gives the corespound of the pairn in the game-acc-list.  
        (else '()) ;if correspound not exist it gives empty list. 
        ))

;Terminal Results;

;--------Problem 1--------
;'(("c" "c") (3 3))
;'(("c" "d") (0 5))
;'(("d" "c") (5 0))
;'(("d" "d") (1 1))
;'()

;This code takes pairs and returns correspound of the game-association-list. 
	    	  	  
; Test cases for extract-entry: (When you write your procedure you can
; test it with the below test cases. Initially it returns #f since
; your-answer-here is defined as #f. But when you complete the procedure
; It should return the correct answers below.)
(display "--------Problem 1--------")
(newline)  	    	  	  
(define a-play (make-play "c" "c"))
(extract-entry a-play *game-association-list*) ; ANSWER => '(("c" "c") (3 3))
  	    	  	  
(define a2-play (make-play "c" "d"))
(extract-entry a2-play *game-association-list*) ; ANSWER => '(("c" "d") (0 5))
  	    	  	  
(define a3-play (make-play "d" "c"))
(extract-entry a3-play *game-association-list*) ; ANSWER => '(("d" "c") (5 0))
  	    	  	  
(define a4-play (make-play "d" "d"))
(extract-entry a4-play *game-association-list*) ; ANSWER => '(("d" "d") (1 1))
  	    	  	  
(define a5-play (make-play "x" "x"))
(extract-entry a5-play *game-association-list*) ; ANSWER => '()
(display "-----End of Problem 1-----")
(newline)  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;;:;::;:::
;;; Problem 2  	    	  	  
  	    	  	  
; Use play-loop to play games among the five defined strategies
; Create a matrix in which you show the average score for
; tournaments pitting all possible pairings of the five
; different strategies: Nasty, Patsy, Eye-for-Eye, Spastic, Egalitarian.
; Describe the behavior you observe for the different strategies.
  	    	  	  
; To test the strategies against each other => e.g. (play-loop NASTY PATSY)
; Fill in the ? part in below matrices when you get the result from play-loop procedure.

(display "--------NATSY vs X--------")

(play-loop NASTY NASTY)
(play-loop NASTY PATSY)
(play-loop NASTY SPASTIC)
(play-loop NASTY EGALITARIAN)
(play-loop NASTY EYE-FOR-EYE)

(display "--------PATSY vs x--------")

(play-loop PATSY NASTY)
(play-loop PATSY PATSY)
(play-loop PATSY SPASTIC)
(play-loop PATSY EGALITARIAN)
(play-loop PATSY EYE-FOR-EYE)

(display "--------SPASTIC vs X--------")

(play-loop SPASTIC NASTY)
(play-loop SPASTIC PATSY)
(play-loop SPASTIC SPASTIC)
(play-loop SPASTIC EGALITARIAN)
(play-loop SPASTIC EYE-FOR-EYE)

(display "--------EGALITARIAN vs X--------")

(play-loop EGALITARIAN NASTY)
(play-loop EGALITARIAN PATSY)
(play-loop EGALITARIAN SPASTIC)
(play-loop EGALITARIAN EGALITARIAN)
(play-loop EGALITARIAN EYE-FOR-EYE)

(display "--------EYE-FOR-EYE vs X--------")

(play-loop EYE-FOR-EYE NASTY)
(play-loop EYE-FOR-EYE PATSY)
(play-loop EYE-FOR-EYE SPASTIC)
(play-loop EYE-FOR-EYE EGALITARIAN)
(play-loop EYE-FOR-EYE EYE-FOR-EYE)

  	    	  	  
; Strategy2 =>      NASTY       ||       PATSY       ||      SPASTIC      ||     EGALITARIAN   ||    EYE-FOR-EYE    ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Strategy1 | Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 ||
;           | points  | points  || points  | points  || points  | points  || points  | points  || points  | points  ||
;  NASTY    |   1.0   |   1.0   ||   5.0   |   0     ||   3.13  |   0.47  ||   1.03  |   0.99  ||   1.03  |   0.99  ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;NASTY: When it against it self both players get low points ! 
;PATSY; It is highly benefical for Player2 
;SPASTIC; It is benefical for Player2
;EGALITARIAN; Almost tie. 
;EYE-FOR-EYE; Almost tie.

; Strategy2 =>      NASTY       ||       PATSY       ||      SPASTIC      ||     EGALITARIAN   ||    EYE-FOR-EYE    ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Strategy1 | Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 ||
;           | points  | points  || points  | points  || points  | points  || points  | points  || points  | points  ||
;  PATSY    |   0     |   0.5   ||   3.0   |   3.0   ||  ~1.6   |  ~3.9   ||   3.0   |   3.0   ||   3.0   |   3.0   ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;NASTY: It is slightly benefical for Player2 
;PATSY: It is benefical for both players. 
;SPASTIC: It is benefical for player2 
;EGALITARIAN: It is benefical for both players 
;EYE-FOR-EYE: It is benefical for both players

; Strategy2 =>      NASTY       ||       PATSY       ||      SPASTIC      ||     EGALITARIAN   ||    EYE-FOR-EYE    ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Strategy1 | Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 ||
;           | points  | points  || points  | points  || points  | points  || points  | points  || points  | points  ||
; SPASTIC   |  ~0.4   |  ~3.3   ||  ~3.9   |  ~1.6   ||  ~2.4   |  ~2.1   ||  ~3.9   |  ~1.6   ||  ~2.3   |  ~2.2   ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;NASTY: It is benefical for player2
;PATSY: It is benfical for player1
;SPASTIC: It is almost tie ! 
;EGALITARIAN: It is benefical for player 1
;EYE-FOR-EYE: It is almost tie !

; Strategy2 =>      NASTY       ||       PATSY       ||      SPASTIC      ||     EGALITARIAN   ||    EYE-FOR-EYE    ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Strategy1 | Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 ||
;           | points  | points  || points  | points  || points  | points  || points  | points  || points  | points  ||
;EGALITARIAN|  ~0.9   |  ~1.0   ||   3.0   |   3.0   ||  ~2.4   |  ~1.1   ||   3.0   |   3.0   ||   3.0   |   3.0   ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;NASTY: It is almost tie!
;PATSY: It is benefical for both player1 and plyer2
;SPASTIC: It is benefical for player1 
;EGALITARIAN: It is benefical for both players. 
;EYE-FOR-EYE: It is benefical for both players. 

; Strategy2 =>      NASTY       ||       PATSY       ||      SPASTIC      ||     EGALITARIAN   ||    EYE-FOR-EYE    ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Strategy1 | Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 || Player1 | Player2 ||
;           | points  | points  || points  | points  || points  | points  || points  | points  || points  | points  ||
;EYE-FOR-EYE|  ~0.9   |  ~1.0   ||  3.0    |   3.0   ||  ~2.2   |  ~2.3   ||   3.0   |   3.0   ||   3.0   |   3.0   ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;NASTY: It is almost tie.
;PATSY: It is benefical for both players.
;SPASTIC: It is almost tie. 
;EGALITARIAN: It is benefical for both players. 
;EYE-FOR-EYE: It is benefical for both players.

;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;;:;:::;;;
;;; Problem 3  	    	  	  
  	    	  	  
; Games involving Egalitarian tend to be slower than other games.
; Why is that so? Use order-of-growth notation to explain your answer.
; Alyssa P. Hacker, upon seeing the code for Egalitarian,
; suggested the following iterative version of the procedure:
;(define (Egalitarian my-history other-history)
;  (define (majority-loop cs ds hist)
;    (cond ((empty-history? hist) (if (> ds cs) “d” “c”))
;          ((string=? (most-recent-play hist) “c”)
;           (majority-loop (+ 1 cs) ds (rest-of-plays hist)))
;          (else  	    	  	  
;           (majority-loop cs (+ 1 ds) (rest-of-plays hist)))))
;  (majority-loop 0 0 other-history))
; Compare this procedure with the original version.
; Do the orders of growth (in time) for the two procedures differ?
; Is the newer version faster?  	    	  	  
; ANSWER: Order of growth in this new version ofcode is theta(n) actually it is length-hist 
;         Order of growth in this old version ofcode is theta(n) actually it is length-hist * 2 	    	  	  
;         we can ignore if theta have constant which is multiplied with our n number.  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;;:;:::;;:
;;; Problem 4  	    	  	  
  	    	  	  
; Write a new strategy eye-for-two-eyes
; If version of code avaible ! below...

;(define (EYE-FOR-TWO-EYES2 my-history other-history)
;  (if (empty-history? other-history); check other history is emty or not if emty it returns cooparet 
;      "c" (if
;           (equal? (most-recent-play other-history) "c") "c" ;check c exist or not if it is present cooparet 
;           (if
;             (= (length (rest-of-plays other-history)) 0) "c" ;check other history length if it is 0 return "c"
;                  (if
;                      (equal? (most-recent-play (rest-of-plays other-history)) "c") "c" ;most recent play and and rest of plays are equal returns cooparet 
;                                                                         
;                  "d")))) ;else condition "d"  
;  )

(define (EYE-FOR-TWO-EYES my-history other-history)

  (cond
    ((empty-history? other-history) "c") ; check other history is emty or not if emty it returns cooparet
    ((equal? (most-recent-play other-history) "c") "c" ) ;check c exist or not if it is present cooparet 
     ((= (length (rest-of-plays other-history)) 0) "c") ;check other history length if it is 0 return "c"
     ((equal? (most-recent-play (rest-of-plays other-history)) "c") "c") ;most recent play and and rest of plays are equal returns cooparet 
     (else "d"))) ;else condition returns "d"  
  

;This code takes every cooparet options were checked and if it is not fit with conditons it returns "d" defects
;This code takes 2 variables and returns "c" or "d" 
  	    	  	  
; Test cases for EYE-FOR-TWO-EYES: (When you write your procedure you can
; test it with the below test cases. Initially it returns #f since
; your-answer-here is defined as #f. But when you complete the procedure
; It should return the correct answers below.)
(display "--------Problem 4--------")
(newline)  	    	  	  
  	    	  	  
; Strategy depends only to the other-history, so dont case my-history
(EYE-FOR-TWO-EYES the-empty-history the-empty-history) ; ANSWER => "c"
(EYE-FOR-TWO-EYES the-empty-history (list "c")) ; ANSWER => c"
(EYE-FOR-TWO-EYES the-empty-history (list "d")) ; ANSWER => "c"
(EYE-FOR-TWO-EYES the-empty-history (list "c" "c")) ; ANSWER => "c"
(EYE-FOR-TWO-EYES the-empty-history (list "c" "d")) ; ANSWER => "c"
(EYE-FOR-TWO-EYES the-empty-history (list "d" "c")) ; ANSWER => "c"
(EYE-FOR-TWO-EYES the-empty-history (list "d" "d")) ; ANSWER => "d"
(EYE-FOR-TWO-EYES the-empty-history (list "c" "d" "c")) ; ANSWER => "c"
(EYE-FOR-TWO-EYES the-empty-history (list "d" "d" "c")) ; ANSWER => "d"
(EYE-FOR-TWO-EYES the-empty-history (list "d" "c" "d" "d")) ; ANSWER => "c"
  	    	  	  
(display "-----End of Problem 4-----")
(newline)  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;:;;::;;;;
;;; Problem 5  	    	  	  
  	    	  	  
; Write a procedure make-eye-for-n-eyes.
  	    	  	  
(define (make-eye-for-n-eyes n)
  ; You need to return a two-argument (my-history other-history) procedure.
   (lambda (my-history other-history)
    (cond ((empty-history? other-history) "c") ;if history is emty return "c"
          ((and (= n 1) (equal? ( most-recent-play other-history) "d")) "d") ; check n number and last played 

          ((and (= n 1) (equal? ( most-recent-play other-history) "c")) "c") ; check n number and last played 

          ((= n 2) (EYE-FOR-TWO-EYES my-history other-history)) ; if n=2 play random with %50
          (else

           (cond ((equal? (most-recent-play other-history ) "c") "c") ;checks other conditions 

                 ((equal? (most-recent-play other-history) "d") ;checks other conditions 

                  (if (= (length (rest-of-plays other-history))
                         0) "c" ;checks other conditions 
                      (if (equal? (most-recent-play (rest-of-plays other-history)) "c") "c" ;checks other conditions 

                          (if (= (length (rest-of-plays other-history)) 0) "c" ;checks other conditions 

                              (if (equal? (most-recent-play (rest-of-plays (rest-of-plays other-history))) "c") "c" "d")))))))) ;checks other conditions 
    )  	   	  	   
  )

;it takes my-history and other-history, plyer 1 and player2 histories  it returns "c" or "d" according to conditions...
;this code compare n values and most-recent play... 
  	    	  	  
; Test cases for make-eye-for-n-eyes: (When you write your procedure you can
; test it with the below test cases. Initially it returns #f since
; your-answer-here is defined as #f. But when you complete the procedure
; It should return the correct answers below.)
(display "--------Problem 5--------")
(newline)  	    	  	  
  	    	  	  
(define one-eye (make-eye-for-n-eyes 1)) ; equivalent to EYE-FOR-EYE
(define two-eye (make-eye-for-n-eyes 2)) ; equivalent to EYE-FOR-TWO-EYE
  	    	  	  
; Similar to one-eye and two-eye.
; Defects only if three recent plays in the history1 is "d"
; Cooperates if any of the three recent plays in hsitory1 is "c"
(define three-eye (make-eye-for-n-eyes 3))
  	    	  	  
; Strategy depends only to the other-history, so dont case my-history
(display "Testing (make-eye-for-n-eyes 1)")
(newline)  	    	  	  
(one-eye the-empty-history (list "d")) ; ANSWER => "d"
(one-eye the-empty-history (list "d" "c" "c")) ; ANSWER => "d"
  	    	  	  
(display "Testing (make-eye-for-n-eyes 2)")
(newline)  	    	  	  
(two-eye the-empty-history (list "d" "c")) ; ANSWER => "c"
(two-eye the-empty-history (list "d" "d" "c")) ; ANSWER => "d"
  	    	  	  
(display "Testing (make-eye-for-n-eyes 3)")
(newline)  	    	  	  
(three-eye the-empty-history (list "d" "d" "d")) ; ANSWER => "d"
(three-eye the-empty-history (list "d" "d" "c")) ; ANSWER => "c"
  	    	  	  
(display "-----End of Problem 5-----")
(newline)  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;:;;::;;;:
;;; Problem 6  	    	  	  
  	    	  	  
; Write a procedure make-rotating-strategy

(define (make-rotating-strategy strat0 strat1 freq0 freq1)
  (define *count* 0) ; Global Variable Defined 
  (lambda (hist1 hist2) ; This method return methods 
  (begin
    
  (define str strat0) ; str defined as a strat0;
  (cond ((< *count* freq0) (begin (set! *count* (+ *count* 1)) (set! str strat0))) ;checks frequecy0 is greater than count or not and set count 1 more! and set str to strat0
        ((< *count* (+ freq1 freq0)) (begin (set! *count* (+ *count* 1)) (set! str strat1))) ;checks total frequency is greter than count or not and set count 1 more! and set str to strat1
        (else (begin (set! *count* 1) (set! str strat0)))) ;else statement, returns0 abow conditions when returns #f and set strat 0 and returns str...
  (str hist1 hist2) ;it returns str with hist1 hist2 
  )))

;Global variable defined with *----* this implementation. It is premenently changed when it is mutated. 
;In this code begin was used "begin" is a racket library code and it allows to implement 2 fact orderly, and done first-var input and gives second-var as a return var.  
;This code takes 2 diffrent strategy and their frequencies, they already implemented abow. This code returns strategy according to abow conditions with hist1 and hist2...
  	    	  	  
; Test cases for make-rotating-strategy: (When you write your procedure you can
; test it with the below test cases. Initially it returns #f since
; your-answer-here is defined as #f. But when you complete the procedure
; It should return the correct answers below.)
(display "--------Problem 6--------")
(newline)   	    	  	  
  	    	  	  
(define rotating-1 (make-rotating-strategy NASTY PATSY 1 1))
; 1 times NASTY 1 times PATSY  	    	  	  
(define (testing rt)  	    	  	  
  (if (eq? rt #f) empty  	    	  	  
      (rt the-empty-history the-empty-history)
     )  	    	  	  
  )  	    	  	  
  	    	  	  
(display "Testing (make-rotating-strategy NASTY PATSY 1 1)")
(newline)  	    	  	  
(testing rotating-1) ; ANSWER => "d"
(testing rotating-1) ; ANSWER => "c"
(testing rotating-1) ; ANSWER => "d"
(testing rotating-1) ; ANSWER => "c"
  	    	  	  
(define rotating-2 (make-rotating-strategy NASTY PATSY 2 2))
; 2 times NASTY 2 times PATSY  	    	  	  
(display "Testing (make-rotating-strategy NASTY PATSY 2 2)")
(newline)  	    	  	  
(testing rotating-2) ; ANSWER => "d"
(testing rotating-2) ; ANSWER => "d"
(testing rotating-2) ; ANSWER => "c"
(testing rotating-2) ; ANSWER => "c"
(testing rotating-2) ; ANSWER => "d"
(testing rotating-2) ; ANSWER => "d"
(testing rotating-2) ; ANSWER => "c"
(testing rotating-2) ; ANSWER => "c"
  	    	  	  
(display "-----End of Problem 6-----")
(newline)  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;:;;::;;:;
;;; Problem 7  	    	  	  
; Write a new strategy, make-higher-order-spastic, which takes a list of strategies as input.
  	    	  	  
(define (make-higher-order-spastic strategies)

  (define *nu* 0) ;Global Var as a counter for the even or odd number! It explained below. 

  (lambda (my-history other-history)

    (if (even? *nu*) (begin (set! *nu* (+ *nu* 1)) ((car strategies) my-history other-history )) ;It checks is it even or not ! and returns first element of pair with "car"
        (begin (set! *nu* (+ *nu* 1)) ((car(cdr strategies)) my-history other-history ))))) ;This else statement returns second element of pair. 

;This code works with only two pair of lists I mean, two item capacity lists. It has a global variable and it increases when it called. It checks both sides of the pair.
;According to number. This code takes stratiges as a pair. and returns procedure applid on my-his and other-his.
;If number -nu- which is global, is even it returns first element of the pair, else it returns cdr or second element of the pair. It checks both conditions in pair. 
  	    	  	    	    	  	  
; Test cases for make-higher-order-spastic: (When you write your procedure you can
; test it with the below test cases. Initially it returns #f since
; your-answer-here is defined as #f. But when you complete the procedure
; It should return the correct answers below.)
(display "--------Problem 7--------")
(newline)  	    	  	  
  	    	  	  
(define NASTY-PATSY (make-higher-order-spastic (list NASTY PATSY)))
  	    	  	  
(display "Testing NASTY-PASTY")
(newline)  	    	  	  
(testing NASTY-PATSY) ; ANSWER =>  "d"
(testing NASTY-PATSY) ; ANSWER => "c"
(testing NASTY-PATSY) ; ANSWER => "d"
(testing NASTY-PATSY) ; ANSWER => "c"
  	    	  	  
(display "-----End of Problem 7-----")
(newline)  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;:;;::;;::
;;; Problem 8  	    	  	  
; Write a procedure gentle, which takes as input
; a strategy (say strat) and a number
; between 0 and 1 (call it gentleness-factor).
  	    	  	  
; HINT : You can use (bigfloat->flonum (bfrandom))
; to generate random numbers between 0 and 1
  	    	  	  
(define (gentle strat gentleness-factor)
  (lambda (my-history other-history)


    (cond ((= gentleness-factor 0) (strat my-history other-history)) ;if gentle factor 0 it returns strategy entered. 
          ((= gentleness-factor 1) (PATSY my-history other-history)) ;if gentle factor 1 it returns PATSY.
          ((= gentleness-factor 0.5) ((if (= (random 2) 0)  ;if gentle factor 0.5 it returns d or s according to cpu clock between 2 0 input. And returns NAST or PATSY with %50 %50 chanse.	    	  	  
     (NASTY my-history other-history)  	 ;;   	  	  
      (PATSY my-history other-history))  ;;

                                      ))
          (else (if (< (bigfloat->flonum (bfrandom)) gentleness-factor)  ;else statement involves numbers between 1-0 which determined by gentlemen factor and set randomness on NASTY PATSY chanse.	    	  	  
     (NASTY my-history other-history)  	    	  	  
      (PATSY my-history other-history)) ))
          
    )  	    	  	  
  )

;This code takes strategy and frequency, and apply conditions which is given below and returns according to manual. 
  	    	  	  
; Test cases for gentle: (When you write your procedure you can
; test it with the below test cases. Initially it returns #f since
; your-answer-here is defined as #f. But when you complete the procedure
; It should return the correct answers below.)
(display "--------Problem 8--------")
(newline)  	    	  	  
  	    	  	  
(display "Testing (gentle NASTY 0.0)")
(newline)  	    	  	  
(testing (gentle NASTY 0.0)) ; ANSWER =>  "d"
(testing (gentle NASTY 0.0)) ; ANSWER =>  "d"
  	    	  	  
(display "Testing (gentle NASTY 1.0)")
(newline)  	    	  	  
(testing (gentle NASTY 1.0)) ; ANSWER =>  "c"
(testing (gentle NASTY 1.0)) ; ANSWER => "c"
  	    	  	  
(define SLIGHTLY-GENTLE-NASTY (gentle NASTY 0.1))
(define SLIGHTLY-GENTLE-EYE-FOR-EYE (gentle EYE-FOR-EYE 0.1))
  	    	  	  
(display "-----End of Problem 8-----")
(newline)  	    	  	  
  	    	  	  
  	    	  	  
;;; DO NOT CHANGE FOLLOWING LINES, THEY ARE NECESSARY FOR 3 PLAYER GAME.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define *game-association-list3*
  (list (list (list "c" "c" "c") (list 4 4 4))
        (list (list "c" "c" "d") (list 2 2 5))
        (list (list "c" "d" "c") (list 2 5 2))
        (list (list "d" "c" "c") (list 5 2 2))
        (list (list "c" "d" "d") (list 0 3 3))
        (list (list "d" "c" "d") (list 3 0 3))
        (list (list "d" "d" "c") (list 3 3 0))
        (list (list "d" "d" "d") (list 1 1 1))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;:;;::;:;;
;;; Problem 9  	    	  	  
;Revise the Scheme code for the two-player game to make a three-player iterated game.
  	    	  	  
(define (play-loop3 strat0 strat1 strat2) ;strat2 was added 
  (define (play-loop3-iter count history0 history1 history2 limit) ;his2 was added 
    (cond ((= count limit) (print-out-results3 history0 history1 history2 limit))

          (else (let ((result0 (strat0 history0 history1 history2)) (result1 (strat1 history1 history2 history0)) (result2 (strat2 history2 history0 history1)))

                  (play-loop3-iter strat0 strat1 (+ count 1) (extend-history result0 history0) (extend-history result1 history1) (extend-history result2 history2) limit))))	   	  	   
    )  	   	  	   
  (play-loop3-iter 0 the-empty-history the-empty-history the-empty-history (+ 90 (random 21))))

;This code revied version of two-player which is implemented abow. Only Name of the method and 3th player variables and imputs were added. 
  	   	  	   
; Define "print-out-results" for handling three strategies:
(define (print-out-results3 history0 history1 history2 number-of-games) ;history2 was added 
   (let ((scores (get-scores3 history0 history1 history2))) ;history0 was added 
    (newline)  	   	  	   
    (display "Player 1 Score:  ")
    (display (* 1.0 (/ (car scores) number-of-games)))
    (newline)  	   	  	   
    (display "Player 2 Score:  ")
    (display (* 1.0 (/ (cadr scores) number-of-games)))

    (newline) ;this part and below was added 
    (display "Player 3 Score:  ")
    (display (* 1.0 (/ (caddr scores) number-of-games))))
  )  	   	  	   
;This code revied version of two-player which is implemented abow. Only Name of the method and 3th player variables and imputs were added. 	   	  	   
; Define "get-scores" for handling three strategies:
(define (get-scores3 history0 history1 history2)

  (define (get-scores3-helper history0 history1 score0 score1 score2)
    (cond ((empty-history? history0)

           (list score0 score1 score2))

          (else (let ((game (make-play (most-recent-play history0) (most-recent-play history1) (most-recent-play history2))))
		      (get-scores3-helper (rest-of-plays history0) (rest-of-plays history1) (rest-of-plays history2) (+ (get-player-points 0 game) score0)
                                          (+ (get-player-points 1 game) score1) (+ (get-player-points 2 game) score2))))))
  (get-scores3-helper history0 history1 history2 0 0 0))  	   	  	   
;This code revied version of two-player which is implemented abow. Only Name of the method and 3th player variables and imputs were added.  	   	  	   
; Define "extract-entry" for handling three strategies:
(define (extract-entry3 play *list*)
    (cond ((equal? play (list "c" "c" "c")) (list-ref *list* 0));checks if play is ("c" "c" "c")
        ((equal? play (list "c" "c" "d")) (list-ref *list* 1));checks if play is ("c" "c" "d")
        ((equal? play (list "c" "d" "c")) (list-ref *list* 2));checks if play is ("c" "d" "c")
        ((equal? play (list "d" "c" "c")) (list-ref *list* 3));checks if play is ("d" "c" "c")
        ((equal? play (list "c" "d" "d")) (list-ref *list* 4));checks if play is ("c" "d" "d")
        ((equal? play (list "d" "c" "d")) (list-ref *list* 5));checks if play is ("d" "c" "d")
        ((equal? play (list "d" "d" "c")) (list-ref *list* 6));checks if play is ("d" "d" "c")
        ((equal? play (list "d" "d" "d")) (list-ref *list* 7));checks if play is ("d" "d" "d")

        (else '()))  	   	  	   
  )

; It was changed according to manual !.

; Test cases for extract-entry3: (When you write your procedure you can
; test it with the below test cases. Initially it returns #f since
; your-answer-here is defined as #f. But when you complete the procedure
; It should return the correct answers below.)
(display "--------Problem 9--------")
(newline)  	    	  	  
(display "Testing extract-entry-3:")
(newline)  	    	  	  
(extract-entry3 (make-play "c" "c" "c") *game-association-list3*)
; ANSWER =>  (("c" "c" "c") (4 4 4))
(extract-entry3 (make-play "c" "c" "d") *game-association-list3*)
; ANSWER => (("c" "c" "d") (2 2 5))
(extract-entry3 (make-play "c" "d" "c") *game-association-list3*)
; ANSWER =>  (("c" "d" "c") (2 5 2))
(extract-entry3 (make-play "c" "d" "d") *game-association-list3*)
; ANSWER =>  (("c" "d" "d") (0 3 3))
(extract-entry3 (make-play "d" "c" "c") *game-association-list3*)
; ANSWER =>  (("d" "c" "c") (5 2 2))
(extract-entry3 (make-play "d" "c" "d") *game-association-list3*)
; ANSWER => (("d" "c" "d") (3 0 3))
(extract-entry3 (make-play "d" "d" "c") *game-association-list3*)
; ANSWER =>  (("d" "d" "c") (3 3 0))
(extract-entry3 (make-play "d" "d" "d") *game-association-list3*)
; ANSWER => (("d" "d" "d") (1 1 1))
(extract-entry3 (make-play "x" "x" "x") *game-association-list3*)
; ANSWER =>  ()  	    	  	  
  	    	  	  
(display "-----End of Problem 9-----")
(newline)  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;:;;::;:;:
;;; Problem 10  	    	  	  
; Write strategies Patsy-3, Nasty-3, and spastic-3 that will work in a three-player game.
; Hint: They are same as NASTY, PATSY, and SPASTIC.
  	    	  	  
(define (PATSY-3 my-history other-history-1 other-history-2)
  "c" 	    	  	  
  )  	    	  	  
;This code revied version of two-player which is implemented abow. Only Name of the method and 3th player variables and imputs were added.  	    	  	  
(define (NASTY-3 my-history other-history-1 other-history-2)
  "d" 	    	  	  
  )  	    	  	  
;This code revied version of two-player which is implemented abow. Only Name of the method and 3th player variables and imputs were added.  	    	  	  
(define (SPASTIC-3 my-history other-history-1 other-history-2)
  (if (= (random 2) 0)  	    	  	  
       "c"
       "d"      
      ) 	    	  	  
  )  	    	  	  
;This code revied version of two-player which is implemented abow. Only Name of the method and 3th player variables and imputs were added.  	    	  	  
(define (TOUGH-EYE-FOR-EYE my-history other-history-1 other-history-2)
  (if (or (equal? (car other-history-1) "d") (equal? (car other-history-2) "d")) "d" "c") 	   	  	   
  )  	   	    	  	  
;This code revied version of two-player which is implemented abow. Only Name of the method and 3th player variables and imputs were added.  	    	  	  
(define (SOFT-EYE-FOR-EYE my-history other-history-1 other-history-2)
  (if (and (equal? (car other-history-1) "d") (equal? (car other-history-2) "d")) "d" "c") 	   	  	   
  )  	    	  	  
;This code revied version of two-player which is implemented abow. Only Name of the method and 3th player variables and imputs were added.

; Test cases for strategies: (When you write your procedure you can
; test it with the below test cases. Initially it returns #f since
; your-answer-here is defined as #f. But when you complete the procedure
; It should return the correct answers below.)
(display "--------Problem 10--------")
(newline)  	    	  	  
  	    	  	  
(display "Testing NASTY-3:")  	    	  	  
(newline)  	    	  	  
(NASTY-3 (list "c") (list "c") (list "c")) ; ANSWER => "d"
(NASTY-3 (list "c") (list "d") (list "c")) ; ANSWER => "d"
(NASTY-3 (list "d") (list "d") (list "d")) ; ANSWER => "d"
  	    	  	  
(display "Testing PATSY-3:")  	    	  	  
(newline)  	    	  	  
(PATSY-3 (list "c") (list "c") (list "c")) ; ANSWER => "c"
(PATSY-3 (list "d") (list "c") (list "c")) ; ANSWER => "c"
(PATSY-3 (list "d") (list "d") (list "d")) ; ANSWER => "c"
  	    	  	  
(display "Testing SPASTIC-3:")  	    	  	  
(newline)  	    	  	  
(SPASTIC-3 (list "c") (list "c") (list "c")) ; ANSWER => 50% of time "d", 50% of time "c"
  	    	  	  
  	    	  	  
(display "Testing TOUGH-EYE-FOR-EYE:")
(newline)  	    	  	  
(TOUGH-EYE-FOR-EYE (list "d") (list "c") (list "c")) ; ANSWER => "c"
(TOUGH-EYE-FOR-EYE (list "c") (list "c") (list "d")) ; ANSWER => "d"
(TOUGH-EYE-FOR-EYE (list "c") (list "d") (list "c")) ; ANSWER => "d"
(TOUGH-EYE-FOR-EYE (list "c") (list "d") (list "d")) ; ANSWER => "d"
  	    	  	  
(display "Testing SOFT-EYE-FOR-EYE:")
(newline)  	    	  	  
(SOFT-EYE-FOR-EYE (list "c") (list "c") (list "d")) ; ANSWER => "c"
(SOFT-EYE-FOR-EYE (list "c") (list "d") (list "c")) ; ANSWER => "c"
(SOFT-EYE-FOR-EYE (list "c") (list "d") (list "d")) ; ANSWER => "d"
(SOFT-EYE-FOR-EYE (list "d") (list "c") (list "c")) ; ANSWER => "c"
  	    	  	  
(display "-----End of Problem 10-----")
(newline)  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:::;::;;:;;::;::;
; END OF PROJECT  	    	  	  
  	    	  	  
  	    	  	  
