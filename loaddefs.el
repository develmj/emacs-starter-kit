;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (c-includes c-includes-current-file c-includes-add-binding)
;;;;;;  "c-includes" "elpa-to-submit/c-includes.el" (20880 31652))
;;; Generated autoloads from elpa-to-submit/c-includes.el

(autoload 'c-includes-add-binding "c-includes" "\
Set binding for C-c C-i in cc-mode.

\(fn)" nil nil)

(autoload 'c-includes-current-file "c-includes" "\
Find all of the header file included by the current file.

\(fn &optional REGEXP)" t nil)

(autoload 'c-includes "c-includes" "\
Find all of the header files included by FILENAME.
REGEXP, if non-nil, is a regular expression to search for within
FILENAME and the files that it includes.  The output will be
structured in the same order that the compiler will see it, enabling
you determine order of occurrence.

\(fn FILENAME &optional REGEXP)" t nil)

;;;***

;;;### (autoloads (cheat) "cheat" "elpa-to-submit/cheat.el" (20880
;;;;;;  31652))
;;; Generated autoloads from elpa-to-submit/cheat.el

(autoload 'cheat "cheat" "\
Show the specified cheat sheet.

If SILENT is non-nil then do not print any output, but return it
as a string instead.

\(fn NAME &optional SILENT)" t nil)

;;;***

;;;### (autoloads (cperl-perldoc-at-point cperl-perldoc cperl-mode)
;;;;;;  "cperl-mode" "elpa-to-submit/cperl-mode.el" (20880 31652))
;;; Generated autoloads from elpa-to-submit/cperl-mode.el

(fset 'perl-mode 'cperl-mode)

(autoload 'cperl-mode "cperl-mode" "\
Major mode for editing Perl code.
Expression and list commands understand all C brackets.
Tab indents for Perl code.
Paragraphs are separated by blank lines only.
Delete converts tabs to spaces as it moves back.

Various characters in Perl almost always come in pairs: {}, (), [],
sometimes <>.  When the user types the first, she gets the second as
well, with optional special formatting done on {}.  (Disabled by
default.)  You can always quote (with \\[quoted-insert]) the left
\"paren\" to avoid the expansion.  The processing of < is special,
since most the time you mean \"less\".  CPerl mode tries to guess
whether you want to type pair <>, and inserts is if it
appropriate.  You can set `cperl-electric-parens-string' to the string that
contains the parenths from the above list you want to be electrical.
Electricity of parenths is controlled by `cperl-electric-parens'.
You may also set `cperl-electric-parens-mark' to have electric parens
look for active mark and \"embrace\" a region if possible.'

CPerl mode provides expansion of the Perl control constructs:

   if, else, elsif, unless, while, until, continue, do,
   for, foreach, formy and foreachmy.

and POD directives (Disabled by default, see `cperl-electric-keywords'.)

The user types the keyword immediately followed by a space, which
causes the construct to be expanded, and the point is positioned where
she is most likely to want to be.  eg. when the user types a space
following \"if\" the following appears in the buffer: if () { or if ()
} { } and the cursor is between the parentheses.  The user can then
type some boolean expression within the parens.  Having done that,
typing \\[cperl-linefeed] places you - appropriately indented - on a
new line between the braces (if you typed \\[cperl-linefeed] in a POD
directive line, then appropriate number of new lines is inserted).

If CPerl decides that you want to insert \"English\" style construct like

            bite if angry;

it will not do any expansion.  See also help on variable
`cperl-extra-newline-before-brace'.  (Note that one can switch the
help message on expansion by setting `cperl-message-electric-keyword'
to nil.)

\\[cperl-linefeed] is a convenience replacement for typing carriage
return.  It places you in the next line with proper indentation, or if
you type it inside the inline block of control construct, like

            foreach (@lines) {print; print}

and you are on a boundary of a statement inside braces, it will
transform the construct into a multiline and will place you into an
appropriately indented blank line.  If you need a usual
`newline-and-indent' behaviour, it is on \\[newline-and-indent],
see documentation on `cperl-electric-linefeed'.

Use \\[cperl-invert-if-unless] to change a construction of the form

	    if (A) { B }

into

            B if A;

\\{cperl-mode-map}

Setting the variable `cperl-font-lock' to t switches on font-lock-mode
\(even with older Emacsen), `cperl-electric-lbrace-space' to t switches
on electric space between $ and {, `cperl-electric-parens-string' is
the string that contains parentheses that should be electric in CPerl
\(see also `cperl-electric-parens-mark' and `cperl-electric-parens'),
setting `cperl-electric-keywords' enables electric expansion of
control structures in CPerl.  `cperl-electric-linefeed' governs which
one of two linefeed behavior is preferable.  You can enable all these
options simultaneously (recommended mode of use) by setting
`cperl-hairy' to t.  In this case you can switch separate options off
by setting them to `null'.  Note that one may undo the extra
whitespace inserted by semis and braces in `auto-newline'-mode by
consequent \\[cperl-electric-backspace].

If your site has perl5 documentation in info format, you can use commands
\\[cperl-info-on-current-command] and \\[cperl-info-on-command] to access it.
These keys run commands `cperl-info-on-current-command' and
`cperl-info-on-command', which one is which is controlled by variable
`cperl-info-on-command-no-prompt' and `cperl-clobber-lisp-bindings'
\(in turn affected by `cperl-hairy').

Even if you have no info-format documentation, short one-liner-style
help is available on \\[cperl-get-help], and one can run perldoc or
man via menu.

It is possible to show this help automatically after some idle time.
This is regulated by variable `cperl-lazy-help-time'.  Default with
`cperl-hairy' (if the value of `cperl-lazy-help-time' is nil) is 5
secs idle time .  It is also possible to switch this on/off from the
menu, or via \\[cperl-toggle-autohelp].  Requires `run-with-idle-timer'.

Use \\[cperl-lineup] to vertically lineup some construction - put the
beginning of the region at the start of construction, and make region
span the needed amount of lines.

Variables `cperl-pod-here-scan', `cperl-pod-here-fontify',
`cperl-pod-face', `cperl-pod-head-face' control processing of POD and
here-docs sections.  With capable Emaxen results of scan are used
for indentation too, otherwise they are used for highlighting only.

Variables controlling indentation style:
 `cperl-tab-always-indent'
    Non-nil means TAB in CPerl mode should always reindent the current line,
    regardless of where in the line point is when the TAB command is used.
 `cperl-indent-left-aligned-comments'
    Non-nil means that the comment starting in leftmost column should indent.
 `cperl-auto-newline'
    Non-nil means automatically newline before and after braces,
    and after colons and semicolons, inserted in Perl code.  The following
    \\[cperl-electric-backspace] will remove the inserted whitespace.
    Insertion after colons requires both this variable and
    `cperl-auto-newline-after-colon' set.
 `cperl-auto-newline-after-colon'
    Non-nil means automatically newline even after colons.
    Subject to `cperl-auto-newline' setting.
 `cperl-indent-level'
    Indentation of Perl statements within surrounding block.
    The surrounding block's indentation is the indentation
    of the line on which the open-brace appears.
 `cperl-continued-statement-offset'
    Extra indentation given to a substatement, such as the
    then-clause of an if, or body of a while, or just a statement continuation.
 `cperl-continued-brace-offset'
    Extra indentation given to a brace that starts a substatement.
    This is in addition to `cperl-continued-statement-offset'.
 `cperl-brace-offset'
    Extra indentation for line if it starts with an open brace.
 `cperl-brace-imaginary-offset'
    An open brace following other text is treated as if it the line started
    this far to the right of the actual line indentation.
 `cperl-label-offset'
    Extra indentation for line that is a label.
 `cperl-min-label-indent'
    Minimal indentation for line that is a label.

Settings for classic indent-styles: K&R BSD=C++ GNU PerlStyle=Whitesmith
  `cperl-indent-level'                5   4       2   4
  `cperl-brace-offset'                0   0       0   0
  `cperl-continued-brace-offset'     -5  -4       0   0
  `cperl-label-offset'               -5  -4      -2  -4
  `cperl-continued-statement-offset'  5   4       2   4

CPerl knows several indentation styles, and may bulk set the
corresponding variables.  Use \\[cperl-set-style] to do this.  Use
\\[cperl-set-style-back] to restore the memorized preexisting values
\(both available from menu).  See examples in `cperl-style-examples'.

Part of the indentation style is how different parts of if/elsif/else
statements are broken into lines; in CPerl, this is reflected on how
templates for these constructs are created (controlled by
`cperl-extra-newline-before-brace'), and how reflow-logic should treat
\"continuation\" blocks of else/elsif/continue, controlled by the same
variable, and by `cperl-extra-newline-before-brace-multiline',
`cperl-merge-trailing-else', `cperl-indent-region-fix-constructs'.

If `cperl-indent-level' is 0, the statement after opening brace in
column 0 is indented on
`cperl-brace-offset'+`cperl-continued-statement-offset'.

Turning on CPerl mode calls the hooks in the variable `cperl-mode-hook'
with no args.

DO NOT FORGET to read micro-docs (available from `Perl' menu,
or as help on variables `cperl-tips', `cperl-problems',
`cperl-non-problems', `cperl-praise', `cperl-speed',
`cperl-tips-faces').

\(fn)" t nil)

(autoload 'cperl-perldoc "cperl-mode" "\
Run `perldoc' on WORD.

\(fn WORD)" t nil)

(autoload 'cperl-perldoc-at-point "cperl-mode" "\
Run a `perldoc' on the word around point.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.\\([pP][LlMm]\\|al\\)\\'" . perl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . perl-mode))

;;;***

;;;### (autoloads (ctypes-read-file ctypes-auto-parse-mode ctypes-file
;;;;;;  ctypes-dir ctypes-tags ctypes-all-buffers ctypes-buffer ctypes-define-type-in-mode
;;;;;;  ctypes-define-type) "ctypes" "elpa-to-submit/ctypes.el" (20880
;;;;;;  31652))
;;; Generated autoloads from elpa-to-submit/ctypes.el

(autoload 'ctypes-define-type "ctypes" "\
Add a new TYPE to current major mode and inform font-lock.

When preceded by C-u the display is not updated.

Return non-nil if the type was not known before.

\(fn TYPE &optional DELAY-ACTION MODE)" t nil)

(autoload 'ctypes-define-type-in-mode "ctypes" "\
Add TYPE to major mode MODE and inform font-lock.

When preceded by C-u the display is not updated.

\(This function is designed for interactive use, please call
`ctypes-define-type' from Lisp programs.)

\(fn TYPE &optional DELAY-ACTION MODE)" t nil)

(autoload 'ctypes-buffer "ctypes" "\
Search for types in buffer, inform font-lock if any is found.

When preceded by C-u the action is not performed.

Return non-nil if new types are found.

\(fn &optional BUF DELAY-ACTION MODE)" t nil)

(autoload 'ctypes-all-buffers "ctypes" "\
Search for types in all buffers, inform font-lock about all discoveries.

When preceded by C-u the display is not updated.

Return non-nil if new types are found.

\(fn &optional DELAY-ACTION)" t nil)

(autoload 'ctypes-tags "ctypes" "\
Search for types in files in the visited TAGS table.
Should no tags table be visited, the user will be prompted for a new.

When preceded by C-u the display is not updated.

Return non-nil if new types are found.

\(fn &optional DELAY-ACTION)" t nil)

(autoload 'ctypes-dir "ctypes" "\
Search for types in files in a directory hierarchy.

See variable `ctypes-dir-read-file' for a description of which files
are opened during scanning, and how you can change the behavior.

When preceded by C-u the display is not updated.

Return non-nil if new types are found.

\(fn &optional DIR DELAY-ACTION)" t nil)

(autoload 'ctypes-file "ctypes" "\
Search for types in file FILE.
Should FILE not be loaded it is read into a temporary buffer.

Return mode of file, if new types was found.

\(fn FILE &optional DELAY-ACTION)" t nil)

(autoload 'ctypes-auto-parse-mode "ctypes" "\
Toggle CTypes auto parse mode; search all new buffers for types.
With arg, turn types Auto Mode on if and only if arg is positive.

This a global minor mode, it does not have a private keymap, nor does
it add itself to the mode line.

Place the following in your startup file to enable this feature in
future sessions:

    (require 'ctypes)
    (ctypes-auto-parse-mode 1)

When activated, the functions in the hook `ctypes-auto-parse-mode-hook'
is called with no args.

\(fn &optional ARG)" t nil)

(autoload 'ctypes-read-file "ctypes" "\
Load types previously saved with `ctypes-write-file'.
The name of the file is given by the optional argument FILE.
Should no file name be given the value of the variable `ctypes-file-name'
is used.

Please note that the types read will be added to the current types.

When preceded by C-u the display is not updated.

The third argument, NO-ERROR, determines whether or not we should
raise an error if there should be any problem loading the file.

Should the fourth argument, QUIETLY, be non-nil no messages are
generated when the file is loaded.

Return non-nil if new types are found.

\(fn &optional FILE DELAY-ACTION NO-ERROR QUIETLY)" t nil)

;;;***

;;;### (autoloads (dwim-describe dwim-find) "dwim-find" "elpa-to-submit/dwim-find.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/dwim-find.el

(autoload 'dwim-find "dwim-find" "\
Find the thing at point.
Make sensible guesses as to whether it's a tag, a filename, a lisp function name, or whatever.

\(fn)" t nil)

(autoload 'dwim-describe "dwim-find" "\
Find information about the thing at point.
Make sensible guesses as to whether it's a tag, a filename, a lisp function name, or whatever.

\(fn)" t nil)

;;;***

;;;### (autoloads (erc-highlight-nicknames) "erc-highlight-nicknames"
;;;;;;  "elpa-to-submit/erc-highlight-nicknames.el" (20880 31652))
;;; Generated autoloads from elpa-to-submit/erc-highlight-nicknames.el

(autoload 'erc-highlight-nicknames "erc-highlight-nicknames" "\
Searches for nicknames and highlights them. Uses the first
twelve digits of the MD5 message digest of the nickname as
color (#rrrrggggbbbb).

\(fn)" nil nil)

;;;***

;;;### (autoloads (espresso-mode) "espresso" "elpa-to-submit/espresso.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/espresso.el

(autoload 'espresso-mode "espresso" "\
Major mode for editing JavaScript source text.

Key bindings:

\\{espresso-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (flash-paren-mode) "flash-paren" "elpa-to-submit/flash-paren.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/flash-paren.el

(autoload 'flash-paren-mode "flash-paren" "\
Enable or disable flashing-parenthesis mode.

If called interactively with no prefix argument, toggle current condition
of the mode.
If called with a positive or negative prefix argument, enable or disable
the mode, respectively.

\(fn &optional PREFIX)" t nil)

;;;***

;;;### (autoloads (global-hl-sexp-mode hl-sexp-mode) "hl-sexp" "elpa-to-submit/hl-sexp.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/hl-sexp.el

(autoload 'hl-sexp-mode "hl-sexp" "\
Minor mode to highlight the sexp about point in the current window.
With ARG, turn Hl-Sexp mode on if ARG is positive, off otherwise.
Uses functions `hl-sexp-unhighlight' and `hl-sexp-highlight' on
`pre-command-hook' and `post-command-hook'.

\(fn &optional ARG)" t nil)

(defvar global-hl-sexp-mode nil "\
Non-nil if Global-Hl-Sexp mode is enabled.
See the command `global-hl-sexp-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-hl-sexp-mode'.")

(custom-autoload 'global-hl-sexp-mode "hl-sexp" nil)

(autoload 'global-hl-sexp-mode "hl-sexp" "\
Toggle Hl-Sexp mode in every possible buffer.
With prefix ARG, turn Global-Hl-Sexp mode on if and only if
ARG is positive.
Hl-Sexp mode is enabled in all buffers where
`hl-sexp-mode' would do it.
See `hl-sexp-mode' for more information on Hl-Sexp mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (javadoc-lookup) "javadoc-help" "elpa-to-submit/javadoc-help.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/javadoc-help.el

(autoload 'javadoc-lookup "javadoc-help" "\
Look up Java class in Javadoc.

\(fn)" t nil)

;;;***

;;;### (autoloads (markdown-mode) "markdown-mode" "elpa-to-submit/markdown-mode.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/markdown-mode.el

(autoload 'markdown-mode "markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;;;***

;;;### (autoloads (turn-off-mcomplete-mode turn-on-mcomplete-mode
;;;;;;  mcomplete-mode) "mcomplete" "elpa-to-submit/mcomplete.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/mcomplete.el

(autoload 'mcomplete-mode "mcomplete" "\
Toggle minibuffer completion with prefix and substring matching.
With ARG, turn the mode on if ARG is positive, off otherwise.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-mcomplete-mode "mcomplete" "\
Turn on minibuffer completion with prefix and substring matching.

\(fn)" t nil)

(autoload 'turn-off-mcomplete-mode "mcomplete" "\
Turn off minibuffer completion with prefix and substring matching.

\(fn)" t nil)

;;;***

;;;### (autoloads (moz-minor-mode) "moz" "elpa-to-submit/moz.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/moz.el

(autoload 'moz-minor-mode "moz" "\
Toggle Mozilla mode.
With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

When Mozilla mode is enabled, some commands become available to
send current code area (as understood by c-mark-function) or
region or buffer to an inferior mozilla process (which will be
started as needed).

\(fn &optional ARG)" t nil)

(eval-after-load 'js2-mode '(add-hook 'js2-mode-hook 'moz-minor-mode))

;;;***

;;;### (autoloads (oddmuse-kill-url oddmuse-browse-this-page oddmuse-browse-page
;;;;;;  emacswiki-post oddmuse-insert-pagename oddmuse-revert oddmuse-post
;;;;;;  oddmuse-follow oddmuse-edit oddmuse-toggle-minor) "oddmuse"
;;;;;;  "elpa-to-submit/oddmuse.el" (20880 31652))
;;; Generated autoloads from elpa-to-submit/oddmuse.el

(autoload 'oddmuse-toggle-minor "oddmuse" "\
Toggle minor mode state.

\(fn &optional ARG)" t nil)

(autoload 'oddmuse-edit "oddmuse" "\
Edit a page on a wiki.
WIKI is the name of the wiki as defined in `oddmuse-wikis',
PAGENAME is the pagename of the page you want to edit.
Use a prefix argument to force a reload of the page.

\(fn WIKI PAGENAME)" t nil)

(autoload 'oddmuse-follow "oddmuse" "\
Figure out what page we need to visit
and call `oddmuse-edit' on it.

\(fn ARG)" t nil)

(autoload 'oddmuse-post "oddmuse" "\
Post the current buffer to the current wiki.
The current wiki is taken from `oddmuse-wiki'.

\(fn SUMMARY)" t nil)

(autoload 'oddmuse-revert "oddmuse" "\
Revert this oddmuse page.

\(fn)" t nil)

(autoload 'oddmuse-insert-pagename "oddmuse" "\
Insert a PAGENAME of current wiki with completion.

\(fn PAGENAME)" t nil)

(autoload 'emacswiki-post "oddmuse" "\
Post the current buffer to the EmacsWiki.
If this command is invoked interactively: with prefix argument, prompts pagename,
otherwise set pagename as basename of `buffer-file-name'.

This command is intended to post current EmacsLisp program easily.

\(fn &optional PAGENAME SUMMARY)" t nil)

(autoload 'oddmuse-browse-page "oddmuse" "\
Ask a WWW browser to load an oddmuse page.
WIKI is the name of the wiki as defined in `oddmuse-wikis',
PAGENAME is the pagename of the page you want to browse.

\(fn WIKI PAGENAME)" t nil)

(autoload 'oddmuse-browse-this-page "oddmuse" "\
Ask a WWW browser to load current oddmuse page.

\(fn)" t nil)

(autoload 'oddmuse-kill-url "oddmuse" "\
Make the URL of current oddmuse page the latest kill in the kill ring.

\(fn)" t nil)

;;;***

;;;### (autoloads (pcomplete/rake) "pcmpl-rake" "elpa-to-submit/pcmpl-rake.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/pcmpl-rake.el

(autoload 'pcomplete/rake "pcmpl-rake" "\
Completion rules for the `ssh' command.

\(fn)" nil nil)

;;;***

;;;### (autoloads (perl-find-file perldoc) "perl-find-library" "elpa-to-submit/perl-find-library.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/perl-find-library.el

(autoload 'perldoc "perl-find-library" "\
Invoke `cperl-perldoc' on LIBRARY, but do completion using *PERL-LIBRARIES*
when run interactively

\(fn LIBRARY)" t nil)

(autoload 'perl-find-file "perl-find-library" "\
Find a perl library by module name

\(fn LIBRARY)" t nil)

;;;***

;;;### (autoloads (pod-mode) "pod-mode" "elpa-to-submit/pod-mode.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/pod-mode.el

(autoload 'pod-mode "pod-mode" "\
Major mode for editing POD files (Plain Old Documentation for Perl).

\(fn)" t nil)

;;;***

;;;### (autoloads (jython-mode python-mode run-python) "python" "elpa-to-submit/python.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/python.el

(add-to-list 'interpreter-mode-alist '("jython" . jython-mode))

(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(autoload 'run-python "python" "\
Run an inferior Python process, input and output via buffer *Python*.
CMD is the Python command to run.  NOSHOW non-nil means don't show the
buffer automatically.

Normally, if there is a process already running in `python-buffer',
switch to that buffer.  Interactively, a prefix arg allows you to edit
the initial command line (default is `python-command'); `-i' etc. args
will be added to this as appropriate.  A new process is started if:
one isn't running attached to `python-buffer', or interactively the
default `python-command', or argument NEW is non-nil.  See also the
documentation for `python-buffer'.

Runs the hook `inferior-python-mode-hook' (after the
`comint-mode-hook' is run).  (Type \\[describe-mode] in the process
buffer for a list of commands.)

\(fn &optional CMD NOSHOW NEW)" t nil)

(autoload 'python-mode "python" "\
Major mode for editing Python files.
Font Lock mode is currently required for correct parsing of the source.
See also `jython-mode', which is actually invoked if the buffer appears to
contain Jython code.  See also `run-python' and associated Python mode
commands for running Python under Emacs.

The Emacs commands which work with `defun's, e.g. \\[beginning-of-defun], deal
with nested `def' and `class' blocks.  They take the innermost one as
current without distinguishing method and class definitions.  Used multiple
times, they move over others at the same indentation level until they reach
the end of definitions at that level, when they move up a level.
\\<python-mode-map>
Colon is electric: it outdents the line if appropriate, e.g. for
an else statement.  \\[python-backspace] at the beginning of an indented statement
deletes a level of indentation to close the current block; otherwise it
deletes a character backward.  TAB indents the current line relative to
the preceding code.  Successive TABs, with no intervening command, cycle
through the possibilities for indentation on the basis of enclosing blocks.

\\[fill-paragraph] fills comments and multi-line strings appropriately, but has no
effect outside them.

Supports Eldoc mode (only for functions, using a Python process),
Info-Look and Imenu.  In Outline minor mode, `class' and `def'
lines count as headers.  Symbol completion is available in the
same way as in the Python shell using the `rlcompleter' module
and this is added to the Hippie Expand functions locally if
Hippie Expand mode is turned on.  Completion of symbols of the
form x.y only works if the components are literal
module/attribute names, not variables.  An abbrev table is set up
with skeleton expansions for compound statement templates.

\\{python-mode-map}

\(fn)" t nil)

(autoload 'jython-mode "python" "\
Major mode for editing Jython files.
Like `python-mode', but sets up parameters for Jython subprocesses.
Runs `jython-mode-hook' after `python-mode-hook'.

\(fn)" t nil)

;;;***

;;;### (autoloads (ri) "ri" "elpa-to-submit/ri.el" (20880 31652))
;;; Generated autoloads from elpa-to-submit/ri.el

(autoload 'ri "ri" "\
Look up Ruby documentation.

\(fn &optional RI-DOCUMENTED)" t nil)

;;;***

;;;### (autoloads (run-command-asynchronously-with-callback run-command-asynchronously
;;;;;;  run-command-as-comint-with-filter run-command-as-comint run-command-region
;;;;;;  run-command) "run-command" "elpa-to-submit/run-command.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/run-command.el

(autoload 'run-command "run-command" "\
In BUFFER, run PROGRAM with ARGS.

\(fn BUFFER PROGRAM &rest ARGS)" t nil)

(autoload 'run-command-region "run-command" "\
In BUFFER, run PROGRAM on region with ARGS.
If DELETE is non-nil, then delete the current region.
Interactively, delete if the prefix arg is non-nil.

\(fn START END DELETE BUFFER PROGRAM &rest ARGS)" t nil)

(autoload 'run-command-as-comint "run-command" "\
In BUFFER, run PROGRAM with ARGS as a comint process.

\(fn BUFFER PROGRAM &rest ARGS)" t nil)

(autoload 'run-command-as-comint-with-filter "run-command" "\
In BUFFER, run PROGRAM with ARGS as a comint process.
If optional argument FILTER is present, use as comint filter function.

\(fn BUFFER PROGRAM FILTER &rest ARGS)" nil nil)

(autoload 'run-command-asynchronously "run-command" "\
In BUFFER, run PROGRAM asynchronously with ARGS.

\(fn BUFFER PROGRAM &rest ARGS)" t nil)

(autoload 'run-command-asynchronously-with-callback "run-command" "\
In BUFFER, run PROGRAM asynchronously with ARGS.
When the process finishes, invoke CALLBACK if non-nil.

\(fn BUFFER PROGRAM &optional CALLBACK &rest ARGS)" nil nil)

;;;***

;;;### (autoloads (scpaste-region scpaste) "scpaste" "elpa-to-submit/scpaste.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/scpaste.el

(autoload 'scpaste "scpaste" "\
Paste the current buffer via `scp' to `scpaste-http-destination'.

\(fn ORIGINAL-NAME)" t nil)

(autoload 'scpaste-region "scpaste" "\
Paste the current region via `scpaste'.

\(fn NAME)" t nil)

;;;***

;;;### (autoloads (shell-command-completion-mode) "shell-command"
;;;;;;  "elpa-to-submit/shell-command.el" (20880 31652))
;;; Generated autoloads from elpa-to-submit/shell-command.el

(autoload 'shell-command-completion-mode "shell-command" "\
Enable or disable tab-completion for some commands.
The commands are `shell-command', `shell-command-on-region', `grep',
`grep-find' and `compile'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (swank-clojure-project swank-clojure-cmd swank-clojure-slime-mode-hook
;;;;;;  swank-clojure-init) "swank-clojure" "elpa-to-submit/swank-clojure.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/swank-clojure.el

(autoload 'swank-clojure-init "swank-clojure" "\
Not documented

\(fn FILE ENCODING)" nil nil)

(autoload 'swank-clojure-slime-mode-hook "swank-clojure" "\
Not documented

\(fn)" nil nil)

(autoload 'swank-clojure-cmd "swank-clojure" "\
Create the command to start clojure according to current settings.

\(fn)" nil nil)

(defadvice slime-read-interactive-args (before add-clojure) (require 'assoc) (aput 'slime-lisp-implementations 'clojure (list (swank-clojure-cmd) :init 'swank-clojure-init)))

(autoload 'swank-clojure-project "swank-clojure" "\
Setup classpath for a clojure project and starts a new SLIME session.
  Kills existing SLIME session, if any.

\(fn PATH)" t nil)

;;;***

;;;### (autoloads (textile-mode) "textile-mode" "elpa-to-submit/textile-mode.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/textile-mode.el

(autoload 'textile-mode "textile-mode" "\
A major mode for editing textile files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;;;***

;;;### (autoloads (tt-mode) "tt-mode" "elpa-to-submit/tt-mode.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/tt-mode.el

(autoload 'tt-mode "tt-mode" "\
Major mode for editing Template Toolkit files

\(fn)" t nil)

;;;***

;;;### (autoloads (color-theme-twilight) "twilight" "elpa-to-submit/twilight.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/twilight.el

(autoload 'color-theme-twilight "twilight" "\
Color theme by Marcus Crafter, based off the TextMate Twilight theme, created 2008-04-18

\(fn)" t nil)

;;;***

;;;### (autoloads (vala-mode) "vala-mode" "elpa-to-submit/vala-mode.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/vala-mode.el

(autoload 'vala-mode "vala-mode" "\
Major mode for editing Vala code.
This is a simple example of a separate mode derived from CC Mode
to support a language with syntax similar to
C#/C/C++/ObjC/Java/IDL/Pike.

The hook `c-mode-common-hook' is run with no args at mode
initialization, then `vala-mode-hook'.

Key bindings:
\\{vala-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (wdired-change-to-wdired-mode) "wdired" "elpa-to-submit/wdired.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/wdired.el

(autoload 'wdired-change-to-wdired-mode "wdired" "\
Put a dired buffer in a mode in which filenames are editable.
In this mode the names of the files can be changed, and after
typing C-c C-c the files and directories in disk are renamed.

See `wdired-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads (color-theme-zenburn) "zenburn" "elpa-to-submit/zenburn.el"
;;;;;;  (20880 31652))
;;; Generated autoloads from elpa-to-submit/zenburn.el

(autoload 'color-theme-zenburn "zenburn" "\
Just some alien fruit salad to keep you in the zone.

\(fn)" t nil)

(defalias 'zenburn #'color-theme-zenburn)

;;;***

;;;### (autoloads nil nil ("elpa-to-submit/bash-start.el" "elpa-to-submit/clj-parenface.el"
;;;;;;  "elpa-to-submit/clj-repl-color.el" "elpa-to-submit/color-file-completion.el"
;;;;;;  "elpa-to-submit/color-theme-empty-void.el" "elpa-to-submit/color-theme-mac-classic.el"
;;;;;;  "elpa-to-submit/color-theme.el" "elpa-to-submit/cparen.el"
;;;;;;  "elpa-to-submit/escreen.el" "elpa-to-submit/eshell-vc.el"
;;;;;;  "elpa-to-submit/find-file-root.el" "elpa-to-submit/hl-line+.el"
;;;;;;  "elpa-to-submit/jump-def.el" "elpa-to-submit/notify.el" "elpa-to-submit/osd.el"
;;;;;;  "elpa-to-submit/pabbrev.el" "elpa-to-submit/quick-yes.el"
;;;;;;  "elpa-to-submit/rotate-split.el" "elpa-to-submit/slime-clojure-extra.el"
;;;;;;  "elpa-to-submit/slime-update-clojure-namespace-v3.el" "elpa-to-submit/sudo.el"
;;;;;;  "elpa-to-submit/typeset.el" "elpa-to-submit/xterm-256color.el")
;;;;;;  (20880 31762 267525))

;;;***

(provide 'loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; loaddefs.el ends here
