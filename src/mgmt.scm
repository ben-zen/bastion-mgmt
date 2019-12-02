#! /usr/bin/guile -s
!#

;; Copyright (C) 2019 Ben Lewis <zenrider@blacklodgeresearch.org>
;; License information found in the LICENSE file.

(use-modules (ice-9 format))

(define mgmt-connect-help
  '("mgmt-connect"
    "Connect to a device on the management network."
    "Usage:"
   "  mgmt connect device-name [port]"
   "Parameters:"
   "device-name: The name of a device as listed by the show command"
   "port (Optional): The IP port with which to connect to the device,"
   "                 if not the default."))

(define (mgmt-help parameters)
  "Print help for this tool, or a specific function thereof."
  (write parameters)
  (newline)
  (if (nil? parameters)
      (display "Print this help message.")
      (let ((command (car parameters)))
        (cond
         ((string=? command "connect")
          (map (lambda (x) (display x) (newline)) mgmt-connect-help))
         (else (display "Unknown command."))))))

(define (get-current-user)
  "Get the current user's passwd entry as a vector."
  (getpwuid (geteuid)))

(define (get-current-user-name)
  "Get the current user's username as seen in the loaded passwd entry."
  (vector-ref (get-current-user) 0))

(define (mgmt-show parameters)
  "Lookup details about supported devices this user can access."
  (if (nil? parameters)
      (begin
        (display (format #f "Status of devices managed by ~a:" (get-current-user-name)))
        (newline))
      ))

(write (command-line))
(newline)
(let ((command (cadr (command-line))))
  (display command)
  (newline)
  (cond
   ((string=? command "connect")
    (display "Connect to a managed device, optionally with parameters.")
    (newline))
   ((string=? command "help")
    (mgmt-help (cddr (command-line)))
    (newline))
   ((string=? command "show")
    (mgmt-show (cddr (command-line))))))
