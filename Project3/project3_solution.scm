;;; aturgut@ku.edu.tr    Wed Nov 18 16:36:53 2015
;;;  	    	  	  
;;;	Comp200 Project 3 - Graphs
;;;  	    	  	  
;;; Before you start:  	    	  	  
;;; * Please read "Project Submission Instructions" carefully.
;;;  	    	  	  
;;; * Please read the "Project 3" handout available on the course
;;;   web site first to get a basic idea about the project and the
;;;   logic behind it, then to find out the details about what
;;;   your tasks are for the rest of the project.
;;;  	    	  	  
;;; * Plan your work with pencil and paper before starting to code.
;;;  	    	  	  
;;;  	    	  	  
;;; While you are working:  	    	  	  
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;;  	    	  	  
;;;  *** NOTHING WRITTEN GETS EXCHANGED ***
;;;  	    	  	  
;;;  	    	  	  
;;;  	    	  	  
;;;  	    	  	  
;;;  	    	  	  
;;; Loading helper functions:  	    	  	  
(load "search.scm")  	    	  	  
  	    	  	  
;;; The following is defined so that the file loads without errors:
(define your-answer-here #f)  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:;:;::;;:;;::;;;:
;;; Exercise 0.1:  	    	  	  
;;;  	    	  	  
;;; Read and try to understand the codes within the search.scm
;;; There are some commented test case examples of pre-defined functions
;;; Uncomment and run the code see their results
;;; Copy and paste the results here (as comment lines)
;;;
;   ; It gives below results 
;   (graph-element b (c d e h) (more words)) ;(find-graph-element test-graph 'b)
;   ()                                       ;(find-graph-element test-graph 'z)
;   (c d e h)                                ;(find-node-children test-graph 'b)
;   ()                                       ;(find-node-children test-graph 'z)
;   (more words)                             ;(find-node-contents test-graph 'b)
;   () 	    	  	                     ;(find-node-contents test-graph 'z)
;   ; So that initial code works fine !.  

;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:;:;::;;:;;::;;:;
;;; Exercise 0.2:  	    	  	  
;;;  	    	  	  
;;; You have a DFS test case in the project instructions document.
;;; Run the test case of it and write the result down in comments.
;;; You should run it for an existing and non-existing node
;
; existing:    ; (now-at a)(now-at b)(now-at c)(now-at d)(now-at e)(now-at f)(now-at g)(now-at h)(now-at i)(now-at j)(now-at k)(now-at l)#t  	    	  	  
; nonexisting: ; (now-at a)(now-at b)(now-at c)(now-at d)(now-at e)(now-at f)(now-at g)(now-at h)(now-at i)(now-at j)(now-at k)(now-at l)(now-at m)#f

;(DFS-simple 'a (lambda (node) (eq? node 'l)) test-graph) ; existing node
;(DFS-simple 'a (lambda (node) (eq? node 'o)) test-graph) ; non-existing node

;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:;:;::;;:;;::;;::
;;; Exercise 1: The Web as a General Graph
;;;  	    	  	  
;;;  	    	  	  
;;; Explain why our depth first strategy (using DFS-simple) will
;;; fail on the general graph.  	    	  	  
;;;  	    	  	  
  	    	  	  
;  	    	  	  
;  Explanation:
;
;  For example if our test graph node " 'b " 's child is '(a c d e h) with that
;  search technique program enters a infinite loop, when " 'c " searched. If our 
;  graph looks like Figure 1 - Graph which is represented in COMP200- Project3-
;  manual, DFS search enters a infinite loop, when second node's child is first node.
;  (make-graph-element 'b '(c d e h) '(more words)) --> changed like below...
;  (make-graph-element 'b '(a c d e h) '(more words))
;  (DFS-simple 'a (lambda (node) (eq? node 'c)) test-graph) then DFS called with
;  node 'a to searching node 'c program enters infinite loop.
;  Basically DFS-simple fails while its searching indirect graphs when non-existing node searched. Such as cycle-grahp sample. 


;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:;:;::;;:;;::;:;;
;;; Exercise 2:  Breadth-first search
;;;  	    	  	  
;;; Follow the instructions in the Project 3 handout, do not forget
;;; the documentation and test cases.

(define (BFS-simple start goal? graph)
  (search start  	    	  	  
	  goal?  	    	  	  
	  find-node-children  	    	  	  
	  (lambda (new old) (append old new)) ;apending type was changed it appends old with new
                                              ;In DFS it append's new and old
                                              ;So that old one always the first elemnt of the  list. 
	  graph))
	    	  	  
;Why it works explanation;
;It works since our test-graph is tree and direct graph;
;In BFS-simple it searchs first connected nodes then checks their nodes and remove initial node;
;So according to our test-graph, it moves along to edge to edge then start to top and it can find final nodes. 

;Comparison BFS-simple and DFS-simple initial node = 'a -  searching node = 'l

;(now-at a)(now-at b)(now-at c)(now-at d)(now-at e)(now-at f)(now-at g)(now-at h)(now-at i)(now-at j)(now-at k)(now-at l)#t
;(now-at a)(now-at b)(now-at i)(now-at m)(now-at c)(now-at d)(now-at e)(now-at h)(now-at j)(now-at k)(now-at l)#t

;;;  	    	  	  
;;; Test Cases: 	    	  	  
;;;  	    	  	  
;  	    	  	  
; Use at least 3 different test case with different nodes (one should be not a node)
; Test cases should be the same structure with the DFS test case which is given in the PDF file of project
;;;  	    	  	  
;;;

;(BFS-simple 'a (lambda (node) (eq? node 'l)) test-graph) ;->  #t
;(BFS-simple 'd (lambda (node) (eq? node 'k)) test-graph) ;->  #f
;(BFS-simple 'q (lambda (node) (eq? node 'c)) test-graph) ;->  #f

  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:;:;::;;:;;::;:;:
;;; Exercise 3: The Index Abstraction
;;;  	    	  	  
;;;  	    	  	  
;;; Follow the instructions in the Project 3 handout, do not forget
;;; the documentation and test cases.
  	    	  	  
; Adds the value under the given key in the index
(define (add-to-index! index key value) ; Index,Key,Val -> Index
 
  (let ((index-entry (find-entry-in-index index key)))

    (if (null? index-entry)  	   	  	   
	;; no entry -- create and insert a new one...
      (if (or (equal? null key) (equal? null value )) ;checks key is null or not 

          index ; if null retuns previous index 

        (let ((ad-var (list key (list value))))

            (set-cdr! index (cons ad-var (cdr index)))) ;adds new key and value 

         )        
	;; entry exists -- insert value if not already there...
        (if  (or (pair? (member value (cadr index-entry))) (equal? value null) ) ;checks value existed in the selected key 

             index ;if exist it returns previous index 

             (set-cdr! index-entry (list (cons value (car (cdr index-entry ))))) ;adds new value in the selected node 
           )
        
  ))   (cons (car index)  (reversel (cdr index))))



(define (reversel l) ;This code takes reverse of the list 
  (if (null? l)
     '()
     (append (reversel (cdr l)) (list (car l)))
  )
)



;This procedure adds new key after sybol of the list.
;(index  .... (added key-3 value-3 pair) (added key-2 value-2 pair) (added key-1 value-1 pair))
  	    	  	  
;;;;;;;;;;;;;;;;;;;  	    	  	  
;;; Test Cases  ;;;	    	  	  
;;;;;;;;;;;;;;;;;;;  	    	  	  
;

;(define test-index (make-index))                   ; ;it creates a empty index 
;(add-to-index! test-index 'key1 'value1)           ; (index (key1 (value1)))
;(add-to-index! test-index 'key2 'value2)           ; (index (key1 (value1)) (key2 (value2)))
;(add-to-index! test-index 'key1 'another-value1)   ; (index (key1 (value1 another-value1)) (key2 (value2)))

;(add-to-index! test-index 'key1 'another-value2)   ; (index (key2 (value2)) (key1 (another-value2 another-value1 value1)))
;(add-to-index! test-index 'key3 'comp)             ; (index (key3 (comp)) (key2 (value2)) (key1 (another-value2 another-value1 value1)))
;(add-to-index! test-index 'key3 'comp)             ; (index (key3 (comp)) (key2 (value2)) (key1 (another-value2 another-value1 value1)))
;(add-to-index! test-index 'key4  null)             ; ;empty value ;(index (key3 (comp)) (key2 (value2)) (key1 (another-value2 another-value1 value1)))
;(add-to-index! test-index '()   'comp)             ; ;empty key   ;(index (key3 (comp)) (key2 (value2)) (key1 (another-value2 another-value1 value1)))
	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:;:;::;;:;;::;::;
;;; Exercise 4:  search-with-cycles
;;;  	    	  	  
;;; Part (a): you will need to write a similar search procedure that
;;; handles cycles  	    	  	  
;;;  	    	  	  
;;;  	    	  	  
;;; Follow the instructions in the Project3 handout, do not forget
;;; the documentation and test cases.
;;;  	    	  	  
  	    	  	  
(define (search-with-cycles initial-state goal? successors merge graph)
 
  (begin (define my-list null)  ;list was defined as a memory during to operation for recursive loop. 
    (define (search-inner-c still-to-do l) ;this procedure takes also l which is my-list. my-list recalled at the  end of the code. 
    
      (if (null? still-to-do)
          
	 #f
         
	 (let ((current (car still-to-do))) 

           (if   (pair? (member current l))  #f   ;created my-list was chechked in here... if node is exist in list, it returns #f

                 (begin    (if *search-debug* (write (list 'now-at current)))
	    (if (goal? current)  	    	  	  
	      #t  	    	  	  
	         (begin  (set! l (cons current l)) (display l) (search-inner-c  ;my-list was filled in here, and it also display visited nodes as a search-debug 	    	  	  
	       (merge (successors graph current) (cdr still-to-do)) l))))))))
  
   (search-inner-c (list initial-state) my-list)

   

   ))

; (set! l (cons current l)) (display l)      ;these are the added code pieces for the cylcle-search ;this code adds a entered nodes to the  my-list 
; (if   (pair? (member current l))   #f     ;it checks the nodes is exist or not. 

; This program memorize the visited nodes not delete it. If it was deleted visited nodes, when list is empty it returns #f 

;;;
;;;New Test graph 
;;;
;

;my-c


;(define my-c	    	  	  
;  (make-graph (list  	    	  	  
;   (make-graph-element 'a '(b c d) '(words for node a))
;   (make-graph-element 'b '(d c) '(words for node b))
;   (make-graph-element 'c '( a) '(words for node c))
;   (make-graph-element 'd '(b a c) '(words for node c))
;   )))

;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:;:;::;;:;;::;:::
;;;  	    	  	  
;;; Part (b): Use search-with-cycles to define a new procedure called DFS that
;;;           implements full depth first search.
;;;  	    	  	  
;;;  	    	  	  
;;; Follow the instructions in the Project3 handout, do not forget
;;; the documentation and test cases.

;same code was used in the DFS-simle just search technique was changed. This code not enters a infinite-loops. 
    
(define (DFS_cycled start goal? graph)
  (search-with-cycles start  	    	  	  
	  goal?  	    	  	  
	  find-node-children  	    	  	  
	  (lambda (new old) (append new old))
	  graph))
  	    	  	  
;;;  	    	  	  
;;; Test Cases  	    	  	  
;;;  	    	  	  
;  	    	  	  
; Use at least 2 different test case with different nodes
;  	    	  	  
;;;  	    	  	  
;;;

;Before the run this, un-comment my-c 

;(display "DFS")(DFS_cycled 'a (lambda (node) (eq? node 'd)) my-c) ; my-c which is created for creating test cases, is a graph. --> #t (present node search)
;(display "DFS")(DFS_cycled 'a (lambda (node) (eq? node 'k)) test-cycle) ;non-present node --> #f
;(display "DFS")(DFS_cycled 'a (lambda (node) (eq? node 'b)) test-cycle) ;present node     --> #t

; --- all posibilities ---- with present node -------; 

;(display "a")(DFS_cycled 'a (lambda (node) (eq? node 'b)) test-cycle) ; ->  #t
;(display "a")(DFS_cycled 'a (lambda (node) (eq? node 'c)) test-cycle) ; ->  #t
;(display "b")(DFS_cycled 'b (lambda (node) (eq? node 'a)) test-cycle) ; ->  #t
;(display "b")(DFS_cycled 'b (lambda (node) (eq? node 'c)) test-cycle) ; ->  #t
;(display "c")(DFS_cycled 'c (lambda (node) (eq? node 'a)) test-cycle) ; ->  #t
;(display "c")(DFS_cycled 'c (lambda (node) (eq? node 'b)) test-cycle) ; ->  #t
  	    	  	  
  	    	  	  
;;;;;;;::;;;;::::;:;;:::;:;::::;;:;::;;::::::;:;::::;:;;;::;:;:;::;;:;;:::;;;
;;; Part (c): Use search-with-cycles to define a new procedure called BFS that
;;;           implements full breadth first search.
;;;  	    	  	  
;;;  	    	  	  
;;; Follow the instructions in the Project 3 handout, do not forget
;;; the documentation and test cases.

;same code was used in the BFS-simle just search technique was changed. This code not enters a infinite-loops. 

(define (BFS_cycled start goal? graph)
  (search-with-cycles start  	    	  	  
	  goal?  	    	  	  
	  find-node-children  	    	  	  
	  (lambda (new old) (append old new))
	  graph))	    	  	  
  	    	  	  
;;;  	    	  	  
;;; Test Cases  	    	  	  
;;;  	    	  	  
;  	    	  	  
; Use at least 2 different test case with different nodes
;  	    	  	  
;;;  	    	  	  
;;;

;Before the run this, un-comment my-c 

;(display "DFS")(DFS_cycled 'a (lambda (node) (eq? node 'd)) my-c) ; my-c which is created for creating test cases, is a graph. --> #t (present node search)
;(display "BFS")(BFS_cycled 'a (lambda (node) (eq? node 'k)) test-cycle) ;non-present node --> #f
;(display "BFS")(BFS_cycled 'a (lambda (node) (eq? node 'b)) test-cycle) ;present node     --> #t


; --- all posibilities ---- with present node -------; 

;(display "a")(BFS_cycled 'a (lambda (node) (eq? node 'b)) test-cycle) ; ->  #t
;(display "a")(BFS_cycled 'a (lambda (node) (eq? node 'c)) test-cycle) ; ->  #t
;(display "b")(BFS_cycled 'b (lambda (node) (eq? node 'a)) test-cycle) ; ->  #t
;(display "b")(BFS_cycled 'b (lambda (node) (eq? node 'c)) test-cycle) ; ->  #t
;(display "c")(BFS_cycled 'c (lambda (node) (eq? node 'a)) test-cycle) ; ->  #t
;(display "c")(BFS_cycled 'c (lambda (node) (eq? node 'b)) test-cycle) ; ->  #t

;;;  	    	  	  
;;; Part (d): Give the order in which the nodes are visited for DFS and BFS
;;;
;;;  	    	  	  

;For Exist NODE example

; BFS(now-at a)(a)(now-at b)(b a)(now-at c)#t
; DFS(now-at a)(a)(now-at b)(b a)(now-at c)#t

;For Non-Exist NODE example

;BFS(now-at a)(a)(now-at b)(b a)(now-at c)(c b a)#f
;DFS(now-at a)(a)(now-at b)(b a)(now-at c)(c b a)#f

; BFS and DFS was visited same nodes in this test-cycle
; If we used diffrent test cases it may diffrent
; Since BFS uses Q and DFS uses Stack

; BFS first checks child s node I mean it goes horizontally then pass to the new node...
; DFS first checks all nodes then checks their childs...


;END
