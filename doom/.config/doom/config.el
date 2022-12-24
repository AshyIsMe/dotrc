;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Aaron Ash"
      user-mail-address "aaron.ash@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'plan9)
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Sync/orgmode/")
(setq org-capture-templates
        (quote (("t" "todo" entry (file "~/Sync/orgmode/notes.org")
                "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                ("n" "note" entry (file+headline "~/Sync/orgmode/notes.org" "Notes")
                "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                ("m" "Meeting" entry (file "~/Sync/orgmode/notes.org")
                "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
                ("p" "Phone call" entry (file "~/Sync/orgmode/notes.org")
                "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                ("w" "Worklog" entry (file+olp+datetree "~/Sync/orgmode/worklog.org"))
                ("W" "Worklog" entry (file+olp+datetree "~/Sync/orgmode/worklog.org") "" :time-prompt t)
                )))

;; Configure Babel to support extra languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot        . t)
   (emacs-lisp . t)
   (org        . t)
   (python     . t)))
   ;(haskell    . t)
   ;(perl       . t)
   ;(R          . t)
   ;(ruby       . t)
   ;(sh         . t)
   ;(sqlite     . t)))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; (use-package! j-mode) ; No need for this! just (package! j-mode) in packages.el

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
