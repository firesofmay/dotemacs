;;; clojure.el

(use-package clojure-mode
  :defer 10
  :straight t
  :blackout "CLJ"
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.cljc\\'" . clojure-mode)
         ("\\.cljs\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode))
  :hook ((clojure-mode . subword-mode)
         (clojure-mode . smartparens-strict-mode)
         (clojure-mode . rainbow-delimiters-mode)
         (clojure-mode . eldoc-mode))
  :config
  (setq clojure-indent-style 'always-indent))


(use-package cider
  :straight t
  :after clojure-mode
  :blackout t
  :bind
  (("C-c C-l" . cider-repl-clear-buffer))
  :config
  (setq nrepl-log-messages t
        cider-repl-display-in-current-window t
        cider-repl-pop-to-buffer-on-connect nil
        cider-repl-use-clojure-font-lock t
        cider-repl-use-content-types t
        cider-save-file-on-load t
        cider-prompt-for-symbol nil
        cider-font-lock-dynamically '(macro core var)
        nrepl-hide-special-buffers t
        cider-repl-buffer-size-limit 100000
        cider-overlays-use-font-lock t
        cider-dynamic-indentation nil
        cider-repl-display-help-banner nil
        cider-repl-prompt-function #'cider-repl-prompt-abbreviated
        cider-format-code-options '(("indents" ((".*" (("inner" 0)))))))
  (cider-repl-toggle-pretty-printing)
  :hook
  (cider-repl-mode . smartparens-strict-mode)
  (cider-repl-mode . company-mode)
  (cider-repl-mode . cider-company-enable-fuzzy-completion)
  (cider-mode . cider-company-enable-fuzzy-completion))


(use-package apheleia
  :straight t
  :after prog-mode
  :ensure-system-package cljstyle
  :config
  (setf (alist-get 'cljstyle apheleia-formatters)
        '("cljstyle" "pipe"))
  (add-to-list 'apheleia-mode-alist '(clojure-mode . cljstyle))
  (apheleia-global-mode t))
