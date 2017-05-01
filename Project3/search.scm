;;; SEARCH.SCM  	    	  	  
;;; PROJECT 3  	    	  	  
	    	  	  
(define *search-debug* #t)         ; flag that shows search progress
  	    	  	  
;;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;;; Don't try to understand these parts of the code
;;; Start with the Garph Abstarction part
;;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
(require racket/unsafe/ops)  	    	  	  
  	    	  	  
  (define (set-car! p x)  	    	  	  
    (if (pair? p)  	    	  	  
        (unsafe-set-mcar! p x)  	    	  	  
        (raise-type-error 'set-car! "pair" p)))
  	    	  	  
  (define (set-cdr! p x)  	    	  	  
    (if (pair? p)  	    	  	  
        (unsafe-set-mcdr! p x)  	    	  	  
        (raise-type-error 'set-cdr! "pair" p)))
  	    	  	  
(define (append! a b)  	    	  	  
  (if (null? (cdr a))  	    	  	  
      (set-cdr! a b)  	    	  	  
      (append! (cdr a) b)))  	    	  	  
  	    	  	  
;;;------------------------------------------------------------
;;; Graph Abstraction  	    	  	  
;;;  	    	  	  
;;;   Graph                     a collection of Graph-Elements
;;;   Graph-Element               a node, outgoing children from the
;;;                               node, and contents for the node
;;;   Node = symbol             a symbol label or name for the node
;;;   Contents = anytype        the contents for the node
  	    	  	  
;;---------------  	    	  	  
;; Graph-Element  	    	  	  
  	    	  	  
; make-graph-element: Node,list<Node>,Contents -> Element
(define (make-graph-element node children contents)
  (list 'graph-element node children contents))
  	    	  	  
(define (graph-element? element)            ; anytype -> boolean
  (and (pair? element) (eq? 'graph-element (car element))))
  	    	  	  
; Get the node (the name) from the Graph-Element
(define (graph-element->node element)       ; Graph-Element -> Node
  (if (not (graph-element? element))
      (error "object not element: " element)
      (first (cdr element))))  	    	  	  
  	    	  	  
; Get the children (a list of outgoing node names)
; from the Graph-Element  	    	  	  
(define (graph-element->children element)   ; Graph-Element -> list<Node>
  (if (not (graph-element? element))
      (error "object not element: " element)
      (second (cdr element))))  	    	  	  
  	    	  	  
; Get the contents from the Graph-Element
(define (graph-element->contents element)   ; Graph-Element -> Contents
  (if (not (graph-element? element))
      (error "object not element: " element)
      (third (cdr element))))  	    	  	  
  	    	  	  
;;---------------  	    	  	  
;; Graph  	    	  	  
  	    	  	  
(define (make-graph elements)            ; list<Element> -> Graph
  (cons 'graph elements))  	    	  	  
  	    	  	  
(define (graph? graph)                  ; anytype -> boolean
  (and (pair? graph) (eq? 'graph (car graph))))
  	    	  	  
(define (graph-elements graph)           ; Graph -> list<Graph-Element>
  (if (not (graph? graph))  	    	  	  
      (error "object not a graph: " graph)
      (cdr graph)))  	    	  	  
  	    	  	  
(define (graph-root graph)		; Graph -> Node|null
  (let ((elements (graph-elements graph)))
    (if (null? elements)  	    	  	  
	#f  	    	  	  
	(graph-element->node (car elements)))))
  	    	  	  
; Find the specified node in the graph
(define (find-graph-element graph node)   ; Graph,Node -> Graph-Element|null
  (define (find elements)  	    	  	  
    (cond ((null? elements) '())
          ((eq? (graph-element->node (car elements)) node)
           (car elements))  	    	  	  
          (else (find (cdr elements)))))
  (find (graph-elements graph)))
  	    	  	  
; Find the children of the specified node in the graph
(define (find-node-children graph node)        ; Graph,Node -> list<Node>|null
  (let ((element (find-graph-element graph node)))
    (if (not (null? element))  	    	  	  
        (graph-element->children element)
        '())))  	    	  	  
  	    	  	  
; Find the contents of the specified node in the graph
(define (find-node-contents graph node)         ; Graph,Node -> Contents|null
  (let ((element (find-graph-element graph node)))
    (if (not (null? element))  	    	  	  
        (graph-element->contents element)
        '())))  	    	  	  
  	    	  	  
;; Testing...  	    	  	  
  	    	  	  
(define test-graph  	    	  	  
  (make-graph (list  	    	  	  
   (make-graph-element 'a '(b i m) '(some words))
   (make-graph-element 'b '(c d e h) '(more words))
   (make-graph-element 'c '() '(at c node some words))
   (make-graph-element 'd '() '())
   (make-graph-element 'e '(f g) '(and even more words))
   (make-graph-element 'f '() '())
   (make-graph-element 'g '() '())
   (make-graph-element 'h '() '())
   (make-graph-element 'i '(j k l) '(more words yet))
   (make-graph-element 'j '() '())
   (make-graph-element 'k '() '())
   (make-graph-element 'l '() '()))))
  	    	  	  
(define test-cycle  	    	  	  
  (make-graph (list  	    	  	  
   (make-graph-element 'a '(b c) '(words for node a))
   (make-graph-element 'b '(c) '(words for node b))
   (make-graph-element 'c '(a) '(words for node c)))))
	    	  	  
 (find-graph-element test-graph 'b)
 (find-graph-element test-graph 'z)
 (find-node-children test-graph 'b)
 (find-node-children test-graph 'z)
 (find-node-contents test-graph 'b)
 (find-node-contents test-graph 'z)
  	    	  	  
  	    	  	  
;;;------------------------------------------------------------
;;; Searching a network  	    	  	  
;;;  	    	  	  
;;; We define below a standard search procedure that walks
;;; over a graph in an effort to find a desired node.
;;; This version does not handle cycles in the graph
  	    	  	  
;; search: Node, (Node->Boolean), (Graph, Node -> List<Node>)
;;         (List<Node>, List<Node> -> List<Node>), Graph
;;           --> Boolean  	    	  	  
  	    	  	  
(define (search initial-state goal? successors merge graph)
  ;; initial-state is the start state of the search
  ;;  	    	  	  
  ;; goal? is the predicate that determines whether we have
  ;; reached the goal  	    	  	  
  ;;  	    	  	  
  ;; successors computes from the current state all successor states
  ;;  	    	  	  
  ;; merge combines new states with the set of states still to explore
  (define (search-inner still-to-do)
    (if (null? still-to-do)  	    	  	  
	#f  	    	  	  
	(let ((current (car still-to-do)))
	  (if *search-debug*  	    	  	  
	      (write (list 'now-at current)))
	  (if (goal? current)  	    	  	  
	      #t  	    	  	  
	      (search-inner  	    	  	  
	       (merge (successors graph current) (cdr still-to-do)))))))
  (search-inner (list initial-state)))
  	    	  	  
(define (DFS-simple start goal? graph)
  (search start  	    	  	  
	  goal?  	    	  	  
	  find-node-children  	    	  	  
	  (lambda (new old) (append new old))
	  graph))  	    	  	  
  	    	  	  
;;;------------------------------------------------------------
;;; Index Abstraction  	    	  	  
;;;  	    	  	  
;;;   An Index enables us to associate values with keys, and
;;; to retrieve those values later on given the key.
;;;  	    	  	  
;;; Key = symbol  	    	  	  
;;; Val = symbol  	    	  	  
  	    	  	  
;; Index Implementation  	    	  	  
;;  	    	  	  
;;   An Index will be a tagged data object that holds a
;; list of Index-Entries.  Each Index-Entry associates
;; a key with a list of values for that key, i.e.
;;   Index = Pair<Index-Tag, list<Index-Entry>>
;;   Index-Entry = list<Key, list<Val>>
;;  	    	  	  
  	    	  	  
(define (make-index)            ; void -> Index
  (list 'index))  	    	  	  
  	    	  	  
(define (index? index)          ; antype -> boolean
  (and (pair? index) (eq? 'index (car index))))
  	    	  	  
; An index can be reset to empty.
(define (reset-index! index)    ; Index -> Index
  (cond ((not (index? index))  	    	  	  
         (error "object not an index: " index))
        (else (set-cdr! index '())
              index)))  	    	  	  
  	    	  	  
; This is an internal helper procedure not to
; be used externally.  	    	  	  
(define (find-entry-in-index index key)
  (if (not (index? index))  	    	  	  
      (error "object not an index: " index)
      (let ((entry (assv key (cdr index))))
        (if entry entry '()))))
  	    	  	  
  	    	  	  
; returns a list of values associated with key
(define (find-in-index index key)       ; Index,Key -> list<Val>
  (let ((index-entry (find-entry-in-index index key)))
    (if (not (null? index-entry))
        (cadr index-entry)  	    	  	  
        '())))  	    	  	  
  	    	  	  
