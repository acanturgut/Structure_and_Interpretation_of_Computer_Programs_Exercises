;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;::;;::;:;:
;;;   The Object-Oriented Adventure Game
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;::;;::;::;
;;;  	    	  	  
;;; aturgut@ku.edu.tr  	    	  	  
;;;  	    	  	  
;;; Before you start:
;;;
;;; * Please read the project handout available on the course
;;;   web site first to get a basic idea about the project and the
;;;   logic behind it, then to find out the details about what
;;;   your tasks are for the rest of the project.
;;;  	    	  	  
;;; * The following code should be studied and loaded for this
;;;   project.  Please do not modify these files, put all your work in
;;;   this file.  	    	  	  
;;;  	    	  	  
;;; - objsys.scm: support for an elementary object system
;;; - objtypes.scm: a few nice object classes
;;; - setup.scm: a bizarre world constructed using these classes
;;;  	    	  	  
;;; * Plan your work with pencil and paper before starting to code.
;;;  	    	  	  
;;; While you are working:  	    	  	  
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code (in this file)
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;;  	    	  	  
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;;  	    	  	  
;;;  	    	  	  
;;; When you are done:  	    	  	  
;;; * Perform a final save and submit your work following the instructions.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200help@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;;  	    	  	  
;;; *** IF (load "project4.scm") GIVES ERRORS YOUR PROJECT WILL NOT BE GRADED *
;;;  	    	  	  
;;;  	    	  	  
;; Do NOT modify or delete the lines below.
(#%require (only racket/base random))
(load "objsys.scm")  	    	  	  
(load "objtypes.scm")  	    	  	  
(load "setup.scm")  	    	  	  
(define nil '())  	    	  	  
(define your-answer-here #f)  	    	  	  
;;;;;;;;;

;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;::;;::;:::
;;; PART II. Programming Assignment
;;;  	    	  	  
;;; The answers to the computer exercises in Section 5 go in the
;;; appropriate sections below.
;;;  	    	  	  
  	    	  	  
;
;
 
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;::;;:::;;;
;;;;;;;;;;;;; Computer Exercise 0: Setting up ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  	    	  	  
;;;;;;;;;;;;; CODES: ;;;;;;;;;;;;;
;;  	    	  	  

;(setup 'a.can) ; UNCOMMENT to See Below
;
;(ask (ask me 'location) 'NAME)  ;AVATAR SAYS HIS CURRENT LOCATION
;(ask me 'name)                  ;AVATAR SAYS HIS NAME
;(ask me 'say '(HELLO WORLD))    ;AVATAR ASAYS "HELLO WORLD"
;(ask me 'go 'west)              ;AVATAR TRIES TO GO UP DIRECTION for CHANGING ROOMs

 ;(define walk
 ;(cond ((equal? #t (ask me 'go 'west))  (ask me 'go 'west))
 ;      ((equal? #t (ask me 'go 'east))  (ask me 'go 'east))
 ;      ((equal? #t (ask me 'go 'north)) (ask me 'go 'north))
 ;      ((equal? #t (ask me 'go 'south)) (ask me 'go 'south))
 ;      ((equal? #t (ask me 'go 'up))    (ask me 'go 'up))
 ;      ((equal? #t (ask me 'go 'down))  (ask me 'go 'down))
 ;      ((equal? #t (ask me 'go 'in))    (ask me 'go 'in))
 ;      ((equal? #t (ask me 'go 'out))   (ask me 'go 'out))
 ;      (else #f)))


 ;(ask me 'get 'golf-ball)            ;AVATAR TRIES TO TAKE GOLF BALL
 ;(ask me 'toss 'engineering-book)    ;AVATAR TRIES TO TOSS ENGINEERING BOOK
 ;(ask me 'die)                       ;AVATAR SUICIEDES

;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;::;;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
;ready
;eng-b30
;a.can

;At eng-b30 a.can says -- hello world 
;a.can moves from eng-b30 to eng-z21 
;suzy moves from suzy-cafe to student-center 
;lambda-man moves from migros to cici-bufe 
;At cici-bufe lambda-man says -- Hi cici 
;At cici-bufe lambda-man says -- I take kofte from cici-bufe 
;comp200-student moves from amphitheater to sos-building 
;comp200-student moves from sos-building to sci-building 
;prof-yuret moves from bookstore to suzy-cafe 
;At suzy-cafe prof-yuret says -- I take coke from suzy-cafe 
;alyssa-p-hacker moves from migros to cici-bufe 
;At cici-bufe alyssa-p-hacker says -- Hi lambda-man cici 
;alyssa-p-hacker moves from cici-bufe to divan 
;ben-bitdiddle moves from adm-building to dorms 
;At dorms ben-bitdiddle says -- I take tons-of-code from dorms 
;--- the-clock Tick 0 --- 
;You are in eng-z21 
;You are not holding anything. 
;You see stuff in the room: problem-set 
;There are no other people around you. 
;The exits are in directions: up down south out #t

;At eng-z21 a.can says -- i do not see a golf-ball here 
;At eng-z21 a.can says -- i do not have a engineering-book 
;At eng-z21 a.can says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;An earth-shattering, soul-piercing scream is heard... 
;a.can moves from eng-z21 to heaven game-over-for-you-dude
 	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;::;;;;
  	    	  	  
  	    	  	  
  	    	  	  


  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;::;;;:
;;;;;; Computer Exercise 1: Understanding installation;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;::;;:;
;;  	    	  	  
;;;;;;;;;;;;; ANSWER: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
;ASK and DELEGATE  	    	  	  
  	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;::;;::
  	    	  	  
  	    	  	  
  	    	  	    	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;::;:;;
;;;;;;;;;;;; Computer Exercise 2: Who just died? ;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;::;:;:
;;  	    	  	  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;  	    	  	  

;UNCOMMENT BELOW TWO LINES TO SEE CODE IS WORK OR NOT; MAKE COMMENT IN SETUP WEAPON, BOMB RELATED CODES

;(ask me 'die)                        ;FIRST AVATAR GOES TO HEAVEN
;(names-of (ask me 'PEOPLE-AROUND))   ;THEN CHECK PEOPLES IN HEAVEN FOR FINDING WHO DIES
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;::;::;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
; For the finding who just die, just go to heaven and check population of heaven for who is death.
; I assume that deity-mode off. In the below transcript, deity-mode is on for showing that my result is correct.
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;::;:::
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;
	    	  	  
;At cici-bufe cici says -- Prepare to suffer, alyssa-p-hacker ! 
;At cici-bufe alyssa-p-hacker says -- Ouch! 3 hits is more than I want! 
;At cici-bufe alyssa-p-hacker says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;An earth-shattering, soul-piercing scream is heard... 
;alyssa-p-hacker moves from cici-bufe to heaven 
;lambda-man moves from cas-building to sos-building 
;comp200-student moves from registrar-office to bursar-office 
;comp200-student moves from bursar-office to registrar-office 
;At registrar-office comp200-student says -- I take diploma from registrar-office 
;prof-yuret moves from deans-office to eng-z21 
;At eng-z21 prof-yuret says -- I take problem-set from eng-z21 
;ben-bitdiddle moves from gym to library 
;At library ben-bitdiddle says -- Hi a.can 
;--- the-clock Tick 0 --- 
;You are in library 
;You are not holding anything. 
;You see stuff in the room: engineering-book 
;You see other people: ben-bitdiddle 
;The exits are in directions: west east #t

;At library a.can says -- i do not see a golf-ball here 
;At library a.can says -- i do not have a engineering-book 
;At library a.can says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;An earth-shattering, soul-piercing scream is heard... 
;a.can moves from library to heaven 
;At heaven a.can says -- Hi alyssa-p-hacker game-over-for-you-dude

;At heaven a.can says -- SHREEEEK!  I, uh, suddenly feel very faint... 
;An earth-shattering, soul-piercing scream is heard... 
;a.can moves from heaven to heaven 
;At heaven a.can says -- Hi alyssa-p-hacker game-over-for-you-dude
;(alyssa-p-hacker); AS WE CAN SEE AFTER GOING HEAVEN WE FOUND ALYSSA-P-HACKER WHO WAS MURDERED	    	  	  
  	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;:::;;;
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;::;:::;:::;;:
;;;;;;;; Computer exercise 3: Having a quick look ;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;::;;;;
;;  	    	  	  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
;your-answer-here ;; ITS ALREADY DONE INITIALY	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;::;;;:
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
;your-answer-here ;; ITS ALREADY DONE INITIALY	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;::;;:;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
;your-answer-here  ;; ITS ALREADY DONE INITIALY	    	  	  
  	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;::;;::
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;::;:;;
;;;;;; Computer exercise 4: But I'm too young to die!! ;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;::;:;:
;;  	    	  	  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
(define (make-person name birthplace) ; symbol, location -> person
  (let ((mobile-thing-part (make-mobile-thing name birthplace))
	(container-part    (make-container))
	(health            3)  	    	  	  
	(strength          1))  	    	  	  
    (lambda (message)  	    	  	  
      (case message  	    	  	  
	((PERSON?) (lambda (self) #T))
	((STRENGTH) (lambda (self) strength))
	((HEALTH) (lambda (self) health))
        ((SAY)  	    	  	  
         (lambda (self list-of-stuff)
           (ask screen 'TELL-ROOM (ask self 'location)
                (append (list "At" (ask (ask self 'LOCATION) 'NAME)
                                 (ask self 'NAME) "says --")
                           list-of-stuff))
                  'SAID-AND-HEARD))
	((HAVE-FIT)  	    	  	  
	 (lambda (self)  	    	  	  
	   (ask self 'SAY '("Yaaaah! I am upset!"))
	   'I-feel-better-now))
  	    	  	  
	((PEOPLE-AROUND)	; other people in room...
	 (lambda (self)  	    	  	  
	   (let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
		  (people (myfilter (lambda (x) (is-a x 'PERSON?)) in-room)))
	     (delq self people))))
  	    	  	  
	((STUFF-AROUND)		; stuff (non people) in room...
	 (lambda (self)  	    	  	  
	   (let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
		  (stuff (myfilter (lambda (x) (not (is-a x 'PERSON?))) in-room)))
	     stuff)))  	    	  	  
  	    	  	  
	((PEEK-AROUND)		; other people's stuff...
	 (lambda (self)  	    	  	  
	   (let ((people (ask self 'PEOPLE-AROUND)))
	     (accumulate append '() (map (lambda (p) (ask p 'THINGS)) people)))))
  	    	  	  
	((TAKE)  	    	  	  
	 (lambda (self thing)  	    	  	  
	   (cond ((ask self 'HAVE-THING? thing)  ; already have it
		  (ask self 'SAY (list "I am already carrying"
				       (ask thing 'NAME)))
		  #f)  	    	  	  
		 ((or (is-a thing 'PERSON?)
		      (not (is-a thing 'MOBILE-THING?)))
		  (ask self 'SAY (list "I try but cannot take"
				       (ask thing 'NAME)))
		  #F)  	    	  	  
		 (else  	    	  	  
		  (let ((owner (ask thing 'LOCATION)))
		    (ask self 'SAY (list "I take" (ask thing 'NAME)
					 "from" (ask owner 'NAME)))
		    (if (is-a owner 'PERSON?)
			(ask owner 'LOSE thing self)
			(ask thing 'CHANGE-LOCATION self))
		    thing)))))  	    	  	  
  	    	  	  
	((LOSE)  	    	  	  
	 (lambda (self thing lose-to)
	   (ask self 'SAY (list "I lose" (ask thing 'NAME)))
	   (ask self 'HAVE-FIT)
	   (ask thing 'CHANGE-LOCATION lose-to)))
  	    	  	  
	((DROP)  	    	  	  
	 (lambda (self thing)  	    	  	  
	   (ask self 'SAY (list "I drop" (ask thing 'NAME)
				"at" (ask (ask self 'LOCATION) 'NAME)))
	   (ask thing 'CHANGE-LOCATION (ask self 'LOCATION))))
  	    	  	  
        ((GO-EXIT)  	    	  	  
         (lambda (self exit)  	    	  	  
           (ask exit 'USE self)))
  	    	  	  
	((GO)  	    	  	  
	 (lambda (self direction) ; person, symbol -> boolean
	   (let ((exit (ask (ask self 'LOCATION) 'EXIT-TOWARDS direction)))
	     (if (is-a exit 'EXIT?)
                 (ask self 'GO-EXIT exit)
		 (begin (ask screen 'TELL-ROOM (ask self 'LOCATION)
			     (list "No exit in" direction "direction"))
			#F)))))
	((SUFFER)  	    	  	  
	 (lambda (self hits)  	    	  	  
	   (ask self 'SAY (list "Ouch!" hits "hits is more than I want!"))
	   (set! health (- health hits))
	   (if (<= health 0) (ask self 'DIE))
	   health))  	    	  	  
  	    	  	  
	((DEATH-SCREAM)  	    	  	  
	 (lambda (self)  	    	  	  
	   (ask screen 'TELL-WORLD
		'("An earth-shattering, soul-piercing scream is heard..."))))
  	    	  	  
	((ENTER-ROOM)  	    	  	  
	 (lambda (self)  	    	  	  
	   (let ((others (ask self 'PEOPLE-AROUND)))
	     (if (not (null? others))
		 (ask self 'SAY (cons "Hi" (names-of others)))))
	   (ask (ask self 'location) 'make-noise self)
	   #T))  	    	  	  
  	    	  	  
	;; Here is the original DIE method
	;; ((DIE)  	    	  	  
	;;  (lambda (self)  	    	  	  
	;;    (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint..."))
	;;    (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
	;; 	     (ask self 'THINGS))
	;;    (ask self 'DEATH-SCREAM)
	;;    (ask death-exit 'USE self)
	;;    'GAME-OVER-FOR-YOU-DUDE))
  	    	  	  
	;; Your version goes here:
  	    	  	  
          ((DIE)  	    	  	  
            (lambda (self)
             (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint... But it is not the end of mine"))
             (begin (define dogduguYer (make-exit nil 'location birthplace)) ;dogduguYer refers to birthplace 
                    (ask dogduguYer 'USE self)
                     ; and person re-created
                    (set! health 3) 'MY-HEALT-WAS-REGENERATED
                    (ask self 'LOCATION) 'Its-like-heaven);It gives a location and lovely comment   
              ))  	    	  	  	    	  	  
	(else (find-method message mobile-thing-part container-part))))))

;(setup 'a.can) ;UNCOMMENT THIS to SEE RESULTS ;MAKE COMMENT IN SETUP WEAPON, BOMB RELATED CODES  
;(ask me 'die)  ;UNCOMMENT THIS to SEE RESULTS ;MAKE COMMENT IN SETUP WEAPON, BOMB RELATED CODES
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;::;::;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
;In this case, Die method changed. Span point was changed haven to birthplace.
; 
  	    	  	   	    	  	    	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;::;:::
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
;> (ask me 'look-around)

;You are in eng-b30 
;You are not holding anything. 
;You see stuff in the room: lecture-notes white-board 
;There are no other people around you. 
;The exits are in directions: up ok
;> (ask me 'go 'up)

;a.can moves from eng-b30 to eng-z21 
;At eng-z21 a.can says -- Hi prof-yuret 
;lambda-man moves from eng-auditorium to eng-z21 
;At eng-z21 lambda-man says -- Hi a.can prof-yuret 
;comp200-student moves from parking-lot to eng-building 
;comp200-student moves from eng-building to eng-z21 
;At eng-z21 comp200-student says -- Hi lambda-man a.can prof-yuret 
;At eng-z21 comp200-student says -- I take problem-set from eng-z21 
;prof-yuret moves from eng-z21 to eng-auditorium 
;At eng-auditorium prof-yuret says -- I take final-exam from eng-auditorium 
;alyssa-p-hacker moves from amphitheater to sos-building 
;ben-bitdiddle moves from cas-building to sos-building 
;At sos-building ben-bitdiddle says -- Hi alyssa-p-hacker 
;--- the-clock Tick 0 --- 
;You are in eng-z21 
;You are not holding anything. 
;There is no stuff in the room. 
;You see other people: comp200-student lambda-man 
;The exits are in directions: up down south out #t
;> (ask me 'die)

;At eng-z21 a.can says -- SHREEEEK!  I, uh, suddenly feel very faint... But it is not the end of mine 
;a.can moves from eng-z21 to eng-b30 its-like-heaven   ;; After Death It returns birthplace..
;> 	    	  	  
  	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;:::;;;







;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;;;:::;;:
;;; Computer exercise 5: Perhaps to arm oneself against a sea of .... ;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;::;;;;
;;  	    	  	  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;

(define (make-weapon name location damage)
    (let ((mobile-thing-part (make-mobile-thing name location))
	)
    (lambda (message)  	   	  	   
      (case message  	   	  	   
	((WEAPON?) (lambda (self) #T))    ;Check mobile thing is weapon or not
        ((DAMAGE) (lambda (self) damage)) ;Return damage of weapon	   	  	   
	((HIT)  	   	  	  ;Harm some one in the room some random damage. 
	(lambda (self who to-whom) (begin (define hits (+ 1 (random damage)))
                            (ask to-whom 'SUFFER hits))))
        (else (get-method message mobile-thing-part)))))) 

(define (create-weapon name location damage)
  (create make-weapon name location damage))

;(setup 'a.can)
 
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;::;;;:
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;

;EXAMPLE CODE OF FOR KILLING SOME ONE IN YOUR ROOM;
;(ask (thing-named 'gun12) 'hit me (thing-named 'lambda-man))
;This class connected with mobile thing class.
;It has three diffrent field weapon?, damage, hit.
;weapon? checks thing is bomb or not returns #t
;damage returns damage of the weapon
;hit, hit somone in the same room with given random damage.
	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;::;;:;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;  	    	  	  

#|

You are in eng-b30 
You are not holding anything. 
You see stuff in the room: gun18888 gun14444 gun144 gun14 gun12 lecture-notes white-board 
You see other people: lambda-man 
The exits are in directions: up ok
> (ask (thing-named 'gun12) 'hit me (thing-named 'lambda-man))
At eng-b30 lambda-man says -- Ouch! 1 hits is more than I want! 2

|#
  	    	  	  
  	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;::;;::
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;::;:;;
;;;;;;;; Computer exercise 6: Good thing I'm armed and dangerous ;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;::;:;:
;;  	    	  	  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;

(define (make-my-violent-person name birthplace activity miserly parameter)
  (let ((person-part (make-autonomous-player name birthplace activity miserly)))
    (lambda (message)  	   	  	   
      (case message
        ((VIOLENT-PERSON?) (lambda (self) #t))
        ((INSTALL)  ;give relation with clock 	   	  	   
	 (lambda (self)  	   	  	   
	   (ask clock 'ADD-CALLBACK
		(make-clock-callback 'attack-random self
				       'ATTACK-RANDOM))
	   (delegate person-part self 'INSTALL)))
        ((ATTACK-RANDOM) ;attack random person part 
         (lambda (self)
             (if  (and (not (null? (ask self 'PEOPLE-AROUND)))  
                       (not (null? (myfilter (lambda (x) (is-a x 'WEAPON?)) ;filter weapon around and take it 
                                             (ask self 'STUFF-AROUND)))))
                 (if ( = (random-number parameter) 1)
                     (ask (pick-random (myfilter (lambda (x) (is-a x 'WEAPON?))
                                                 (ask self 'STUFF-AROUND))) ;kill people
                          'HIT self (pick-random (ask self 'PEOPLE-AROUND)))
                     (ask self 'MOVE-SOMEWHERE)))))
        (else (get-method message person-part))))))

(define (create-violent-person name birthplace activity miserly parameter)
  (create make-my-violent-person name birthplace activity miserly parameter))

;(setup 'HELLO-VIOLENT-LIFE)
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;::;::;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;  	    	  	  
#|

This class takes name birthplace activity miserly parameter. Activity and miserly realted with
the autonomous person.

In this class, violent-persons were created who suffers arround randomly. Paramter determines
violent-person attacks or does not attacks.

This class has three field

VIOLENT-PERSON?

It checks the person is violent-person or not !

INSTALL

Install method just like the autonomus-person class, it triggers and
gives a massege to clock of the game

ATTACK-RANDOM

In this field violent person filter

  	    	  	  
|#  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;::;:::
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;

#|

prof-yuret moves from sci-building to eng-building 
alyssa-p-hacker moves from eng-z21 to eng-building 
At eng-building alyssa-p-hacker says -- Hi prof-yuret 
At eng-building alyssa-p-hacker says -- I take gun1 from prof-yuret 
At eng-building prof-yuret says -- I lose gun1 
At eng-building prof-yuret says -- Yaaaah! I am upset! 
--- the-clock Tick 8 --- 
You are in great-court 
You are not holding anything. 

|#
	    	  	 	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;:::;;;
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;:;:;:::;;:;:::;;:
;;; Computer exercise 7: A good hacker could defuse this situation ;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;::;;;;
;;  	    	  	  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;  	    	  	  



(define (make-bomb name location damage)
  (let ((make-bomb-aware (make-aware-thing))
       (mobile-thing-part (make-mobile-thing name location))
       (ARM-OR-NOT 0))    
       (lambda (mesage)
         (case mesage
                ((BOMB?) (lambda (self) #t)) ; thing is bomb ?
                ((ARM) (lambda (self)  (set! ARM-OR-NOT 1))) ;Bomb is avaiable
                ((DISARM) (lambda (self) (set! ARM-OR-NOT 0))); Bomb is unavaible
                ((TRIGGER) (lambda (self) ; if bomb is armed trigger active method
                             (if (= ARM-OR-NOT 1)
                                 (ask self 'ACTIVATE))))
                ((HEARD-NOISE) (lambda (self location) (ask self 'TRIGGER))) ; if bomb is armed, kill who enter the room, explode
                ((ACTIVATE) (lambda (self) ;kill every human in the room with for-each method
                     
                             (begin (for-each (lambda (insanlar)
                                                (ask insanlar 'SUFFER damage))
                                   (myfilter (lambda (x) (is-a x 'PERSON?)) (ask (ask self 'LOCATION) 'THINGS)))
                                   (ask self 'DESTROY))))
          (else (find-method mesage make-bomb-aware mobile-thing-part))))))

(define (create-bomb name location damage)
  (create make-bomb name location damage))
                
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;::;;;:
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;  	    	  	  
  	    	  	  
 	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;::;;:;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;  	    	  	  

#|

> (ask (thing-named 'hand-bomb) 'ARM)
> (ask (thing-named 'hand-bomb) 'ACTIVATE)

At eng-building can says -- Ouch! 7 hits is more than I want! 
At eng-building can says -- SHREEEEK!  I, uh, suddenly feel very faint... But it is not the end of mine 
can moves from eng-building to sci-building 
At sci-building can says -- Hi comp200-student destroyed

|#  	    	  	  
  	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;::;;::
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;::;:;;
;;;; Computer exercise 8: Well, maybe only if they have enough time ;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;::;:;:
;;  	    	  	  
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;

(define (make-bomb-with-timer name location damage)
  (let  ((make-bomb-aware (make-aware-thing))
         (make-bomb-part (make-bomb name location damage))
       (mobile-thing-part (make-mobile-thing name location))
       (countdown 2)
       (ARM-OR-NOT 0))
       (lambda (mesage)
         (case mesage
                ((BOMB-WITH-TIMER?) (lambda (self) #t)) ;bomb has timer ?
                ((ARM) (lambda (self)  (set! ARM-OR-NOT 1))) ;arm same as the bomb
                ((INSTALL)  	    (lambda (self) ;move it self with clock
                                      
	   (ask clock 'ADD-CALLBACK
		(make-clock-callback 'count-and-explode self
				       'count-and-explode))
                                      
	   (delegate mobile-thing-part self 'INSTALL)))
                
                ((COUNT-AND-EXPLODE) (lambda (self) ;set counter on bomb and after 2 cycle it explodes

                                           (begin (if (= ARM-OR-NOT 1)
                                                (set! countdown (- countdown 1)))
                                            (if (= countdown 0) (ask self 'ACTIVATE)) (display countdown))
                                            ))
                
          (else (find-method mesage make-bomb-aware make-bomb-part mobile-thing-part))))))

(define (create-bomb-with-timer name location damage)
  (create make-bomb-with-timer name location damage))
  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;::;::;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;

; It is inherit of the mobile-thing, bomb and aware thing classes
; Definitions were given on the code 	    	  	  
;  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;::;:::
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;

#|

> (ask (thing-named 'tbomb3) 'arm)
> (ask (thing-named 'tbomb3) 'count-and-explode)
1
> (ask (thing-named 'tbomb3) 'count-and-explode)

At parking-lot can says -- Ouch! 7 hits is more than I want! 
At parking-lot can says -- SHREEEEK!  I, uh, suddenly feel very faint... But it is not the end of mine 
can moves from parking-lot to parking-lot 0

|#
  	    	  	  
  	    	  	  
  	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;:::;;;
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;;;:::;;:
;;;;;;;;; Computer Exercise 9: Even you can change the world! ;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;:;::;;;;
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;:;::;;;:
;;;;;;;;;;;;; DESCRIPTION: ;;;;;;;;;;;;;
;;

;Esmer-bomba inherit with autonmus-person class.
;Esmer-bomba blocks the one room and blow it always. 
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;:;::;;:;
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;  	    	  	  
(setup 'CAN)


(define (make-esmer-bomba name birthplace activity miserly)
  (let ((person-part (make-autonomous-player name birthplace activity miserly))
        (health 4000000000))
    (lambda (message)  	   	  	   
      (case message
        ((ESMER-BOMBA?) (lambda (self) #t))
        ((INSTALL)  	   	  	   
	 (lambda (self)  	   	  	   
	   (ask clock 'ADD-CALLBACK
		(make-clock-callback 'set-bomb self 
				       'SET-BOMB))
	   (delegate person-part self 'INSTALL)))       
        ((SET-BOMB) (lambda (self)
                    (begin (for-each (lambda (insanlar)
                                                (ask insanlar 'SUFFER 100)) ;Give 100 damage
                                   (myfilter (lambda (x) (is-a x 'PERSON?)) (ask (ask self 'LOCATION) 'THINGS))) ; Kill All People
                                   (display 'I-AM-EVIL) ; Say Evil
                                   )))
        (else (get-method message person-part))))))
      
(define (create-esmer-bomba name birthplace activity miserly)
  (create make-esmer-bomba name birthplace activity miserly))

;you should add this ;(create-esmer-bomba 'esmer-bomba (pick-random rooms) 3 1) ;
;then
;uncommnet this
;(setup 'CAN)
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;:;::;;::
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;  	    	  	  

#|


This class acces lower class of the autonomus-person.
It has a relation with bomb class..

|#

  	    	  	   	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;:;::;:;;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;

#|

At cici-bufe lambda-man says -- Ouch! 3 hits is more than I want! 
At cici-bufe lambda-man says -- SHREEEEK!  I, uh, suddenly feel very faint... But it is not the end of mine 
lambda-man moves from cici-bufe to cici-bufe 
At cici-bufe lambda-man says -- Hi cici 
suzy moves from suzy-cafe to student-center 
At graduation-stage alyssa-p-hacker says -- Ouch! 100 hits is more than I want! 
At graduation-stage alyssa-p-hacker says -- SHREEEEK!  I, uh, suddenly feel very faint... But it is not the end of mine 
alyssa-p-hacker moves from graduation-stage to library 
At graduation-stage esmer-bomba says -- Ouch! 100 hits is more than I want! 
At graduation-stage esmer-bomba says -- SHREEEEK!  I, uh, suddenly feel very faint... But it is not the end of mine 
esmer-bomba moves from graduation-stage to graduation-stage i-am-evil

|#
  	    	  	    	    	  	  
;;  	    	  	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;:;::;:;:
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;:;::;::;
;# DO NOT FORGET TO SUBMIT YOUR WORK BEFORE THE DEADLINE!         #
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;:;::;:::
;# GOOD LUCK!                                                     #
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;;::;::;::;;::;;;:;:::;;;
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
  	    	  	  
