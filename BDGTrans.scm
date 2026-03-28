; BDGTrans.scm - GIMP Script-Fu Extension for AI Translation
; Translates text layers using a local AI model
; Repository: https://github.com/bdmurphy73/BDGTrans

(define (bdgtrans-get-config)
  (let ((config-file (string-append (gimp-directory) "/BTGTrans.json")))
    (if (file-exists? config-file)
        (let* ((fd (car (file-open config-file "r")))
               (content ""))
          (while (not (eof fd))
            (set! content (string-append content (car (read-line fd)))))
          (close-input-port fd)
          (car (vector->list (string->scm content))))
        (begin
          (list (cons "server" "http://localhost:11434")
                (cons "model" "llama3"))))))

(define (bdgtrans-save-config config)
  (let ((config-file (string-append (gimp-directory) "/BTGTrans.json")))
    (let ((fd (car (file-open config-file "w"))))
      (display "{\n" fd)
      (display "  \"server\": \"" fd)
      (display (cdr (assoc "server" config)) fd)
      (display "\",\n" fd)
      (display "  \"model\": \"" fd)
      (display (cdr (assoc "model" config)) fd)
      (display "\"\n}" fd)
      (close-output-port fd))))

(define (bdgtrans-test-connection server model)
  (let* ((cmd (string-append "curl -s -X POST " server "/api/generate "
                             "-d '{\"model\": \"" model "\", "
                             "\"prompt\": \"test\", "
                             "\"stream\": false}'"))
         (result (car (system cmd))))
    (if (= result 0) #t #f)))

(define (bdgtrans-translate-text text target-lang server model)
  (let* ((prompt (string-append 
                   "You are a professional translator. Translate the following English text to " 
                   target-lang 
                   ". Preserve the intent and meaning of the message rather than doing a literal word-for-word translation. "
                   "Output ONLY the translated text, nothing else.\n\nText: " 
                   text))
         (escaped-prompt (string-replace prompt "'" "'\\''"))
         (cmd (string-append "curl -s -X POST " server "/api/generate "
                            "-d '{\"model\": \"" model "\", "
                            "\"prompt\": \"" escaped-prompt "\", "
                            "\"stream\": false}'"))
         (response (car (system-to-string cmd)))
         (parsed (car (list-ref (string->scm response) 0)))
         (translated (cdr (assoc "response" parsed))))
    translated))

(define (string-replace str old new)
  (let ((result ""))
    (let loop ((i 0))
      (if (< i (string-length str))
          (begin
            (if (string=? (substring str i (+ i (string-length old))) old)
                (begin
                  (set! result (string-append result new))
                  (loop (+ i (string-length old))))
                (begin
                  (set! result (string-append result (substring str i (+ i 1))))
                  (loop (+ i 1))))
          result))))

(define (system-to-string cmd)
  (let* ((temp-file (string-append (gimp-temp-name) ".txt"))
         (full-cmd (string-append cmd " > " temp-file)))
    (system full-cmd)
    (let* ((fd (car (file-open temp-file "r")))
           (content ""))
      (while (not (eof fd))
        (set! content (string-append content (car (read-line fd)))))
      (close-input-port fd)
      (delete-file temp-file)
      (list content))))

(define (bdgtrans-translate layer target-lang)
  (let* ((img (car (gimp-item-get-image layer)))
         (text (car (gimp-text-layer-get-text layer)))
         (name (car (gimp-item-get-name layer)))
         (font (car (gimp-text-layer-get-font layer)))
         (font-size (car (gimp-text-layer-get-font-size layer)))
         (config (bdgtrans-get-config))
         (server (cdr (assoc "server" config)))
         (model (cdr (assoc "model" config)))
         (translated-text ""))
    
    (gimp-message "Translating text...")
    
    (set! translated-text (bdgtrans-translate-text text target-lang server model))
    
    (let ((new-layer (car (gimp-layer-copy layer TRUE))))
      (gimp-image-add-layer img new-layer -1)
      (gimp-text-layer-set-text new-layer translated-text)
      (gimp-item-set-name new-layer (string-append name " (" target-lang ")"))
      (gimp-item-set-visible layer FALSE)
      (gimp-item-set-visible new-layer TRUE)
      (gimp-displays-flush))))

(define (bdgtrans-translate-dialog image layer)
  (let* ((config (bdgtrans-get-config))
         (server (cdr (assoc "server" config)))
         (model (cdr (assoc "model" config)))
         (langs '("Spanish" "German" "Russian" "French" "Chinese"))
         (result (gimp-combo-box-entry-new-text 0))
         (temp-image (car (gimp-image-new 100 100 RGB)))
         (text-var ""))
    
    (define (run-dialog)
      (let ((dialog (car (gimp-dialog-new "BDGTrans - Translate Text" "bdgtrans" 
                                           (quote 0) (quote 0) 1
                                           (list "server" "http://localhost:11434")
                                           (list "model" "llama3")
                                           (list "Spanish" "German" "Russian" "French" "Chinese")
                                           (list "OK" "Cancel")))))
        (gimp-widget-show dialog)
        dialog))
    
    (gimp-message "Please use Filters > BDGTrans > Translate Text to translate")))

(script-fu-register
 "bdgtrans-translate"
 "Translate Text (BDGTrans)"
 "Translates a text layer using a local AI model"
 "BDGTrans"
 "Copyright 2024"
 "2024"
 "RGB*, GRAY*"
 SF-IMAGE      "Image" 0
 SF-DRAWABLE   "Layer" 0
 SF-OPTION     "Target Language" '("Spanish" "German" "Russian" "French" "Chinese"))

(script-fu-menu-register "bdgtrans-translate" "<Image>/Filters/BDGTrans")

(script-fu-register
 "bdgtrans-configure"
 "Configure BDGTrans"
 "Configure the AI server and model settings"
 "BDGTrans"
 "Copyright 2024"
 "2024"
 "")

(script-fu-menu-register "bdgtrans-configure" "<Image>/Filters/BDGTrans")

(define (bdgtrans-run-config)
  (let* ((config (bdgtrans-get-config))
         (server (cdr (assoc "server" config)))
         (model (cdr (assoc "model" config)))
         (new-server server)
         (new-model model))
    
    (set! new-server (car (gimp-input-dialog "BDGTrans Configuration" 
                                              "Enter AI Server URL:" 
                                              server)))
    (set! new-model (car (gimp-input-dialog "BDGTrans Configuration"
                                             "Enter Model Name:"
                                             model)))
    
    (if (bdgtrans-test-connection new-server new-model)
        (begin
          (bdgtrans-save-config (list (cons "server" new-server)
                                      (cons "model" new-model)))
          (gimp-message "BDGTrans configured successfully!"))
        (gimp-message "Could not connect to AI server. Please check settings."))))

(define (gimp-input-dialog title prompt default)
  (list default))
