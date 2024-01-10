<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<!-- 2024-01-10 Wed 22:59 -->
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Levisa's Emacs Config</title>
<meta name="author" content="Levisa Vanya" />
<meta name="generator" content="Org Mode" />
<style>
  #content { max-width: 60em; margin: auto; }
  .title  { text-align: center;
             margin-bottom: .2em; }
  .subtitle { text-align: center;
              font-size: medium;
              font-weight: bold;
              margin-top:0; }
  .todo   { font-family: monospace; color: red; }
  .done   { font-family: monospace; color: green; }
  .priority { font-family: monospace; color: orange; }
  .tag    { background-color: #eee; font-family: monospace;
            padding: 2px; font-size: 80%; font-weight: normal; }
  .timestamp { color: #bebebe; }
  .timestamp-kwd { color: #5f9ea0; }
  .org-right  { margin-left: auto; margin-right: 0px;  text-align: right; }
  .org-left   { margin-left: 0px;  margin-right: auto; text-align: left; }
  .org-center { margin-left: auto; margin-right: auto; text-align: center; }
  .underline { text-decoration: underline; }
  #postamble p, #preamble p { font-size: 90%; margin: .2em; }
  p.verse { margin-left: 3%; }
  pre {
    border: 1px solid #e6e6e6;
    border-radius: 3px;
    background-color: #f2f2f2;
    padding: 8pt;
    font-family: monospace;
    overflow: auto;
    margin: 1.2em;
  }
  pre.src {
    position: relative;
    overflow: auto;
  }
  pre.src:before {
    display: none;
    position: absolute;
    top: -8px;
    right: 12px;
    padding: 3px;
    color: #555;
    background-color: #f2f2f299;
  }
  pre.src:hover:before { display: inline; margin-top: 14px;}
  /* Languages per Org manual */
  pre.src-asymptote:before { content: 'Asymptote'; }
  pre.src-awk:before { content: 'Awk'; }
  pre.src-authinfo::before { content: 'Authinfo'; }
  pre.src-C:before { content: 'C'; }
  /* pre.src-C++ doesn't work in CSS */
  pre.src-clojure:before { content: 'Clojure'; }
  pre.src-css:before { content: 'CSS'; }
  pre.src-D:before { content: 'D'; }
  pre.src-ditaa:before { content: 'ditaa'; }
  pre.src-dot:before { content: 'Graphviz'; }
  pre.src-calc:before { content: 'Emacs Calc'; }
  pre.src-emacs-lisp:before { content: 'Emacs Lisp'; }
  pre.src-fortran:before { content: 'Fortran'; }
  pre.src-gnuplot:before { content: 'gnuplot'; }
  pre.src-haskell:before { content: 'Haskell'; }
  pre.src-hledger:before { content: 'hledger'; }
  pre.src-java:before { content: 'Java'; }
  pre.src-js:before { content: 'Javascript'; }
  pre.src-latex:before { content: 'LaTeX'; }
  pre.src-ledger:before { content: 'Ledger'; }
  pre.src-lisp:before { content: 'Lisp'; }
  pre.src-lilypond:before { content: 'Lilypond'; }
  pre.src-lua:before { content: 'Lua'; }
  pre.src-matlab:before { content: 'MATLAB'; }
  pre.src-mscgen:before { content: 'Mscgen'; }
  pre.src-ocaml:before { content: 'Objective Caml'; }
  pre.src-octave:before { content: 'Octave'; }
  pre.src-org:before { content: 'Org mode'; }
  pre.src-oz:before { content: 'OZ'; }
  pre.src-plantuml:before { content: 'Plantuml'; }
  pre.src-processing:before { content: 'Processing.js'; }
  pre.src-python:before { content: 'Python'; }
  pre.src-R:before { content: 'R'; }
  pre.src-ruby:before { content: 'Ruby'; }
  pre.src-sass:before { content: 'Sass'; }
  pre.src-scheme:before { content: 'Scheme'; }
  pre.src-screen:before { content: 'Gnu Screen'; }
  pre.src-sed:before { content: 'Sed'; }
  pre.src-sh:before { content: 'shell'; }
  pre.src-sql:before { content: 'SQL'; }
  pre.src-sqlite:before { content: 'SQLite'; }
  /* additional languages in org.el's org-babel-load-languages alist */
  pre.src-forth:before { content: 'Forth'; }
  pre.src-io:before { content: 'IO'; }
  pre.src-J:before { content: 'J'; }
  pre.src-makefile:before { content: 'Makefile'; }
  pre.src-maxima:before { content: 'Maxima'; }
  pre.src-perl:before { content: 'Perl'; }
  pre.src-picolisp:before { content: 'Pico Lisp'; }
  pre.src-scala:before { content: 'Scala'; }
  pre.src-shell:before { content: 'Shell Script'; }
  pre.src-ebnf2ps:before { content: 'ebfn2ps'; }
  /* additional language identifiers per "defun org-babel-execute"
       in ob-*.el */
  pre.src-cpp:before  { content: 'C++'; }
  pre.src-abc:before  { content: 'ABC'; }
  pre.src-coq:before  { content: 'Coq'; }
  pre.src-groovy:before  { content: 'Groovy'; }
  /* additional language identifiers from org-babel-shell-names in
     ob-shell.el: ob-shell is the only babel language using a lambda to put
     the execution function name together. */
  pre.src-bash:before  { content: 'bash'; }
  pre.src-csh:before  { content: 'csh'; }
  pre.src-ash:before  { content: 'ash'; }
  pre.src-dash:before  { content: 'dash'; }
  pre.src-ksh:before  { content: 'ksh'; }
  pre.src-mksh:before  { content: 'mksh'; }
  pre.src-posh:before  { content: 'posh'; }
  /* Additional Emacs modes also supported by the LaTeX listings package */
  pre.src-ada:before { content: 'Ada'; }
  pre.src-asm:before { content: 'Assembler'; }
  pre.src-caml:before { content: 'Caml'; }
  pre.src-delphi:before { content: 'Delphi'; }
  pre.src-html:before { content: 'HTML'; }
  pre.src-idl:before { content: 'IDL'; }
  pre.src-mercury:before { content: 'Mercury'; }
  pre.src-metapost:before { content: 'MetaPost'; }
  pre.src-modula-2:before { content: 'Modula-2'; }
  pre.src-pascal:before { content: 'Pascal'; }
  pre.src-ps:before { content: 'PostScript'; }
  pre.src-prolog:before { content: 'Prolog'; }
  pre.src-simula:before { content: 'Simula'; }
  pre.src-tcl:before { content: 'tcl'; }
  pre.src-tex:before { content: 'TeX'; }
  pre.src-plain-tex:before { content: 'Plain TeX'; }
  pre.src-verilog:before { content: 'Verilog'; }
  pre.src-vhdl:before { content: 'VHDL'; }
  pre.src-xml:before { content: 'XML'; }
  pre.src-nxml:before { content: 'XML'; }
  /* add a generic configuration mode; LaTeX export needs an additional
     (add-to-list 'org-latex-listings-langs '(conf " ")) in .emacs */
  pre.src-conf:before { content: 'Configuration File'; }

  table { border-collapse:collapse; }
  caption.t-above { caption-side: top; }
  caption.t-bottom { caption-side: bottom; }
  td, th { vertical-align:top;  }
  th.org-right  { text-align: center;  }
  th.org-left   { text-align: center;   }
  th.org-center { text-align: center; }
  td.org-right  { text-align: right;  }
  td.org-left   { text-align: left;   }
  td.org-center { text-align: center; }
  dt { font-weight: bold; }
  .footpara { display: inline; }
  .footdef  { margin-bottom: 1em; }
  .figure { padding: 1em; }
  .figure p { text-align: center; }
  .equation-container {
    display: table;
    text-align: center;
    width: 100%;
  }
  .equation {
    vertical-align: middle;
  }
  .equation-label {
    display: table-cell;
    text-align: right;
    vertical-align: middle;
  }
  .inlinetask {
    padding: 10px;
    border: 2px solid gray;
    margin: 10px;
    background: #ffffcc;
  }
  #org-div-home-and-up
   { text-align: right; font-size: 70%; white-space: nowrap; }
  textarea { overflow-x: auto; }
  .linenr { font-size: smaller }
  .code-highlighted { background-color: #ffff00; }
  .org-info-js_info-navigation { border-style: none; }
  #org-info-js_console-label
    { font-size: 10px; font-weight: bold; white-space: nowrap; }
  .org-info-js_search-highlight
    { background-color: #ffff00; color: #000000; font-weight: bold; }
  .org-svg { }
</style>
</head>
<body>
<div id="content" class="content">
<h1 class="title">Levisa's Emacs Config</h1>
<div id="table-of-contents" role="doc-toc">
<h2>Table of Contents</h2>
<div id="text-table-of-contents" role="doc-toc">
<ul>
<li><a href="#org4a1c231">PROGRAM TO LOAD</a>
<ul>
<li><a href="#orgd354f71">Elpaca Package Manager</a></li>
<li><a href="#org561bf66">Load Evil Mode</a></li>
</ul>
</li>
<li><a href="#org9a09ca8">General Keybindings</a></li>
<li><a href="#orga637c44">ALL THE ICONS</a></li>
<li><a href="#org4eaab38">BUFFER-MOVE</a></li>
<li><a href="#org682f73e">FONTS</a>
<ul>
<li><a href="#org387313b">Setting The Font Face</a></li>
<li><a href="#orgbf80149">Zooming In/OuT</a></li>
</ul>
</li>
<li><a href="#org5539f80">GRAPHICAL USER INTERFACE AND FEATURE TWEAKS</a>
<ul>
<li><a href="#orga651ef9">Disable Startup Message</a></li>
<li><a href="#org7873ab3">Enable Visible Bell</a></li>
<li><a href="#org9f39708">Disable Menubar, Toolbars and Scroolbars</a></li>
<li><a href="#org1535ae4">Display Line Numbers and Truncated Lines</a></li>
<li><a href="#orgb7b6430">Tab Size</a></li>
<li><a href="#org6703df0">Make ESC Quit Prompts</a></li>
<li><a href="#org7a96194">Disable Backup File</a></li>
<li><a href="#org0a5a7fe">Disable Auto Indent</a></li>
<li><a href="#org6738531">Auto-Closing Pairs</a></li>
<li><a href="#org5a478ba">Disable Auto-Save</a></li>
<li><a href="#orgecf6ec8">Disable Column Number Mode</a></li>
<li><a href="#orgfeff222">Disable Line Number Mode</a></li>
</ul>
</li>
<li><a href="#org7cee75b">LSP SUPPORT</a>
<ul>
<li><a href="#orgc596b7a">LSP INSTALL</a></li>
<li><a href="#org8b4d733">COMPANY MODE</a></li>
<li><a href="#org61ebcb6">MINIMAL SETUP</a></li>
<li><a href="#org3015e9e">SETUP LSP</a></li>
</ul>
</li>
<li><a href="#org9b2df84">ORG MODE</a>
<ul>
<li><a href="#orgee57788">Enabling Table of Contents</a></li>
<li><a href="#org5f8d2e4">Enabling Org Bullets</a></li>
<li><a href="#org4abffd4">Disable Electric Indent</a></li>
<li><a href="#orge86e372">Source Code Block Tag Expansion</a></li>
<li><a href="#orgd1e01db">Diminish Org Indent Mode</a></li>
<li><a href="#org4889053">Org Level Headers</a></li>
</ul>
</li>
<li><a href="#org98db42b">THEME</a>
<ul>
<li><a href="#orgb5eaafd">DOOM-THEMES</a></li>
<li><a href="#orgbcd3b34">DOOM-MODELINE</a></li>
</ul>
</li>
<li><a href="#org1673819">WHICH-KEY</a></li>
<li><a href="#org2458f64">RELOAD EMACS</a></li>
<li><a href="#org529601d">DIMINISH</a></li>
<li><a href="#org70a80f6">MINIBUFFER ESCAPE</a></li>
<li><a href="#org847c9b4">NEOTREE</a></li>
</ul>
</div>
</div>

<div id="outline-container-org4a1c231" class="outline-2">
<h2 id="org4a1c231">PROGRAM TO LOAD</h2>
<div class="outline-text-2" id="text-org4a1c231">
</div>
<div id="outline-container-orgd354f71" class="outline-3">
<h3 id="orgd354f71">Elpaca Package Manager</h3>
<div class="outline-text-3" id="text-orgd354f71">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(defvar elpaca-installer-version 0.6)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
              :ref nil
              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
   (build (expand-file-name "elpaca/" elpaca-builds-directory))
   (order (cdr elpaca-order))
   (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
(make-directory repo t)
(when (&lt; emacs-major-version 28) (require 'subr-x))
(condition-case-unless-debug err
    (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
         ((zerop (call-process "git" nil buffer t "clone"
                   (plist-get order :repo) repo)))
         ((zerop (call-process "git" nil buffer t "checkout"
                   (or (plist-get order :ref) "--"))))
         (emacs (concat invocation-directory invocation-name))
         ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                   "--eval" "(byte-recompile-directory \".\" 0 'force)")))
         ((require 'elpaca))
         ((elpaca-generate-autoloads "elpaca" repo)))
    (progn (message "%s" (buffer-string)) (kill-buffer buffer))
      (error "%s" (with-current-buffer buffer (buffer-string))))
  ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
(require 'elpaca)
(elpaca-generate-autoloads "elpaca" repo)
(load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))
</pre>
</div>
</div>
</div>

<div id="outline-container-org561bf66" class="outline-3">
<h3 id="org561bf66">Load Evil Mode</h3>
<div class="outline-text-3" id="text-org561bf66">
<div class="org-src-container">
<pre class="src src-emacs-lisp">  ;; Install use-package support
  (elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

  ;; Block until current queue processed.
  (elpaca-wait)

  ;;When installing a package which modifies a form used at the top-level
  ;;(e.g. a package which adds a use-package key word),
  ;;use `elpaca-wait' to block until that package has been installed/configured.
  ;;For example:
  ;;(use-package general :demand t)
  ;;(elpaca-wait)

  ;; Expands to: (elpaca evil (use-package evil :demand t))
  (use-package evil
      :init
      (setq evil-want-integration t)
      (setq evil-want-keybinding nil)
      (setq evil-vsplit-window-right t)
      (setq evil-split-window-below t)
      (setq evil-want-C-u-scroll t)
      (evil-mode))
     (use-package evil-collection
       :after evil
       :config
       (setq evil-collection-mode-list '(dashboard dired ibuffer))
       (evil-collection-init))
     (use-package evil-tutor)
  ;;(with-eval-after-load 'evil-maps
  ;; (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop))  
  ;;Turns off elpaca-use-package-mode current declaration
  ;;Note this will cause the declaration to be interpreted immediately (not deferred).
  ;;Useful for configuring built-in emacs features.
;; Using RETURN to follow links in Org/Evil 
;; Unmap keys in 'evil-maps if not done, (setq org-return-follows-link t) will not work
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))
;; Setting RETURN key in org-mode to follow links
  (setq org-return-follows-link  t)
  (use-package emacs :elpaca nil :config (setq ring-bell-function #'ignore))

  ;; Don't install anything. Defer execution of BODY
  ;;(elpaca nil (message "deferred"))
</pre>
</div>
</div>
</div>
</div>


<div id="outline-container-org9a09ca8" class="outline-2">
<h2 id="org9a09ca8">General Keybindings</h2>
<div class="outline-text-2" id="text-org9a09ca8">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(use-package general
 :config
 (general-evil-setup)
 ;; set up 'SPC' as the global leader key

 (general-create-definer Levisa/leader-keys
   :states '(normal insert visual emacs)
   :keymaps 'override
   :prefix "SPC" ;; set leader
   :global-prefix "M-SPC") ;; access leader insert mode

  (Levisa/leader-keys     
   "." '(find-file :wk "Find file")
   "f c" '((lambda () (interactive) (find-file "C:/Users/Moderator/.emacs.d/config.org")) :wk "Edit emacs config")
   "TAB TAB" '(comment-line :wk "Comment lines")
   "u" '(universal-argument :wk "Universal argument"))

  (Levisa/leader-keys
   "b" '(:ignore t :wk "buffer")
   "b b" '(switch-to-buffer :wk "Switch buffer")
   "b i" '(ibuffer :wk "Ibuffer")
   "b k" '(kill-this-buffer :wk "Kill this buffer")
   "b n" '(next-buffer :wk "Next buffer")
   "b p" '(previous-buffer :wk "Previous buffer")
   "b r" '(revert-buffer :wk "Reload buffer"))

  (Levisa/leader-keys
   "e" '(:ignore t :wk "Evaluate")    
   "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
   "e d" '(eval-defun :wk "Evaluate defun containing or after point")
   "e e" '(eval-expression :wk "Evaluate and elisp expression")
   "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
   "e r" '(eval-region :wk "Evaluate elisp in region")) 

  (Levisa/leader-keys
   "h" '(:ignore t :wk "Help")
   "h f" '(describe-function :wk "Describe function")
   "h v" '(describe-variable :wk "Describe variable")
   ;;"h r r" '((lambda () (interactive) (load-file "C:/Users/Moderator/.emacs.d/init.el")) :wk "Reload emacs config"))
   "h r r" '(reload-init-file :wk "Reload emacs config"))

  (Levisa/leader-keys
   "t" '(:ignore t :wk "Toggle")
   "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
   "t t" '(visual-line-mode :wk "Toggle truncated lines")
   "t n" '(neotree-toggle :wk "Toggle neotree file viewer")
   "t o" '(org-mode :wk "Toggle org mode"))

  (Levisa/leader-keys
   "w" '(:ignore t :wk "Windows")
   ;; Window splits
   "w c" '(evil-window-delete :wk "Close window")
   "w n" '(evil-window-new :wk "New window")
   "w s" '(evil-window-split :wk "Horizontal split window")
   "w v" '(evil-window-vsplit :wk "Vertical split window"))

  ;; Window motions
  (Levisa/leader-keys
   "w h" '(evil-window-left :wk "Window left")
   "w j" '(evil-window-down :wk "Window down")
   "w k" '(evil-window-up :wk "Window up")
   "w l" '(evil-window-right :wk "Window right")
   "w w" '(evil-window-next :wk "Goto next window"))

  ;; Move Windows
  (Levisa/leader-keys
   "w H" '(buf-move-left :wk "Buffer move left")
   "w J" '(buf-move-down :wk "Buffer move down")
   "w K" '(buf-move-up :wk "Buffer move up")
   "w L" '(buf-move-right :wk "Buffer move right"))

)
</pre>
</div>
</div>
</div>
<div id="outline-container-orga637c44" class="outline-2">
<h2 id="orga637c44">ALL THE ICONS</h2>
<div class="outline-text-2" id="text-orga637c44">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))
</pre>
</div>
</div>
</div>
<div id="outline-container-org4eaab38" class="outline-2">
<h2 id="org4eaab38">BUFFER-MOVE</h2>
<div class="outline-text-2" id="text-org4eaab38">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(require 'windmove)

;;;###autoload
(defun buf-move-up ()
  "Swap the current buffer and the buffer above the split.
If there is no split, ie now window above the current one, an
error is signaled."
;;  "Switches between the current buffer, and the buffer above the
;;  split, if possible."
  (interactive)
  (let* ((other-win (windmove-find-other-window 'up))
     (buf-this-buf (window-buffer (selected-window))))
    (if (null other-win)
        (error "No window above this one")
      ;; swap top with this one
      (set-window-buffer (selected-window) (window-buffer other-win))
      ;; move this one to top
      (set-window-buffer other-win buf-this-buf)
      (select-window other-win))))

;;;###autoload
(defun buf-move-down ()
"Swap the current buffer and the buffer under the split.
If there is no split, ie now window under the current one, an
error is signaled."
  (interactive)
  (let* ((other-win (windmove-find-other-window 'down))
     (buf-this-buf (window-buffer (selected-window))))
    (if (or (null other-win) 
            (string-match "^ \\*Minibuf" (buffer-name (window-buffer other-win))))
        (error "No window under this one")
      ;; swap top with this one
      (set-window-buffer (selected-window) (window-buffer other-win))
      ;; move this one to top
      (set-window-buffer other-win buf-this-buf)
      (select-window other-win))))

;;;###autoload
(defun buf-move-left ()
"Swap the current buffer and the buffer on the left of the split.
If there is no split, ie now window on the left of the current
one, an error is signaled."
  (interactive)
  (let* ((other-win (windmove-find-other-window 'left))
     (buf-this-buf (window-buffer (selected-window))))
    (if (null other-win)
        (error "No left split")
      ;; swap top with this one
      (set-window-buffer (selected-window) (window-buffer other-win))
      ;; move this one to top
      (set-window-buffer other-win buf-this-buf)
      (select-window other-win))))

;;;###autoload
(defun buf-move-right ()
"Swap the current buffer and the buffer on the right of the split.
If there is no split, ie now window on the right of the current
one, an error is signaled."
  (interactive)
  (let* ((other-win (windmove-find-other-window 'right))
     (buf-this-buf (window-buffer (selected-window))))
    (if (null other-win)
        (error "No right split")
      ;; swap top with this one
      (set-window-buffer (selected-window) (window-buffer other-win))
      ;; move this one to top
      (set-window-buffer other-win buf-this-buf)
      (select-window other-win))))
</pre>
</div>
</div>
</div>
<div id="outline-container-org682f73e" class="outline-2">
<h2 id="org682f73e">FONTS</h2>
<div class="outline-text-2" id="text-org682f73e">
</div>
<div id="outline-container-org387313b" class="outline-3">
<h3 id="org387313b">Setting The Font Face</h3>
<div class="outline-text-3" id="text-org387313b">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(set-face-attribute 'default nil
  :font "CaskaydiaCove NF"
  :height 110
  :weight 'regular)
(set-face-attribute 'fixed-pitch nil
  :font "CaskaydiaCove NF"
  :height 110
  :weight 'regular)
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)
(add-to-list 'default-frame-alist '(font . "CaskaydiaCove NF-13"))
(setq-default line-spacing 0.12)
</pre>
</div>
</div>
</div>
<div id="outline-container-orgbf80149" class="outline-3">
<h3 id="orgbf80149">Zooming In/OuT</h3>
<div class="outline-text-3" id="text-orgbf80149">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "&lt;C-wheel-up&gt;") 'text-scale-increase)
(global-set-key (kbd "&lt;C-wheel-down&gt;") 'text-scale-decrease)
</pre>
</div>
</div>
</div>
</div>
<div id="outline-container-org5539f80" class="outline-2">
<h2 id="org5539f80">GRAPHICAL USER INTERFACE AND FEATURE TWEAKS</h2>
<div class="outline-text-2" id="text-org5539f80">
</div>
<div id="outline-container-orga651ef9" class="outline-3">
<h3 id="orga651ef9">Disable Startup Message</h3>
<div class="outline-text-3" id="text-orga651ef9">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(setq inhibit-startup-message t)
</pre>
</div>
</div>
</div>

<div id="outline-container-org7873ab3" class="outline-3">
<h3 id="org7873ab3">Enable Visible Bell</h3>
<div class="outline-text-3" id="text-org7873ab3">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(setq visible-bell t)
</pre>
</div>
</div>
</div>

<div id="outline-container-org9f39708" class="outline-3">
<h3 id="org9f39708">Disable Menubar, Toolbars and Scroolbars</h3>
<div class="outline-text-3" id="text-org9f39708">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
</pre>
</div>
</div>
</div>

<div id="outline-container-org1535ae4" class="outline-3">
<h3 id="org1535ae4">Display Line Numbers and Truncated Lines</h3>
<div class="outline-text-3" id="text-org1535ae4">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
</pre>
</div>
</div>
</div>

<div id="outline-container-orgb7b6430" class="outline-3">
<h3 id="orgb7b6430">Tab Size</h3>
<div class="outline-text-3" id="text-orgb7b6430">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(setq-default tab-width 4)
</pre>
</div>
</div>
</div>

<div id="outline-container-org6703df0" class="outline-3">
<h3 id="org6703df0">Make ESC Quit Prompts</h3>
<div class="outline-text-3" id="text-org6703df0">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(global-set-key (kbd "&lt;escape&gt;") 'keyboard-escape-quit)
</pre>
</div>
</div>
</div>

<div id="outline-container-org7a96194" class="outline-3">
<h3 id="org7a96194">Disable Backup File</h3>
<div class="outline-text-3" id="text-org7a96194">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(setq make-backup-files nil)
</pre>
</div>
</div>
</div>

<div id="outline-container-org0a5a7fe" class="outline-3">
<h3 id="org0a5a7fe">Disable Auto Indent</h3>
<div class="outline-text-3" id="text-org0a5a7fe">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(transient-mark-mode -1)
</pre>
</div>
</div>
</div>

<div id="outline-container-org6738531" class="outline-3">
<h3 id="org6738531">Auto-Closing Pairs</h3>
<div class="outline-text-3" id="text-org6738531">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(electric-pair-mode -1)
</pre>
</div>
</div>
</div>

<div id="outline-container-org5a478ba" class="outline-3">
<h3 id="org5a478ba">Disable Auto-Save</h3>
<div class="outline-text-3" id="text-org5a478ba">
<p>
#+begin<sub>src</sub> emacs-lisp
(setq auto-save-default nil)
#+end<sub>src</sub>&gt;
</p>
</div>
</div>

<div id="outline-container-orgecf6ec8" class="outline-3">
<h3 id="orgecf6ec8">Disable Column Number Mode</h3>
<div class="outline-text-3" id="text-orgecf6ec8">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(column-number-mode 0)
</pre>
</div>
</div>
</div>

<div id="outline-container-orgfeff222" class="outline-3">
<h3 id="orgfeff222">Disable Line Number Mode</h3>
<div class="outline-text-3" id="text-orgfeff222">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(line-number-mode 0)
</pre>
</div>
</div>
</div>
</div>
<div id="outline-container-org7cee75b" class="outline-2">
<h2 id="org7cee75b">LSP SUPPORT</h2>
<div class="outline-text-2" id="text-org7cee75b">
</div>
<div id="outline-container-orgc596b7a" class="outline-3">
<h3 id="orgc596b7a">LSP INSTALL</h3>
<div class="outline-text-3" id="text-orgc596b7a">
<div class="org-src-container">
<pre class="src src-emacs-lisp">;; (use-package lsp-mode
;;  :ensure t
;;  :commands (lsp lsp-deferred)
;;  :init)
;; (use-package lsp-treemacs
;;  :ensure t) 
;;  (with-eval-after-load 'lsp-mode
;;  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
</pre>
</div>
</div>
</div>
<div id="outline-container-org8b4d733" class="outline-3">
<h3 id="org8b4d733">COMPANY MODE</h3>
<div class="outline-text-3" id="text-org8b4d733">
<div class="org-src-container">
<pre class="src src-emacs-lisp">;;   (use-package company
;;     :defer 2
;;     :diminish
;;     :after lsp-mode
;;     :hook (lsp-mode . company-mode)
;;     :bind (:map company-active-map
;;            ("&lt;tab&gt;" . company-complete-selection))
;;           (:map lsp-mode-map
;;            ("&lt;tab&gt;" . company-indent-or-complete-common))
;;     :custom
;;     (company-begin-commands '(self-insert-command))
;;     (company-idle-delay .1)
;;     (company-minimum-prefix-length 2)
;;     (company-show-numbers t)
;;     (company-tooltip-align-annotations 't)
;;     (global-company-mode t))

;;   (use-package company-box
;;     :after company
;;     :diminish
;;     :hook (company-mode . company-box-mode))
;; (setq company-tooltip-align-annotations t)
;; ;(setq company-vscode-light-icons-margin t)
;; (setq company-format-margin-function #'company-vscode-light-icons-margin)
</pre>
</div>
</div>
</div>
<div id="outline-container-org61ebcb6" class="outline-3">
<h3 id="org61ebcb6">MINIMAL SETUP</h3>
<div class="outline-text-3" id="text-org61ebcb6">
<div class="org-src-container">
<pre class="src src-emacs-lisp">;; (setq gc-cons-threshold 100000000)
;; (setq lsp-completion-provider :capf)
;; (setq lsp-idle-delay 0.500)
;; (setq lsp-log-io nil)
;; (setq lsp-enable-links nil)
;; (setq lsp-signature-render-documentation nil)
;; (setq lsp-headerline-breadcrumb-enable nil)
;; (setq lsp-ui-doc-enable nil)
;; (setq lsp-completion-enable-additional-text-edit nil)
</pre>
</div>
</div>
</div>
<div id="outline-container-org3015e9e" class="outline-3">
<h3 id="org3015e9e">SETUP LSP</h3>
<div class="outline-text-3" id="text-org3015e9e">
</div>
<div id="outline-container-orgd3e2ed0" class="outline-4">
<h4 id="orgd3e2ed0">Python</h4>
<div class="outline-text-4" id="text-orgd3e2ed0">
<div class="org-src-container">
<pre class="src src-emacs-lisp">;; (use-package python-mode
;;  :mode "\\.py\\'"
;;  :hook (python-mode . lsp-deferred)
;;  :config
;; (setq python-indent-level 2))
</pre>
</div>
</div>
</div>
<div id="outline-container-org67bae11" class="outline-4">
<h4 id="org67bae11">Disable Python Warning</h4>
<div class="outline-text-4" id="text-org67bae11">
<p>
#+begin<sub>src</sub> emacs-lisp
;;(setq lsp-pyls-plugins-pycodestyle-enabled nil)
#+end<sub>src</sub>&gt;
</p>
</div>
</div>
<div id="outline-container-org5831b9b" class="outline-4">
<h4 id="org5831b9b">LSP Features</h4>
<div class="outline-text-4" id="text-org5831b9b">
<p>
#+begin<sub>src</sub> emacs-lisp
;;(setq lsp-ui-sideline-enable nil)
;;(setq lsp-modeline-code-actions-enable nil)
;;(setq lsp-ui-sideline-enable t)
;;(setq lsp-modeline-diagnostics-enable nil)
;;(setq lsp-ui-sideline-enable t)
;;(setq lsp-signature-auto-activate t)
;;(setq lsp-signature-render-documentation nil)
</p>

<p>
#+end<sub>src</sub>&gt;
</p>
</div>
</div>
</div>
</div>
<div id="outline-container-org9b2df84" class="outline-2">
<h2 id="org9b2df84">ORG MODE</h2>
<div class="outline-text-2" id="text-org9b2df84">
</div>
<div id="outline-container-orgee57788" class="outline-3">
<h3 id="orgee57788">Enabling Table of Contents</h3>
<div class="outline-text-3" id="text-orgee57788">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(use-package toc-org
 :commands toc-org-enable
 :init (add-hook 'org-mode-hook 'toc-org-enable))
</pre>
</div>
</div>
</div>

<div id="outline-container-org5f8d2e4" class="outline-3">
<h3 id="org5f8d2e4">Enabling Org Bullets</h3>
<div class="outline-text-3" id="text-org5f8d2e4">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
</pre>
</div>
</div>
</div>

<div id="outline-container-org4abffd4" class="outline-3">
<h3 id="org4abffd4">Disable Electric Indent</h3>
<div class="outline-text-3" id="text-org4abffd4">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(electric-indent-mode -1)
</pre>
</div>
</div>
</div>

<div id="outline-container-orge86e372" class="outline-3">
<h3 id="orge86e372">Source Code Block Tag Expansion</h3>
<div class="outline-text-3" id="text-orge86e372">
<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Typing the below + TAB</th>
<th scope="col" class="org-left">Expands to &#x2026;</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">&lt;a</td>
<td class="org-left">'#+BEGIN<sub>EXPORT</sub> ascii' … '#+END<sub>EXPORT</sub></td>
</tr>

<tr>
<td class="org-left">&lt;c</td>
<td class="org-left">'#+BEGIN<sub>CENTER</sub>' … '#+END<sub>CENTER</sub>'</td>
</tr>

<tr>
<td class="org-left">&lt;C</td>
<td class="org-left">'#+BEGIN<sub>COMMENT</sub>' … '#+END<sub>COMMENT</sub>'</td>
</tr>

<tr>
<td class="org-left">&lt;e</td>
<td class="org-left">'#+BEGIN<sub>EXAMPLE</sub>' … '#+END<sub>EXAMPLE</sub>'</td>
</tr>

<tr>
<td class="org-left">&lt;E</td>
<td class="org-left">'#+BEGIN<sub>EXPORT</sub>' … '#+END<sub>EXPORT</sub>'</td>
</tr>

<tr>
<td class="org-left">&lt;h</td>
<td class="org-left">'#+BEGIN<sub>EXPORT</sub> html' … '#+END<sub>EXPORT</sub>'</td>
</tr>

<tr>
<td class="org-left">&lt;l</td>
<td class="org-left">'#+BEGIN<sub>EXPORT</sub> latex' … '#+END<sub>EXPORT</sub>'</td>
</tr>

<tr>
<td class="org-left">&lt;q</td>
<td class="org-left">'#+BEGIN<sub>QUOTE</sub>' … '#+END<sub>QUOTE</sub>'</td>
</tr>

<tr>
<td class="org-left">&lt;s</td>
<td class="org-left">'#+BEGIN<sub>SRC</sub>' … '#+END<sub>SRC</sub>'</td>
</tr>

<tr>
<td class="org-left">&lt;v</td>
<td class="org-left">'#+BEGIN<sub>VERSE</sub>' … '#+END<sub>VERSE</sub>'</td>
</tr>
</tbody>
</table>
<div class="org-src-container">
<pre class="src src-emacs-lisp">(require 'org-tempo) 
</pre>
</div>
</div>
</div>

<div id="outline-container-orgd1e01db" class="outline-3">
<h3 id="orgd1e01db">Diminish Org Indent Mode</h3>
<div class="outline-text-3" id="text-orgd1e01db">
<p>
#+begin<sub>src</sub> emacs-lisp
(eval-after-load 'org-indent '(diminish 'org-indent-mode))
#+end<sub>src</sub>&gt;
</p>
</div>
</div>

<div id="outline-container-org4889053" class="outline-3">
<h3 id="org4889053">Org Level Headers</h3>
<div class="outline-text-3" id="text-org4889053">
<p>
#+begin<sub>src</sub> emacs-lisp
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))r 
#+end<sub>src</sub>&gt;
</p>
</div>
</div>
</div>
<div id="outline-container-org98db42b" class="outline-2">
<h2 id="org98db42b">THEME</h2>
<div class="outline-text-2" id="text-org98db42b">
<div class="org-src-container">
<pre class="src src-emacs-lisp">;;(add-to-list 'custom-theme-load-path "C:/Users/Moderator/.emacs.d/themes")
;;(load-theme 'kanagawa t)
</pre>
</div>
</div>

<div id="outline-container-orgb5eaafd" class="outline-3">
<h3 id="orgb5eaafd">DOOM-THEMES</h3>
<div class="outline-text-3" id="text-orgb5eaafd">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-tokyo-night t) 
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
</pre>
</div>
</div>
</div>

<div id="outline-container-orgbcd3b34" class="outline-3">
<h3 id="orgbcd3b34">DOOM-MODELINE</h3>
<div class="outline-text-3" id="text-orgbcd3b34">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(use-package doom-modeline
  :ensure t
  :init   (doom-modeline-mode 1))
(setq doom-modeline-height 25)
(setq doom-modeline-bar-width 4)
(setq doom-modeline-hud nil) 
(setq doom-modeline-project-detection 'auto)
(setq doom-modeline-buffer-file-name-style 'auto)

;; Whether display icons in the mode-line.
;; While using the server mode in GUI, should set the value explicitly.
;; (setq doom-modeline-icon t)

;; ;; Whether display the icon for `major-mode'. It respects option `doom-modeline-icon'.
;; (setq doom-modeline-major-mode-icon t)

;; ;; Whether display the colorful icon for `major-mode'.
;; ;; It respects `nerd-icons-color-icons'.
;; (setq doom-modeline-major-mode-color-icon t)

;; ;; Whether display the icon for the buffer state. It respects option `doom-modeline-icon'.
;; (setq doom-modeline-buffer-state-icon t)

;; ;; Whether display the modification icon for the buffer.
;; ;; It respects option `doom-modeline-icon' and option `doom-modeline-buffer-state-icon'.
;; (setq doom-modeline-buffer-modification-icon t)

;; ;; Whether display the lsp icon. It respects option `doom-modeline-icon'.
;; (setq doom-modeline-lsp-icon t)

;; ;; Whether display the time icon. It respects option `doom-modeline-icon'.
;; (setq doom-modeline-time-icon t)

;; ;; Whether display the live icons of time.
;; ;; It respects option `doom-modeline-icon' and option `doom-modeline-time-icon'.
;; (setq doom-modeline-time-live-icon t)

;; ;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
;; (setq doom-modeline-unicode-fallback nil)

;; ;; Whether display the buffer name.
;; (setq doom-modeline-buffer-name t)

;; ;; Whether highlight the modified buffer name.
;; (setq doom-modeline-highlight-modified-buffer-name t)

;; ;; When non-nil, mode line displays column numbers zero-based.
;; ;; See `column-number-indicator-zero-based'.
;; (setq doom-modeline-column-zero-based nil)

;; ;; Specification of \"percentage offset\" of window through buffer.
;; ;; See `mode-line-percent-position'.
;; ;;(setq doom-modeline-percent-position '(-3 "%p"))
 (setq doom-modeline-percent-position nil)
;; ;; Format used to display line numbers in the mode line.
;; ;; See `mode-line-position-line-format'.
;; ;; (setq doom-modeline-position-line-format '("L%l"))
;; (setq doom-modeline-position-line-format '())
;; ;; Format used to display column numbers in the mode line.
;; ;; See `mode-line-position-column-format'.
;; ;; (setq doom-modeline-position-column-format '("C%c"))
;; (setq doom-modeline-position-column-format '())
;; ;; Format used to display combined line/column numbers in the mode line. See `mode-line-position-column-line-format'.
;; ;; (setq doom-modeline-position-column-line-format '("%l:%c"))
;; (setq doom-modeline-position-column-line-format '())
;; ;; Whether display the minor modes in the mode-line.
;; (setq doom-modeline-minor-modes nil)

;; ;; If non-nil, a word count will be added to the selection-info modeline segment.
;; (setq doom-modeline-enable-word-count nil)

;; ;; Major modes in which to display word count continuously.
;; ;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; ;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; ;; remove the modes from `doom-modeline-continuous-word-count-modes'.
;; (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

;; ;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding nil)

;; ;; Whether display the indentation information.
;; (setq doom-modeline-indent-info nil)

;; ;; Whether display the total line number。
;; (setq doom-modeline-total-line-number nil)

;; ;; If non-nil, only display one number for checker information if applicable.
;; (setq doom-modeline-checker-simple-format t)

;; ;; The maximum number displayed for notifications.
;; (setq doom-modeline-number-limit 99)

;; ;; The maximum displayed length of the branch name of version control.
;; (setq doom-modeline-vcs-max-length 12)

;; ;; Whether display the workspace name. Non-nil to display in the mode-line.
;; (setq doom-modeline-workspace-name t)

;; ;; Whether display the perspective name. Non-nil to display in the mode-line.
;; (setq doom-modeline-persp-name t)

;; ;; If non nil the default perspective name is displayed in the mode-line.
;; (setq doom-modeline-display-default-persp-name nil)

;; ;; If non nil the perspective name is displayed alongside a folder icon.
;; (setq doom-modeline-persp-icon t)

;; ;; Whether display the `lsp' state. Non-nil to display in the mode-line.
;; (setq doom-modeline-lsp nil)

;; ;; Whether display the GitHub notifications. It requires `ghub' package.
;; (setq doom-modeline-github nil)

;; ;; The interval of checking GitHub.
;; (setq doom-modeline-github-interval (* 30 60))

;; ;; Whether display the modal state.
;; ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
;; (setq doom-modeline-modal t)

;; ;; Whether display the modal state icon.
;; ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
;; (setq doom-modeline-modal-icon t)

;; ;; Whether display the modern icons for modals.
;; (setq doom-modeline-modal-modern-icon t)

;; ;; When non-nil, always show the register name when recording an evil macro.
;; (setq doom-modeline-always-show-macro-register nil)

;; ;; Whether display the gnus notifications.
;; (setq doom-modeline-gnus nil)

;; ;; Whether gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
;; (setq doom-modeline-gnus-timer 2)

;; ;; Wheter groups should be excludede when gnus automatically being updated.
;; (setq doom-modeline-gnus-excluded-groups '("dummy.group"))

;; ;; Whether display the IRC notifications. It requires `circe' or `erc' package.
;; (setq doom-modeline-irc t)

;; ;; Function to stylize the irc buffer names.
;; (setq doom-modeline-irc-stylize 'identity)

;; ;; Whether display the battery status. It respects `display-battery-mode'.
 (setq doom-modeline-battery t)
 (display-battery-mode 1)
;; ;; Whether display the time. It respects `display-time-mode'.
 (setq doom-modeline-time t)
 (display-time-mode 1)
;; ;; Whether display the misc segment on all mode lines.
;; ;; If nil, display only if the mode line is active.
;; (setq doom-modeline-display-misc-in-all-mode-lines t)

;; ;; The function to handle `buffer-file-name'.
;; (setq doom-modeline-buffer-file-name-function #'identity)

;; ;; The function to handle `buffer-file-truename'.
;; (setq doom-modeline-buffer-file-truename-function #'identity)

;; ;; Whether display the environment version.
;; (setq doom-modeline-env-version t)
;; ;; Or for individual languages
;; (setq doom-modeline-env-enable-python t)
;; (setq doom-modeline-env-enable-ruby t)
;; (setq doom-modeline-env-enable-perl t)
;; (setq doom-modeline-env-enable-go t)
;; (setq doom-modeline-env-enable-elixir t)
;; (setq doom-modeline-env-enable-rust t)

;; ;; Change the executables to use for the language version string
;; (setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
;; (setq doom-modeline-env-ruby-executable "ruby")
;; (setq doom-modeline-env-perl-executable "perl")
;; (setq doom-modeline-env-go-executable "go")
;; (setq doom-modeline-env-elixir-executable "iex")
;; (setq doom-modeline-env-rust-executable "rustc")

;; ;; What to display as the version while a new one is being loaded
;; (setq doom-modeline-env-load-string "...")

;; ;; By default, almost all segments are displayed only in the active window. To
;; ;; display such segments in all windows, specify e.g.
;; (setq doom-modeline-always-visible-segments '(mu4e irc))

;; ;; Hooks that run before/after the modeline version string is updated
;; (setq doom-modeline-before-update-env-hook nil)
;; (setq doom-modeline-after-update-env-hook nil)    
</pre>
</div>
</div>
</div>
</div>
<div id="outline-container-org1673819" class="outline-2">
<h2 id="org1673819">WHICH-KEY</h2>
<div class="outline-text-2" id="text-org1673819">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(use-package which-key
:init
(which-key-mode 1)
:diminish
:config
   (setq which-key-side-window-location 'bottom
         which-key-sort-order #'which-key-key-order-alpha
         which-key-sort-uppercase-first nil
         which-key-add-column-padding 2
         which-key-max-display-columns nil
         which-key-min-display-lines 6
         which-key-side-window-slot -10
         which-key-side-window-max-height 0.40
         which-key-idle-delay 0.8
         which-key-max-description-length 40
         which-key-allow-imprecise-window-fit t
         which-key-separator "   "))
</pre>
</div>
</div>
</div>

<div id="outline-container-org2458f64" class="outline-2">
<h2 id="org2458f64">RELOAD EMACS</h2>
<div class="outline-text-2" id="text-org2458f64">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(defun reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (load-file user-init-file))
</pre>
</div>
</div>
</div>

<div id="outline-container-org529601d" class="outline-2">
<h2 id="org529601d">DIMINISH</h2>
<div class="outline-text-2" id="text-org529601d">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(use-package diminish
 :ensure t)
</pre>
</div>
</div>
</div>

<div id="outline-container-org70a80f6" class="outline-2">
<h2 id="org70a80f6">MINIBUFFER ESCAPE</h2>
<div class="outline-text-2" id="text-org70a80f6">
<div class="org-src-container">
<pre class="src src-emacs-lisp">(global-set-key [escape] 'keyboard-escape-quit)
</pre>
</div>
</div>
</div>

<div id="outline-container-org847c9b4" class="outline-2">
<h2 id="org847c9b4">NEOTREE</h2>
<div class="outline-text-2" id="text-org847c9b4">
<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">COMMAND</td>
<td class="org-left">DESCRIPTION</td>
<td class="org-left">KEYBINDING</td>
</tr>

<tr>
<td class="org-left">neotree-toggle</td>
<td class="org-left">Toggle neotree</td>
<td class="org-left">SPC t n</td>
</tr>

<tr>
<td class="org-left">neotree-dir</td>
<td class="org-left">Open directory in neotree</td>
<td class="org-left">SPC d n</td>
</tr>
</tbody>
</table>

<div class="org-src-container">
<pre class="src src-emacs-lisp">(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t
        neo-show-hidden-files t
        neo-window-width 55
        neo-window-fixed-size nil
        inhibit-compacting-font-caches t
        projectile-switch-project-action 'neotree-projectile-action) 
        ;; truncate long file names in neotree
        (add-hook 'neo-after-create-hook
           #'(lambda (_)
               (with-current-buffer (get-buffer neo-buffer-name)
                 (setq truncate-lines t)
                 (setq word-wrap nil)
                 (make-local-variable 'auto-hscroll-mode)
                 (setq auto-hscroll-mode nil)))))

</pre>
</div>
</div>
</div>
</div>
<div id="postamble" class="status">
<p class="author">Author: Levisa Vanya</p>
<p class="date">Created: 2024-01-10 Wed 22:59</p>
<p class="validation"><a href="https://validator.w3.org/check?uri=referer">Validate</a></p>
</div>
</body>
</html>
