let mapleader = " "

" --------------------------------------- "
" Trimmed for the VSCodeVim extension: no plugin manager, colorscheme,
" LSP/ALE, statusline, fzf, NERDTree, netrw, or tmux-navigator support here.
" --------------------------------------- "

" --- Unbind Nop section ---

map <C-w> <Nop>
map Q <Nop>
inoremap <C-_> <Nop>

" -------------------------

" --- VS Code integration (bridges to native VS Code commands via VSCodeNotify) ---
" These replace plugin functionality (NERDTree, tmux-navigator) with VS Code's
" own equivalents, since neither plugin can run inside VSCodeVim.

" toggle the file explorer sidebar (was netrw's <C-n>)
nnoremap <C-n> :call VSCodeNotify('workbench.view.explorer')<CR>

" focus the editor pane in a direction (was tmux-navigator's <C-h/j/k/l>)
nnoremap <C-h> :call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap <C-j> :call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap <C-k> :call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap <C-l> :call VSCodeNotify('workbench.action.focusRightGroup')<CR>

" toggle the Problems panel (was ALE's <leader>a)
nnoremap <leader>a :call VSCodeNotify('workbench.actions.view.problems')<CR>

" -------------------------

set backspace=indent,eol,start

set hlsearch
set incsearch

" Get rid of ^M chars after pasting
" :%s/\r//g

" disable case keybinds
xnoremap u <Nop>
xnoremap U <Nop>

" search next/prev and center it
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap # #zzzv
nnoremap * #zzzv

" vim-sneak (natively emulated by VSCodeVim; enable "vim.sneak": true in settings.json)
map s <Plug>Sneak_s
map S <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F

" f/t  → tiny movement (single char)
" s    → medium teleport (2 chars)
" /    → full search

" keep capslock as fn1 and do esc mode fn1 + w which will be ctrl+w for othernkeyboar

" vim-commentary (gcc, gc+motion) is built into VSCodeVim natively, no plugin needed

" --------------------------------

" MAPPINGS AND SETTINGS VIM"
set relativenumber
set number

set nopaste

" Tabs
nnoremap <Tab> <Nop>

" acts as C-; and C-'
" when in tmux
nnoremap <C-^> :tabnext<CR>
nnoremap <C-_> :tabprevious<CR>
" when not in tmux
nnoremap <Char-0x1e> :tabprevious<CR>
nnoremap <Char-0x1f> :tabnext<CR>

" Buffers (jump list style)
" Disable tab in normal mode (vim thinks C-I is tab)
nnoremap <C-I> <Nop>
" jump forward
nnoremap <C-I> <C-I>
" jump back
nnoremap <C-O> <C-O>

" " LaTex General/Math
inoremap ,6 ^{}<Left>
inoremap ,- _{}<Left>

inoremap ,fr \frac{}{}<Left><Left><Left>
inoremap ,su \sum_{}^{}<Left><Left><Left>
inoremap ,in \int_{}^{}<Left><Left><Left><Left>
inoremap ,bn \binom{}{}<Left><Left><Left>
inoremap ,ts \times
inoremap ,ck \check{}<Left>
inoremap ,wh \widehat
inoremap ,ma \max_{}<Left>
inoremap ,mi \min_{}<Left>
"do a keybind for \tilde

inoremap ,ri \right
inoremap ,le \left
inoremap ,\| \left\|  \right\|<Left><Left><Left><Left><Left><Left>
inoremap ,( \left(  \right)<Left><Left><Left><Left><Left><Left>
inoremap ,9 \left(  \right)<Left><Left><Left><Left><Left><Left><Left><Left>
inoremap ,[ \left[  \right<Left><Left><Left><Left><Left><Left><Left><Left>
inoremap ,{ \left\{  \right\}<Left><Left><Left><Left><Left><Left><Left><Left>

inoremap ,b( \Big(  \Big)<Left><Left><Left>
inoremap ,b9 \Big(  \Big)<Left><Left><Left>
inoremap ,b[ \Big[  \Big]<Left><Left><Left>
inoremap ,b{ \Big\{  \Big\}<Left><Left><Left>
inoremap ,ss \subsection*{}<Left>
inoremap ,pg \paragraph{}<Left>
inoremap ,tt \text{}<Left>
inoremap ,it \textit{}<Left>
inoremap ,tm \item
inoremap ,im \item
inoremap ,pb \pbreak
inoremap ,np \newpage
inoremap ,ud \underline{
inoremap ,em ---

" ) can be replaced with anything, ex: . to make a. instead of a)
inoremap ,ba \begin{enumerate}[label=\alph*)]<CR><CR>\end{enumerate}<Esc>kA
inoremap ,bA \begin{enumerate}[label=\Alph*)]<CR><CR>\end{enumerate}<Esc>kA
inoremap ,be \begin{enumerate}<CR><CR>\end{enumerate}<Esc>kA
inoremap ,bi \begin{itemize}<CR><CR>\end{itemize}<Esc>kA
inoremap ,bq \begin{quote}<CR><CR>\end{quote}<Esc>kA
inoremap ,bc \begin{center}<CR><CR>\end{center}<Esc>kA
inoremap ,bv \begin{verbatim}<CR><CR>\end{verbatim}<Esc>kA
inoremap ,cb \begin{tcolorbox}<CR><CR>\end{tcolorbox}<Esc>kA
inoremap ,eq \begin{equation*}<CR><CR>\end{equation*}<Esc>kA
inoremap ,bm \begin{multicols}{1}<CR><CR>\end{multicols}<Esc>kA
inoremap ,ar \begin{array}<CR><CR>\end{array}<Esc>kA
inoremap ,al \begin{align*}<CR><CR>\end{align*}<C-o>k
inoremap ,tb \textbf{}<Left>
inoremap ,fb \fbox{}<Left>
inoremap <C-a> \textbf{
inoremap <C-z> {
inoremap <C-x> }
inoremap ,ub \underbrace{}_{}<Left><Left><Left><Left>
inoremap ,ob \overbrace{}^{}<Left><Left><Left><Left>
inoremap ,pa \partial
inoremap ,vp \vspace{}<Left>
inoremap ,vb \verb\|\|<Left>
inoremap ,vo \vocab{
inoremap ,tf \therefore
inoremap ,bo \boxednote{<CR><CR>}<Esc>kA
"<CR> is a carriage return in vim

" ----- Lowercase -----
inoremap ,aa  \alpha
inoremap ,bt  \beta
inoremap ,ga  \gamma
inoremap ,da  \delta
inoremap ,ep \epsilon
inoremap ,ve \varepsilon
inoremap ,za  \zeta
inoremap ,th  \theta
inoremap ,ia  \iota
inoremap ,ka  \kappa
inoremap ,la  \lambda
inoremap ,m  \mu
inoremap ,n  \nu
inoremap ,x  \xi
inoremap ,p  \pi
inoremap ,r  \rho
inoremap ,sa  \sigma
inoremap ,ta \tau
inoremap ,un  \upsilon
inoremap ,ph \phi
inoremap ,c \chi
inoremap ,ps \psi
inoremap ,oa  \omega

" ----- Variants -----
inoremap ,vf \varphi
inoremap ,vk \varkappa
inoremap ,vr \varrho
inoremap ,vs \varsigma

" ----- Capitals that exist in LaTeX -----
inoremap ,G \Gamma
inoremap ,D \Delta
inoremap ,T \Theta
inoremap ,L \Lambda
inoremap ,X \Xi
inoremap ,P \Pi
inoremap ,S \Sigma
inoremap ,U \Upsilon
inoremap ,F \Phi
inoremap ,C \Chi
inoremap ,Y \Psi
inoremap ,O \Omega

inoremap ,nb \nabla

inoremap ,bs \boldsymbol{}<Left>
inoremap ,bf \mathbf{}<Left>
inoremap ,bb \mathbb{}<Left>
inoremap ,ca \mathcal{}<Left>

inoremap ,4 $$<Left>
inoremap ,\ \[<CR>\]<Esc>O

inoremap ,sn \sin{}<Left>
inoremap ,cs \cos{}<Left>
inoremap ,lo \log{}<Left>
inoremap ,as \arcsin{}<Left>
inoremap ,ac \arccos{}<Left>
inoremap ,at \arctan{}<Left>

" LaTex math visual
nnoremap ,im F$lvf$h
nnoremap ,am F$vf$
nnoremap ,iM F\[lvf\]h
nnoremap ,aM F\[vf\]

vnoremap ,im <Esc>F$lvf$h
vnoremap ,am <Esc>F$vf$
vnoremap ,iM <Esc>F\[lvf\]h
vnoremap ,aM <Esc>F\[vf\]

" maybe delete the % if causing problems
nnoremap ,gm F\vf{%
vnoremap ,gm F\vf{%
nnoremap gm %
vnoremap gm %

function! ShowWORD()
    let word = expand('<cWORD>')

    " -------- BEGIN CASE --------
    if word =~ '^\\begin{itemize}'
        let depth = 0
        let lnum = line('.')

        while lnum < line('$')
            let lnum += 1
            let line = getline(lnum)

            if line =~ '\\begin{itemize}'
                let depth += 1
            elseif line =~ '\\end{itemize}'
                if depth == 0
                    let col = match(line, '\\')
                    call cursor(lnum, col + 1)
                    return
                endif
                let depth -= 1
            endif
        endwhile

        echo "No matching \\end found"
        return

    " -------- END CASE --------
    elseif word =~ '^\\end{itemize}'
        let depth = 0
        let lnum = line('.')

        while lnum > 1
            let lnum -= 1
            let line = getline(lnum)

            if line =~ '\\end{itemize}'
                let depth += 1
            elseif line =~ '\\begin{itemize}'
                if depth == 0
                    let col = match(line, '\\')
                    call cursor(lnum, col + 1)
                    return
                endif
                let depth -= 1
            endif
        endwhile

        echo "No matching \\begin found"
        return
    endif
endfunction

nnoremap <C-f> :call ShowWORD()<CR>
vnoremap <C-f> :call ShowWORD()<CR>

nnoremap csl :set cursorline! \| echo "cursorline: " . (&cursorline ? "ON" : "OFF")<CR>
nnoremap csc :set cursorcolumn! \| echo "cursorcolumn: " . (&cursorcolumn ? "ON" : "OFF")<CR>

" \begin{itemize}
" \begin{itemize}
" \end{itemize}
" \end{itemize}

" doesnt work cause matchpairs needs asymmetric chars, so not $
" set matchpairs+=$:$

" Clipboard "
set clipboard=unnamedplus
" Gets rid of blackhole copying from pasting
vnoremap p "_dP
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d

" Map Ctrl+s to save the file
nnoremap <C-s> :w<CR>
nnoremap <leader>w :w<CR>

" window "
set splitbelow
set splitright
set noswapfile

" --- marks ---
nnoremap <leader>m :marks<CR>
nnoremap ' `

function! JumpToExactMark()
  let c = nr2char(getchar())   " get the mark letter
  execute "normal! `" . c . "zz"
endfunction

nnoremap m :call JumpToExactMark()<CR>

function! SetMark()
  let c = nr2char(getchar())
  execute 'normal! m' . c
endfunction

nnoremap M :call SetMark()<CR>

" ma       Set a mark 'a' at the current cursor position (lowercase = local)
" mA       Set a mark 'A' at current position (uppercase = global, persists across files)

" 'a       Jump to the line of mark 'a' (local)
" `a       Jump to the exact cursor position of mark 'a' (line + column)
" 'A       Jump to global mark 'A' in another file
" `"       Jump to last exit position (where you left the file)

" ``       Jump to previous cursor position (two backticks)
" '.       Jump to last edit
" `^       Jump to last insert position

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap <leader>v <C-q>
inoremap <C-q> <Esc>
vnoremap <C-q> <Esc>
nnoremap <C-q> <Esc>

nnoremap <leader>k :call VSCodeNotify('workbench.action.splitEditorUp')<CR>
nnoremap <leader>j :call VSCodeNotify('workbench.action.splitEditorDown')<CR>
nnoremap <leader>h :call VSCodeNotify('workbench.action.splitEditorLeft')<CR>
nnoremap <leader>l :call VSCodeNotify('workbench.action.splitEditorRight')<CR>

" Resize splits with Alt + Shift + Arrows
nnoremap <M-S-Up>    :resize +2<CR>
nnoremap <M-S-Down>  :resize -2<CR>
nnoremap <M-S-Right> :vertical resize -2<CR>
nnoremap <M-S-Left>  :vertical resize +2<CR>

" Tabs "
filetype on
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set autoindent
set smartindent

" Shift lines up and down in visual mode (selected lines)
vnoremap <S-k> :move '<-2<CR>gv
vnoremap <S-j> :move '>+1<CR>gv

" Shift lines left and right in visual mode (selected lines)
vnoremap <S-h> <gv
vnoremap <S-l> >gv

nnoremap 9 $
vnoremap 9 $
onoremap 9 $

nnoremap D "_dd
nnoremap dl "_dd
nnoremap C cc
nnoremap cl cc
vnoremap d "_d
nnoremap d "_d
vnoremap d "_d

" explicit deletion
nnoremap d9 d$
nnoremap d0 d0

set cursorline
syntax on

nnoremap <leader>uv :e ~/.vimrc<CR>
nnoremap <leader>uV :source ~/.vimrc<CR>

nnoremap <leader>ut :e ~/.tmux.conf<CR>
nnoremap <leader>uT :call setreg('+', 'tmux source-file ~/.tmux.conf')<CR>

nnoremap <leader>uh :e ~/.config/hypr/<CR>
nnoremap <leader>uk :e ~/.config/kitty/kitty.conf<CR>

" look at previous commands
nnoremap c; q:

cnoremap <C-q> <Esc>
inoremap <C-s> <Nop>

set grepprg=rg\ --vimgrep\ --smart-case
set grepformat=%f:%l:%c:%m
command! -nargs=+ Grep silent execute 'grep! ' . <q-args> | copen | redraw!

" generate ctags based on pwd
noremap <leader>ct :!ctags -R .<CR>
nnoremap <leader>x :copen<CR>
nnoremap <leader>ff :find
nnoremap <leader>fg :Grep
nnoremap <leader>cd :cd

" tabs
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>s :tab split<CR>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<CR>

" find and replace
nnoremap <leader>r :%s/
vnoremap <leader>r :s/
" :%s/foo/bar/g       " g = replace all matches on a line
" :%s/foo/bar/c       " c = confirm each replacement
" :%s/foo/bar/gi      " g + i = replace all, ignore case
" :%s/foo/bar/gc      " g + c = replace all, confirm each
" :%s/foo/bar/gci     " g + c + i = replace all, confirm, ignore case
" :%s/foo/bar/i       " i = ignore case for first match per line
" :%s/foo/bar/I       " I = match case exactly (override ignorecase)
" :%s/foo/bar/n       " n = report number of matches only, no change
" :%s/foo/bar/e       " e = suppress errors (no 'pattern not found')
" :%s/foo/bar/p       " p = print each line after change
" :%s/foo/bar/#       " # = print each line after change (alternate)
" :%s/foo/bar/r       " r = replace one char only (rare)
" :%s/foo/bar/u       " u = undo as one block
" :%s/foo/bar/\=expr  " \=expr = use expression to compute replacement
" :%s/foo/bar/\~/     " \~ = toggle case of replaced text
"
" | Command   | Meaning               |
" | --------- | --------------------- |
" | `:%s`     | whole file            |
" | `:1,$s`   | same as `%s`          |
" | `:'<,'>s` | visual selection only |
" | `:.,$s`   | current line → bottom |
" | `:1,.s`   | top → current line    |
" ---------------------------

set timeout
set ttimeoutlen=0
set timeoutlen=800 " default is 1000 ms

" multiline (multi line) comment
inoremap ,/ /**/<Esc><Left>i

nnoremap zu zz14<C-e>

" -- recording --
" i maybe like recording
" do qa to record a seq of keys
" then ra to replay macro
" press q to record then attach it to a keybind
nnoremap r @

" I hit this a lot; begone background (fg fix)
nnoremap <C-Z> <Nop>
inoremap <C-Z> <Nop>
vnoremap <C-Z> <Nop>
cnoremap <C-Z> <Nop>

" date and time
inoremap <C-d> <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <C-t> <C-R>=strftime("%H:%M:%S")<CR>

command! Date put=strftime('%Y-%m-%d')
command! Timestamp put=strftime('%Y-%m-%d %H:%M:%S')

inoremap ,date <C-R>=strftime("%Y-%m-%d")<CR>
inoremap ,time <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" toggle captilization
nnoremap <C-z> ~h
vnoremap <C-z> g~

nnoremap <leader>\ :noh<CR>
nnoremap <leader>q :confirm close<CR>

" ---------- Helpful vim shortcuts ----------

" 1. Cursor pointer control
"
" g; and g, to move forward and backward through edit locations
" Ctrl+i and Ctrl+o to move forward and backward through the jump list
" `` and '' to swap between the last jump list positions
"
" zz - to move pov in middle of screen
" zt - to move pov in top of screen
"
" :%s/old/new/g       Replace all occurrences of 'old' with 'new' in entire file
" :s/old/new/g        Replace all occurrences of 'old' with 'new' in current line
" :%s/old/new/gi      Replace all occurrences, case-insensitive, entire file
" :%s/old/new/gc      Replace all occurrences with confirmation prompt
" :10,20s/old/new/g   Replace between lines 10 and 20

" -- Confirmation in gc mode --
" y    Yes, replace this match
" n    No, skip this match
" a    Replace all remaining without asking
" q    Quit substitution
" l    Replace this and quit

" -- Visual mode replace --
" 1. Select text in visual mode (v)
" 2. Press ':'
" 3. Type s/old/new/g and Enter

" . - Repeat last substitution command

" ce - when you want to replace the rest of a word.
" cw - when editing mid-word OR editing whitespace.
"
" ciw  - change word under cursor; enter insert mode
" caW  - change around WORD; includes surrounding whitespace, enter insert mode
" ci(  - change inside parentheses
" ca(  - change around parentheses (includes the parentheses)
" cib  - change inside parentheses (balanced)
" ci{  - change inside braces
" ca{  - change around braces (includes the braces)
" ci[  - change inside brackets
" ca[  - change around brackets (includes the brackets)
" ci"  - change inside double quotes
" ca"  - change around double quotes (includes the quotes)
" ci'  - change inside single quotes
" ca'  - change around single quotes (includes the quotes)

" v/d/c + iW - highlights strictly word sep by spaces

" viW  - visually select word under cursor lhs space, rhs space
" viw  - visually select word under cursor
" vaw  - visually select a word (includes surrounding whitespace)
" diw  - delete word under cursor; stay in normal mode
" diW  - delete WORD (to surrounding whitespace)
" dw   - delete from cursor to end of word

" vii  - visually select current indent block
" cii  - change current indent block
" dii  - delete current indent block
" cai  - change around indent block (includes the surrounding indent)

" c - change (delete text, then enter insert mode)
" d - delete (delete text, stay in normal mode)
" v - visual select (highlight text)
" y - yank (copy text)
" p - paste yanked or deleted text

" c and d are basically the same, c moves you into insert mode
" i vs a - 'i' = inside the object, 'a' = around the object (includes delimiters)
" this can be used with c, d, v, y, etc.
"
" d$						- delete from cursor to end of line

" ctrl+q					- gives visual block (i.e. like duplicated cursors)
" v + ctrl+q				- gives column block selection
"
" ctrl + d					- scroll down with key
" ctrl + u					- scroll up with key
" Shift + w					- move to next continuous word
" Shift + e					- move to next end of continuous word (basically like w/b/e but can
" just to next whitespace)
" ge						- go to prev end of word
"
" f + character				- targeted character jumps
" ;							- to go to next instance of target
" ,							- to go back to previous instance
"
" v + i + b - visual inside block
" v + i " - visual inside quotes
" v + i + [ - visual inside bracket, etc
" v + i + { - visual inside braces
"
" v + a + ... - visual around it
"
" / + word - search for word
" * - search for word in cursor
"
" ctrl + q + I + type your changes + esc + esc - gives you multiple line
" change for insertion (visual block mode)
"
" " ctrl + q + x - gives you multiple line
" change for deletion (visual block mode)
"
" " ctrl + q + I + type your changes + esc + esc - gives you multiple line
" change for insertion (visual block mode)
"
" shift + d - delete till the end of line
" shift + c to delete whole line and go into insert mode
"
" d + f + character - delets from cursor up to character inclusive
" or can do : dF, df, cf, cF, ct, cT, etc

" ylp or ylP - dup char under cursor and place

" f + char - jump forward to first occurence of char and jumps on char
" F + char - jump to first occurence of char and jumps on char
" t + char - jump forward to first occurence of char and jumps on before char
" T + char - jump to first occurence of char and jumps on before char
"
" can do v + f + char, c + f + char, d + f + char, r + f + char, etc
" to go from cursor to char for whatever operation!

" d + number + hjkl -> deletes number rows
" d + hjkl -> deletes whatever hjkl from cursor

" Ctrl+a increments number under cursor
" Ctrl+x decrements number under cursor
"
" yy yanks whole line
" yl yanks 1 char
" y$ yanks to end of line
" yw yanks work
" yW yanks work from space to space

" Offsets for /pattern searches in Vim
" /pattern/s      -> move to start of match
" /pattern/e      -> move to end of match

" /pattern/s+1    -> 1 char after start of match
" /pattern/s-1    -> 1 char before start of match

" /pattern/e+1    -> 1 char after end of match
" /pattern/e-1    -> 1 char before end of match

" /pattern/s+N    -> N chars after start of match
" /pattern/s-N    -> N chars before start of match

" /pattern/e+N    -> N chars after end of match
" /pattern/e-N    -> N chars before end of match

" /pattern/b+1    -> same as /s+1 (b = beginning of match)
" /pattern/b-1    -> same as /s-1

" /pattern        -> default: cursor at start of match
" ?pattern/e      -> search backward, land at end of match

" Notes:
" - offsets apply when pressing n / N as well
" - prefer /e instead of manual length offsets like /s+7
" - useful for precise cursor placement in repetitive navigation
"
"/\cfoo				-> \c forces the search to ignore case
"
"dt <char>					- delete forwards to char exclusive
"dT <char>					- delete backwards to char exclusive
"df <char>					- delete forwards to char inclusive
"dF <char>					- delete backwards to char inclusive

"! sends highlighted block through external command

" :sort n      " numeric sort
" :sort u      " unique
" :sort!       " reverse"
"
" pretty print json in vim
" | Command       | Scope          |
" | ------------- | -------------- |
" | `:%!jq .`     | whole file     |
" | `:'<,'>!jq .` | selection only |

" <leader>v9A <input>		- visual block for at end of line
"
" gx						- open url under cursor into browser
" gf						- open a file under cursor
" gv						- select previous visual

" g Ctrl-a					- increment many lines sequentially
" g Ctrl-x					- decrement many lines sequentially
"
"							captialization (can do a better custom job here)
" guw						- lowercase word
" gUw						- uppercase word
" guu						- lowercase entire line
" gUU   					- uppercase entire line
"
" gU + motion				- transform that range
" gu + motion				- transform that range
"
" g'						- go to the newer change location
" g;						- go to the previous change location
" gi						- place the cursor at the same position where it was left last time in the Insert mode
"
" visual mode + o			- switches cursor pos to top/bottom of selection

nnoremap J <C-e>
nnoremap K <C-y>
