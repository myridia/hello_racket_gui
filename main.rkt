#lang racket/gui

(define frame
  (new frame%
       [label "Hello Racket GUI"]
       [width 420]
       [height 220]
       [min-width 320]
       [min-height 180]))

(define panel
  (new vertical-panel%
       [parent frame]
       [alignment '(center center)]
       [border 20]))

(define message
  (new message%
       [parent panel]
       [label "Hello, world!"]
       [font (make-font #:size 18 #:weight 'bold)]))

(define quit-button
  (new button%
       [parent panel]
       [label "Quit"]
       [callback (lambda (button event) (exit 0))]))

(send frame show #t)
