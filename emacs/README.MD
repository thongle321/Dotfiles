
# Table of Contents

-   [PROGRAM TO LOAD](#orgc34462f)
    -   [Elpaca Package Manager](#org3805044)
    -   [Load Evil Mode](#orgab9ac41)
-   [General Keybindings](#orgfa98988)
-   [ALL THE ICONS](#org4de854c)
-   [BUFFER-MOVE](#orga5aadf2)
-   [FONTS](#orge8e975b)
    -   [Setting The Font Face](#orgedea6a7)
    -   [Zooming In/OuT](#org28121ee)
-   [GRAPHICAL USER INTERFACE AND FEATURE TWEAKS](#org98fc118)
    -   [Disable Startup Message](#org14f95ba)
    -   [Enable Visible Bell](#orgbfbecf6)
    -   [Disable Menubar, Toolbars and Scroolbars](#org6fd8946)
    -   [Display Line Numbers and Truncated Lines](#org6d1ead8)
    -   [Tab Size](#org5036b8d)
    -   [Make ESC Quit Prompts](#org7f6510c)
    -   [Disable Backup File](#orgd70f1bb)
    -   [Disable Auto Indent](#org6555949)
    -   [Auto-Closing Pairs](#orge43401d)
    -   [Disable Auto-Save](#org2551749)
    -   [Disable Column Number Mode](#org6540d2c)
    -   [Disable Line Number Mode](#org1e670a5)
-   [LSP SUPPORT](#orgd4e0371)
    -   [LSP INSTALL](#org3f393fe)
    -   [COMPANY MODE](#orga2e2d9d)
    -   [MINIMAL SETUP](#org3106ccb)
    -   [SETUP LSP](#org892b1bd)
-   [ORG MODE](#orgba35f74)
    -   [Enabling Table of Contents](#org99a1147)
    -   [Enabling Org Bullets](#org519ac0f)
    -   [Disable Electric Indent](#orge485503)
    -   [Source Code Block Tag Expansion](#orgb8d3429)
    -   [Diminish Org Indent Mode](#org93838a5)
    -   [Org Level Headers](#orgd2c9452)
-   [THEME](#org0ea89e9)
    -   [DOOM-THEMES](#org0552db5)
    -   [DOOM-MODELINE](#orgb2d923d)
-   [WHICH-KEY](#org7d1105b)
-   [RELOAD EMACS](#org0c0be9b)
-   [DIMINISH](#org505efe0)
-   [MINIBUFFER ESCAPE](#orgca52258)
-   [NEOTREE](#org4f40d33)



<a id="orgc34462f"></a>

# PROGRAM TO LOAD


<a id="org3805044"></a>

## Elpaca Package Manager

    (defvar elpaca-installer-version 0.6)
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
    (when (< emacs-major-version 28) (require 'subr-x))
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


<a id="orgab9ac41"></a>

## Load Evil Mode

      ;; Install use-package support
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


<a id="orgfa98988"></a>

# General Keybindings

    (use-package general
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


<a id="org4de854c"></a>

# ALL THE ICONS

    (use-package all-the-icons
      :ensure t
      :if (display-graphic-p))
    
    (use-package all-the-icons-dired
      :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))


<a id="orga5aadf2"></a>

# BUFFER-MOVE

    (require 'windmove)
    
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


<a id="orge8e975b"></a>

# FONTS


<a id="orgedea6a7"></a>

## Setting The Font Face

    (set-face-attribute 'default nil
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


<a id="org28121ee"></a>

## Zooming In/OuT

    (global-set-key (kbd "C-=") 'text-scale-increase)
    (global-set-key (kbd "C--") 'text-scale-decrease)
    (global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
    (global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)


<a id="org98fc118"></a>

# GRAPHICAL USER INTERFACE AND FEATURE TWEAKS


<a id="org14f95ba"></a>

## Disable Startup Message

    (setq inhibit-startup-message t)


<a id="orgbfbecf6"></a>

## Enable Visible Bell

    (setq visible-bell t)


<a id="org6fd8946"></a>

## Disable Menubar, Toolbars and Scroolbars

    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)


<a id="org6d1ead8"></a>

## Display Line Numbers and Truncated Lines

    (global-display-line-numbers-mode 1)
    (global-visual-line-mode t)


<a id="org5036b8d"></a>

## Tab Size

    (setq-default tab-width 4)


<a id="org7f6510c"></a>

## Make ESC Quit Prompts

    (global-set-key (kbd "<escape>") 'keyboard-escape-quit)


<a id="orgd70f1bb"></a>

## Disable Backup File

    (setq make-backup-files nil)


<a id="org6555949"></a>

## Disable Auto Indent

    (transient-mark-mode -1)


<a id="orge43401d"></a>

## Auto-Closing Pairs

    (electric-pair-mode -1)


<a id="org2551749"></a>

## Disable Auto-Save

\#+begin<sub>src</sub> emacs-lisp
(setq auto-save-default nil)
\#+end<sub>src</sub>>


<a id="org6540d2c"></a>

## Disable Column Number Mode

    (column-number-mode 0)


<a id="org1e670a5"></a>

## Disable Line Number Mode

    (line-number-mode 0)


<a id="orgd4e0371"></a>

# LSP SUPPORT


<a id="org3f393fe"></a>

## LSP INSTALL

    ;; (use-package lsp-mode
    ;;  :ensure t
    ;;  :commands (lsp lsp-deferred)
    ;;  :init)
    ;; (use-package lsp-treemacs
    ;;  :ensure t) 
    ;;  (with-eval-after-load 'lsp-mode
    ;;  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))


<a id="orga2e2d9d"></a>

## COMPANY MODE

    ;;   (use-package company
    ;;     :defer 2
    ;;     :diminish
    ;;     :after lsp-mode
    ;;     :hook (lsp-mode . company-mode)
    ;;     :bind (:map company-active-map
    ;;            ("<tab>" . company-complete-selection))
    ;;           (:map lsp-mode-map
    ;;            ("<tab>" . company-indent-or-complete-common))
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


<a id="org3106ccb"></a>

## MINIMAL SETUP

    ;; (setq gc-cons-threshold 100000000)
    ;; (setq lsp-completion-provider :capf)
    ;; (setq lsp-idle-delay 0.500)
    ;; (setq lsp-log-io nil)
    ;; (setq lsp-enable-links nil)
    ;; (setq lsp-signature-render-documentation nil)
    ;; (setq lsp-headerline-breadcrumb-enable nil)
    ;; (setq lsp-ui-doc-enable nil)
    ;; (setq lsp-completion-enable-additional-text-edit nil)


<a id="org892b1bd"></a>

## SETUP LSP


### Python

    ;; (use-package python-mode
    ;;  :mode "\\.py\\'"
    ;;  :hook (python-mode . lsp-deferred)
    ;;  :config
    ;; (setq python-indent-level 2))


### Disable Python Warning

\#+begin<sub>src</sub> emacs-lisp
;;(setq lsp-pyls-plugins-pycodestyle-enabled nil)
\#+end<sub>src</sub>>


### LSP Features

\#+begin<sub>src</sub> emacs-lisp
;;(setq lsp-ui-sideline-enable nil)
;;(setq lsp-modeline-code-actions-enable nil)
;;(setq lsp-ui-sideline-enable t)
;;(setq lsp-modeline-diagnostics-enable nil)
;;(setq lsp-ui-sideline-enable t)
;;(setq lsp-signature-auto-activate t)
;;(setq lsp-signature-render-documentation nil)

\#+end<sub>src</sub>>


<a id="orgba35f74"></a>

# ORG MODE


<a id="org99a1147"></a>

## Enabling Table of Contents

    (use-package toc-org
     :commands toc-org-enable
     :init (add-hook 'org-mode-hook 'toc-org-enable))


<a id="org519ac0f"></a>

## Enabling Org Bullets

    (add-hook 'org-mode-hook 'org-indent-mode)
    (use-package org-bullets)
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


<a id="orge485503"></a>

## Disable Electric Indent

    (electric-indent-mode -1)


<a id="orgb8d3429"></a>

## Source Code Block Tag Expansion

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

    (require 'org-tempo) 


<a id="org93838a5"></a>

## Diminish Org Indent Mode

\#+begin<sub>src</sub> emacs-lisp
(eval-after-load 'org-indent '(diminish 'org-indent-mode))
\#+end<sub>src</sub>>


<a id="orgd2c9452"></a>

## Org Level Headers

\#+begin<sub>src</sub> emacs-lisp
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))r 
\#+end<sub>src</sub>>


<a id="org0ea89e9"></a>

# THEME

    ;;(add-to-list 'custom-theme-load-path "C:/Users/Moderator/.emacs.d/themes")
    ;;(load-theme 'kanagawa t)


<a id="org0552db5"></a>

## DOOM-THEMES

    (use-package doom-themes
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


<a id="orgb2d923d"></a>

## DOOM-MODELINE

    (use-package doom-modeline
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


<a id="org7d1105b"></a>

# WHICH-KEY

    (use-package which-key
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


<a id="org0c0be9b"></a>

# RELOAD EMACS

    (defun reload-init-file ()
      (interactive)
      (load-file user-init-file)
      (load-file user-init-file))


<a id="org505efe0"></a>

# DIMINISH

    (use-package diminish
     :ensure t)


<a id="orgca52258"></a>

# MINIBUFFER ESCAPE

    (global-set-key [escape] 'keyboard-escape-quit)


<a id="org4f40d33"></a>

# NEOTREE

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

    (use-package neotree
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

