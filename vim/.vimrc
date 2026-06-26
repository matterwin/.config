let mapleader = " "

"source ~/.vimrc
" --------------------------------------- "
" Installs

" To install Vim with GTK3 on a new machine, run these commands:
" sudo add-apt-repository ppa:jonathonf/vim
" sudo apt update
" sudo apt install vim-gtk3

" Plugins --------------------------------------- "
"
" Must have plugins
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'rking/ag.vim'
" Plug 'farmergreg/vim-lastplace'
" Plug 'preservim/nerdtree'

" Lsp plugins
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" PlugInstall --------------------
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" switched to netrw
" Plug 'preservim/nerdtree'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'rking/ag.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'google/vim-searchindex'

" Aesthetics
Plug 'ap/vim-css-color'
Plug 'kshenoy/vim-signature'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/vim-gitbranch'
Plug 'NLKNguyen/papercolor-theme'
Plug 'crusoexia/vim-monokai'
Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pkradiator/netrw-file-icons'
Plug 'ryanoasis/vim-devicons'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Yggdroot/hiPairs'

" Academic
Plug 'lervag/vimtex'
Plug 'preservim/vim-markdown'

" Lsp plugins
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'dense-analysis/ale'
call plug#end()
" ---------------------------------

" :let g:use_markdown = 1
" :let g:use_markdown = 0

"Unbind section

" disable predefined C-w, includes: splits, etc
" nnoremap <C-w> <Nop>
" vnoremap <C-w> <Nop>
" xnoremap <C-w> <Nop>
" onoremap <C-w> <Nop>
" tnoremap <C-w> <Nop>

map <C-w> <Nop>
map Q <Nop>

nnoremap <C-1> :echo "hello"<CR>

let g:asyncomplete_auto_popup = 1

"" Vim Lsp:
filetype plugin on
" copied (almost) directly from the vim-lsp docs:
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled (set the lsp shortcuts) when an lsp server
    " is registered for a buffer.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if executable('rust-analyzer')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'rust-analyzer',
		\ 'cmd': {server_info->['rust-analyzer']},
		\ 'whitelist': ['rust'],
	\ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': ['clangd',
        \         '--header-insertion=never',
        \         '--compile-commands-dir=.',
        \ ],
        \ 'allowlist': ['c', 'cpp'],
    \ })
endif

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('pyright-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyright',
        \ 'cmd': {server_info->['pyright-langserver', '--stdio']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': ['gopls'],
        \ 'whitelist': ['go'],
    \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'tsserver',
        \ 'cmd': ['typescript-language-server', '--stdio'],
        \ 'whitelist': ['javascript', 'typescript'],
    \ })
endif

if executable('jdtls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'jdtls',
        \ 'cmd': ['jdtls'],
        \ 'whitelist': ['java'],
    \ })
endif

" :echo executable('rust-analyzer')
" :echo executable('clangd')
" :echo executable('pylsp')
" :echo executable('gopls')
" :echo executable('typescript-language-server')
" :echo executable('jdtls')

" Keybindings for LSP features
nnoremap gd :LspDefinition<CR>
nnoremap gD :LspDeclaration<CR>
nnoremap gi <plug>(lsp-implementation)
nnoremap H :LspHover <CR>
nnoremap gr :LspReferences<CR>
" nnoremap <leader>rn :LspRename<CR>
" nnoremap <leader>e :LspDiagnostic<CR>
" nnoremap <leader>f :LspFormat<CR>
" nnoremap ]d :LspDiagnosticNext<CR>
" nnoremap [d :LspDiagnosticPrev<CR>
nnoremap ]e :LspDiagnosticNext<CR>
nnoremap [e :LspDiagnosticPrev<CR>

let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_enabled = 0
set signcolumn=no
set foldcolumn=0

" let g:lsp_hover_conceal = 0


" function! ToggleLspDiagnostics()
"   if g:lsp_signs_enabled
"     " Turn off signs and diagnostics
"     let g:lsp_diagnostics_enabled = 0
"     let g:lsp_signs_enabled = 0
"     set signcolumn=no
"     set foldcolumn=0
"     echom "LSP Diagnostics OFF"
"     silent! execute('sign unplace * group=lsp')
"   else
"     " Turn on signs and diagnostics
"     let g:lsp_diagnostics_enabled = 1
"     let g:lsp_signs_enabled = 1
"     set signcolumn=yes
"     set foldcolumn=1
"     echom "LSP Diagnostics ON"
"     " Refresh signs so you see current errors/warnings
"     silent! call lsp#diagnostics#refresh()
"   endif
" endfunction
" nnoremap <leader>ld :call ToggleLspDiagnostics()<CR>

" let g:ale_linters_explicit = 1
let g:ale_enabled = 0
let g:ale_linters = {}
set signcolumn=yes

function! ToggleALEWithSigns()
  if g:ale_enabled
    let g:ale_enabled = 0
    let g:ale_linters_explicit = 1
    let g:ale_linters = {}
    call ale#engine#CleanupEveryBuffer()
    call ale#highlight#UpdateHighlights()
    for buf in range(1, bufnr('$'))
        if bufloaded(buf)
            call ale#virtualtext#Clear(buf)
        endif
    endfor
    silent! execute('sign unplace * group=ale')
    echom "ALE: Disabled"
  else
    let g:ale_enabled = 1
    let g:ale_linters_explicit = 0
    silent! ALELint
    echom "ALE: Enabled"
  endif
endfunction

nnoremap <leader>a :call ToggleALEWithSigns()<CR>

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" Aesthetics
set laststatus=2

set backspace=indent,eol,start

" VimTeX settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'
let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_mappings_enabled = 0
let g:vimtex#digestif#enabled = 0
nnoremap \vc :VimtexCompile<CR>
nnoremap \vv :VimtexView<CR>

" sudo apt install texlive-latex-base latexmk zathura zathura-pdf-poppler
" To compile: latexmk -pdf main.tex or pdflatex main.tex
" To view pdf: zathura main.pdf & or explorer.exe main.pdf (this is for wsl)

set hlsearch
set incsearch

" ------------------------------
" Statusline config (bottom bar and tabs)
" ------------------------------

let g:visual_char_count = ''

let g:lightline = {
	\ 'colorscheme': 'mytheme',
	\ 'active': {
	\   'left': [['filename', 'gitbranch', 'readonly']],
	\   'right': [ ['lineinfo'], ['percent'], ['filetype'], ['searchindex'], ['visualcount'] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'gitbranch#name',
	\   'filename': 'LightlineFilename',
	\   'searchindex': 'LightlineSearchIndex',
	\   'visualcount': 'LightlineVisualCount'
	\ },
	\ }

function! UpdateVisualCount()
  if mode() =~# '[vV\<C-v>]'

    " force visual marks update
    normal! gv

    let l:start = line("'<")
    let l:end   = line("'>")

    let l:lines = getline(l:start, l:end)
    let l:text = join(l:lines, "\n")

    let g:visual_char_count = strlen(l:text)

  else
    let g:visual_char_count = ''
  endif
endfunction

function! LightlineSearchIndex() abort
  if !v:hlsearch
    return ''
  endif

  " Get [current, total] from vim-searchindex
  let counts = searchindex#MatchCounts()
  if empty(counts) || counts[1] == 0
    return ''
  endif

  return printf('%d/%d', counts[0], counts[1])
endfunction

function! LightlineFilename()
    let l:fname = expand('%:t')
    if l:fname == ''
        let l:fname = '[No Name]'
    endif

    if &modified
        let l:fname .= ' [+]'
    endif

    return l:fname
endfunction

" === Lightline basic colors for tabline ===
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" --- Statusline ---
let s:p.normal.left   = [ ['black', 'white', 15, 238], ['black', 'white', 15, 238] ]
let s:p.normal.middle = [ ['black', 'white', 15, 238] ]
let s:p.normal.right  = [ ['black', 'white', 15, 238] ]

" a way to change other colors for other modes
" let s:p.visual.left   = [ ['black', 'white', 142, 238], ['black', 'white', 15, 238] ]

let s:p.inactive.left   = [ ['black', 'white', 'black', 238 ] ]
let s:p.inactive.middle = [ ['black', 'white', 'black', 238 ] ]
let s:p.inactive.right  = [ ['black', 'white', 'black', 238 ] ]

" --- Tabline ---
" Active tab
let s:p.tabline.tabsel = [ ['black', 'white', 15, 238] ]

" Inactive tabs
let s:p.tabline.left   = [ ['white', 'grey', 'grey', 'NONE'] ]
let s:p.tabline.middle = [ ['white', 'grey', 'grey', 'NONE'] ]
let s:p.tabline.right  = [ ['white', 'grey', 'grey', 'NONE'] ]

" Apply palette
let g:lightline#colorscheme#mytheme#palette = lightline#colorscheme#fill(s:p)
let g:lightline.colorscheme = 'mytheme'

let g:lightline.tabline_separator = { 'left': '', 'right': '' }
let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

" Always show tabline
set showtabline=2

" function! LightlineFilename()
"   return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
"         \ &filetype ==# 'unite' ? unite#get_status_string() :
"         \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
"         \ LightlineTruncatePath(expand('%:p'))
" endfunction

function! LightlineTruncatePath(fullpath)
  if empty(a:fullpath)
    return '[No Name]'
  endif

  let trimmed = substitute(a:fullpath, '^' . $HOME . '/', '', '')
  let pathParts = split(trimmed, '/')

  return len(pathParts) > 2 ? join(pathParts[-2:], '/') : trimmed
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Get rid of ^M chars after pasting
" :%s/\r//g

" disable case keybinds
xnoremap u <Nop>
xnoremap U <Nop>

" fzf
" Keybinding for fuzzy file search
nnoremap <C-p> :Files<CR>
" nnoremap <C-f> :Lines<CR>
" nnoremap <C-b> :Buffers<CR>
" nnoremap <C-t> :Tags<CR>

let g:fzf_layout = { 'down': '60%' }

" command! -bang -nargs=* Tags
"     \ call fzf#vim#tags('', fzf#vim#with_preview(), <bang>0)

" ctags -R .

" vim-tmux-navigator configuration
let g:tmux_navigator_no_mappings = 1
nnoremap <C-j> :TmuxNavigateDown<CR>
nnoremap <C-h> :TmuxNavigateLeft<CR>
nnoremap <C-k> :TmuxNavigateUp<CR>
nnoremap <C-l> :TmuxNavigateRight<CR>

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <Esc> <C-\><C-n>

" tnoremap <C-n> <C-\>

" " Normal mode
" nnoremap <C-M-h> :TmuxNavigateLeft<CR>
" nnoremap <C-M-j> :TmuxNavigateDown<CR>
" nnoremap <C-M-k> :TmuxNavigateUp<CR>
" nnoremap <C-M-l> :TmuxNavigateRight<CR>

" " Visual mode
" vnoremap <C-M-h> :TmuxNavigateLeft<CR>
" vnoremap <C-M-j> :TmuxNavigateDown<CR>
" vnoremap <C-M-k> :TmuxNavigateUp<CR>
" vnoremap <C-M-l> :TmuxNavigateRight<CR>

" " Insert mode
" inoremap <C-M-h> <Esc>:TmuxNavigateLeft<CR>i
" inoremap <C-M-j> <Esc>:TmuxNavigateDown<CR>i
" inoremap <C-M-k> <Esc>:TmuxNavigateUp<CR>i
" inoremap <C-M-l> <Esc>:TmuxNavigateRight<CR>i

" " Terminal mode
" tnoremap <C-M-h> <C-\><C-n>:TmuxNavigateLeft<CR>
" tnoremap <C-M-j> <C-\><C-n>:TmuxNavigateDown<CR>
" tnoremap <C-M-k> <C-\><C-n>:TmuxNavigateUp<CR>
" tnoremap <C-M-l> <C-\><C-n>:TmuxNavigateRight<CR>

" search next/prev and center it
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap # #zzzv
nnoremap * #zzzv

" vim-sneak
let g:sneak#s_next = 1
let g:sneak#label = 1

xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F

" nnoremap <C-f> yl:normal f<C-r>0<CR>
" nnoremap <C-F> yl:normal F<C-r>0<CR>

" f/t  → tiny movement (single char)
" s    → medium teleport (2 chars)
" /    → full search

" keep capslock as fn1 and do esc mode fn1 + w which will be ctrl+w for othernkeyboar

" ag.vim
" Used to searching for words in files fast
" Need this to ag
" brew install the_silver_searcher
" nnoremap <C-h> :Ag<CR>
"
" runs immediately over word
" nnoremap <C-g> :silent Ag<CR>
"
" prompts for pattern in cwd
" nnoremap <C-g>g :Ag<Space>

function! AgCursorWord()
    execute 'Ag ' . expand('<cword>')
endfunction

nnoremap <C-g> :call AgCursorWord()<CR>

" command! -nargs=+ Ag
"       \ call fzf#vim#grep(
"       \   'ag --vimgrep --no-heading --smart-case '.shellescape(<q-args>), 1,
"       \   {'options': '--ansi'}, 0)

" nnoremap <C-g> :call fzf#vim#grep('ag --vimgrep --no-heading --smart-case '.input('Ag: '), 1, {'options':'--ansi'}, 0)<CR>

" nnoremap <C-g> :Rg<Space>
" nnoremap <leader>rr :Rg<Space>

" vim-commentary
" gcc

" nerdtree
let NERDTreeShowHidden=1
" map <C-n> :NERDTreeToggle<CR>

" static width
" let g:NERDTreeWinSize = 40

" dynamic width
function! s:NERDTreeWidthPct(pct)
let g:NERDTreeWinSize = float2nr(&columns * a:pct) 
endfunction
autocmd VimEnter * call s:NERDTreeWidthPct(0.7) 

" line numbers
autocmd FileType nerdtree let b:nerdtree_has_number = &number | setlocal nonumber relativenumber
autocmd BufLeave * if exists("b:nerdtree_has_number") | setlocal number | unlet b:nerdtree_has_number | endif

" Prompt for folder and open NERDTree there
function! PromptNERDTreeDir()
    " Prompt user for folder path
    let l:path = input('NERDTree folder: ', '', 'dir')
    " Only continue if user typed something
    if l:path != ''
        " Change Vim cwd
        execute 'cd' fnameescape(l:path)
        " Open NERDTree rooted at that folder
        execute 'NERDTree' fnameescape(l:path)
    endif
endfunction

" Map <leader>e to call the prompt function
" nnoremap <leader>e :call PromptNERDTreeDir()<CR>

" <C-n>      Toggle NERDTree open/close
" <leader>e  Focus NERDTree on current file (opens if closed)
" <Enter>    Open file / enter folder
" v          Open file in vertical split
" s          Open file in horizontal split
" t          Open file in new tab
" k / j      Move cursor up / down
" u          Go to parent directory
" C          Change NERDTree root to folder under cursor (updates Vim cwd if enabled)
" :NERDTreeChDir  Change Vim cwd to selected folder
" I          Toggle hidden files
" R          Refresh tree
" /          Search for a file/node
" p / P      Jump to sibling / previous node
" <leader>c  Jump Vim cwd to current file’s folder (:cd %:p:h)
" x          Collapse current folder

" --------------------------------

" MAPPINGS AND SETTINGS VIM"
set relativenumber
set number

set nopaste
" highlight Visual guifg=#FFFFFF guibg=#111111

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

" add in C-9 in insert mode to go to back of sentence
" and also C-0 to go back to front of sentence

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
" :nnoremap <Enter> o<Esc>

inoremap ,b( \Big(  \Big)<Left><Left><Left>
inoremap ,b9 \Big(  \Big)<Left><Left><Left>
inoremap ,b[ \Big[  \Big]<Left><Left><Left>
inoremap ,b{ \Big\{  \Big\}<Left><Left><Left>
inoremap ,ss \subsection*{}<Left>
inoremap ,pg \paragraph{}<Left>
inoremap ,tt \text{}<Left>
inoremap ,ti \textit{}<Left>
inoremap ,it \item
inoremap ,pb \pbreak
inoremap ,np \newpage

" ) can be replaced with anything, ex: . to make a. instead of a)
inoremap ,ba \begin{enumerate}[label=\alph*)]<CR><CR>\end{enumerate}<Esc>kA
inoremap ,bA \begin{enumerate}[label=\Alph*)]<CR><CR>\end{enumerate}<Esc>kA
inoremap ,be \begin{enumerate}<CR><CR>\end{enumerate}<Esc>kA
inoremap ,bi \begin{itemize}<CR><CR>\end{itemize}<Esc>kA
inoremap ,bq \begin{quote}<CR><CR>\end{quote}<Esc>kA
inoremap ,bc \begin{center}<CR><CR>\end{center}<Esc>kA
inoremap ,bv \begin{verbatim}<CR><CR>\end{verbatim}<Esc>kA
inoremap ,eq \begin{equation*}<CR><CR>\end{equation*}<Esc>kA
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
" inoremap ,\ \[  \]<Left><Left><Left>
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



" \begin{itemize}
" \begin{itemize}
" \end{itemize}
" \end{itemize}

" doesnt work cause matchpairs needs asymmetric chars, so not $
" set matchpairs+=$:$

" do C-backspace to delete in insert mode and normal mode
" something like 
" " Normal mode: Ctrl+Backspace acts like d
" nnoremap <C-H> d

" " Insert mode: Ctrl+Backspace deletes previous word
" inoremap <C-H> <C-W>

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

" Highlights "
" highlight Visual ctermbg=black guibg=black

" window "
set splitbelow
set splitright
set noswapfile

" marks 
nnoremap <leader>m :marks<CR>
nnoremap <leader>M :SignatureToggle<CR>
nnoremap ' `
" nnoremap m `

function! JumpToExactMark()
  let c = nr2char(getchar())   " get the mark letter
  execute "normal! `" . c . "zz"
endfunction

nnoremap m :call JumpToExactMark()<CR>

function! SetMark()
  let c = nr2char(getchar())

  " set mark
  execute 'normal! m' . c

  " refresh vim-signature
  execute 'SignatureRefresh'
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

" terminal splits
nnoremap <leader>H :leftabove vert term<CR>
nnoremap <leader>L :rightbelow vert term<CR>
nnoremap <leader>J :belowright term<CR>
nnoremap <leader>K :aboveleft term<CR>

" Open terminal splits using Shift + H/J/K/L (rather do something else)
" nnoremap <C-S-H> :leftabove vert term<CR>
" nnoremap <C-S-L> :rightbelow vert term<CR>
" nnoremap <C-S-J> :belowright term<CR>
" nnoremap <C-S-K> :aboveleft term<CR>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" inoremap <C-w> <Esc>
" tnoremap <C-w> <C-\><C-n>
" vnoremap <C-w> <Esc>
" nnoremap <C-w> <Esc>

nnoremap <leader>v <C-q>
inoremap <C-q> <Esc>
tnoremap <C-q> <C-\><C-n>
vnoremap <C-q> <Esc>
nnoremap <C-q> <Esc>

" better
tnoremap <C-q> <Esc><C-\><C-n>

nnoremap <leader>k :topleft split<CR>
nnoremap <leader>j :botright split<CR>
nnoremap <leader>h :topleft vsplit<CR>
nnoremap <leader>l :botright vsplit<CR>

" Resize splits with Alt + Shift + Arrows
nnoremap <M-S-Up>    :resize +2<CR>
nnoremap <M-S-Down>  :resize -2<CR>
nnoremap <M-S-Right> :vertical resize -2<CR>
nnoremap <M-S-Left>  :vertical resize +2<CR>

" Tabs "
filetype on
filetype plugin indent on
" set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set autoindent
set smartindent

" Shift lines up s theand down in visual mode (selected lines)
vnoremap <S-k> :move '<-2<CR>gv
vnoremap <S-j> :move '>+1<CR>gv

" Shift lines left and right in visual mode (selected lines)
vnoremap <S-h> <gv
vnoremap <S-l> >gv

nnoremap 9 $
vnoremap 9 $
onoremap 9 $

" just do d9
" nnoremap dt9 dt$

nnoremap D "_dd
nnoremap C cc
vnoremap d "_d

" nnoremap D "_D
" nnoremap dd "_dd
" vnoremap d "_d

" nnoremap H ^
" nnoremap L $

set cursorline
" set termguicolors
" syntax on

" syntax enable

" Correct :Grep command that runs silently and opens quickfix
" command! -nargs=+ Grep execute 'silent! grep! <q-args>' | execute 'copen'

" set grepprg=rg\ --vimgrep\ --smart-case
" set grepformat=%f:%l:%c:%m
" command! -nargs=+ Grep silent execute 'grep! ' . <q-args> | copen | redraw!

nnoremap <leader>uv :e ~/.vimrc<CR>
nnoremap <leader>uV :source ~/.vimrc<CR>

nnoremap <leader>ut :e ~/.tmux.conf<CR>
nnoremap <leader>uT :call setreg('+', 'tmux source-file ~/.tmux.conf')<CR>

nnoremap <leader>uh :e ~/.config/hypr/<CR>
nnoremap <leader>uk :e ~/.config/kitty/kitty.conf<CR>

nnoremap <C-n> :call ToggleEx()<CR>
" nnoremap <C-n> :Lexplore<CR>

function! ToggleEx()
  if &filetype ==# 'netrw'
    buffer #
  else
    Ex
  endif
endfunction

" turn to 0 to make it cwd
let g:netrw_keepdir = 1
let g:netrw_banner = 0

" netrw_liststyle options:
" 0 = Thin  - simple one-file-per-line list (default)
" 1 = Long  - filename + file size + date
" 2 = Wide  - multiple files per line, column layout
" 3 = Tree  - NERDTree-style expandable tree
let g:netrw_liststyle = 3

" netrw_browse_split options (where files open on Enter):
" 0 = same window (replaces netrw)
" 1 = horizontal split
" 2 = vertical split
" 3 = new tab
" 4 = previous window (most like NERDTree side panel)
let g:netrw_browse_split = 0
" let g:netrw_winsize = '50%'

autocmd FileType netrw nnoremap <buffer> <C-h> <C-w>h
autocmd FileType netrw nnoremap <buffer> <C-j> <C-w>j
autocmd FileType netrw nnoremap <buffer> <C-k> <C-w>k
autocmd FileType netrw nnoremap <buffer> <C-l> <C-w>l
autocmd FileType netrw setlocal number relativenumber

function! NetrwCollapseAll()
  if exists('g:netrw_treedict')
    unlet g:netrw_treedict
  endif
  let cwd = getcwd()
  bunload
  execute 'Explore' cwd
endfunction

augroup netrw_maps
    autocmd!
    autocmd FileType netrw nmap <buffer> cd gn
    autocmd FileType netrw nmap <buffer> cc <CR>
    autocmd FileType netrw nmap <buffer> cC  :call NetrwCollapseAll()<CR>
	autocmd FileType netrw nmap <buffer> nf %
	autocmd FileType netrw nmap <buffer> nd d
augroup END

let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

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

" ------- COLORSCHEME

" built into vim
" colorscheme retrobox

" Dark mode -- Gruvbox
set background=dark

" Enable Gruvbox customizations
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_invert_selection=0
let g:gruvbox_transparent_bg=0
let g:gruvbox_contrast_dark="soft"

colorscheme gruvbox
syntax enable
" Load Gruvbox

" " Optional overrides after loading the scheme
autocmd ColorScheme gruvbox hi Comment ctermfg=grey
highlight SignColumn guibg=NONE ctermbg=NONE

" gets rid of bg color
highlight Normal guibg=NONE ctermbg=NONE
" highlight SignColumn guibg=NONE ctermbg=NONE
" highlight LineNr guibg=NONE ctermbg=NONE
" highlight FoldColumn guibg=NONE ctermbg=NONE
" highlight VertSplit guibg=NONE ctermbg=NONE
" highlight StatusLine guibg=NONE ctermbg=NONE
" highlight StatusLineNC guibg=NONE ctermbg=NONE

" colorscheme monokai

" Light mode -- PaperColor
" set background=light
" set t_Co=256
" colorscheme PaperColor

set mouse=a
" set ttymouse=

" Disable Ctrl+S in insert mode completely
" iunmap <C-s>

" Yggdroot/indentLine
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_char = '┊'
" let g:indentLine_enabled        = 1      " enable indent lines
" let g:indentLine_setColors      = 1      " enable colors
" let g:indentLine_showFirstIndentLevel = 1 " show first indent
let g:indentLine_setConceal = 0
" let g:indentLine_concealcursor = ''

" set list
" set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,space:·
" set list
" set listchars=eol:┊,tab:┊-,trail:·
" hi whitespacewarning guibg=orange ctermbg=red
" match whitespacewarning /\t\|\s\+$/

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

" let g:tab_mode = 0
" let g:tab_timer = -1

" function! TabUnlock(timer)
"     let g:tab_mode = 0
" 	let g:tab_timer = -1
"     echo "Tab unlock"
" endfunction

" function! TabLock()
"     let g:tab_mode = 1
"     echo "Tab lock (3s)"

"     " reset timer if already running
"     if g:tab_timer != -1
"         call timer_stop(g:tab_timer)
"     endif

"     let g:tab_timer = timer_start(3000, function('TabUnlock'))
" endfunction

" function! GoTab(n)
"     execute a:n . "tabn"
" endfunction

" function! HandleTabKey(n)
"     call GoTab(a:n)
" endfunction

" nnoremap <Tab> :call TabLock()<CR>

" nnoremap <expr> 1 g:tab_mode ? ":call HandleTabKey(1)<CR>" : "1"
" nnoremap <expr> 2 g:tab_mode ? ":call HandleTabKey(2)<CR>" : "2"
" nnoremap <expr> 3 g:tab_mode ? ":call HandleTabKey(3)<CR>" : "3"
" nnoremap <expr> 4 g:tab_mode ? ":call HandleTabKey(4)<CR>" : "4"
" nnoremap <expr> 5 g:tab_mode ? ":call HandleTabKey(5)<CR>" : "5"
" nnoremap <expr> 6 g:tab_mode ? ":call HandleTabKey(6)" : "6"
" nnoremap <expr> 7 g:tab_mode ? ":call HandleTabKey(7)" : "7"
" nnoremap <expr> 8 g:tab_mode ? ":call HandleTabKey(8)" : "8"
" nnoremap <expr> 9 g:tab_mode ? ":call HandleTabKey(9)" : "9"

" ---------------------------

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

" sql ft (bs key to gain back C-c)
let g:ftplugin_sql_omni_key = '<C-j>'

set timeout
set ttimeoutlen=0
set timeoutlen=1000 " default is 1000 ms 
" set notimeout " breaks esc 

" multiline (multi line) comment
inoremap ,mc /**/<Esc><Left>i

nnoremap zu zz14<C-e>

" -- recording --
" disable recording
" nnoremap q <Nop>
" vnoremap q <Nop>
"
" i maybe like recording
" do qa to record a seq of keys
" then ra to replay macro
" press q to record then attach it to a keybind
nnoremap r @ 

" Map qd as Esc in all modes
" " nnoremap qd <Esc>
" inoremap qd <Esc>
" vnoremap qd <Esc>
" xnoremap qd <Esc>
" snoremap qd <Esc>
" onoremap qd <Esc>

" inoremap <A-q> <Esc>
" vnoremap <A-q> <Esc>
" xnoremap <A-q> <Esc>
" snoremap <A-q> <Esc>
" onoremap <A-q> <Esc>

set nrformats+=alpha

" I hit this a lot; begone background (fg fix)
nnoremap <C-Z> <Nop>
inoremap <C-Z> <Nop>
vnoremap <C-Z> <Nop>
cnoremap <C-Z> <Nop>
tnoremap <C-Z> <Nop>

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

" nnoremap <C-z> u
" inoremap <C-z> <C-o>u

nnoremap <leader>\ :noh<CR>
" nnoremap <Esc><Esc> :confirm bd<CR>
" nnoremap <Esc><Esc> :confirm tabclose<CR>
nnoremap <leader>q :confirm close<CR>

" nathanaelkane/vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 1
" let g:indent_guides_guide_size = 1
" let g:indent_guides_draw_blank = 0
" let g:indent_guides_auto_colors = 0

" nnoremap <leader>tl :colorscheme PaperColor<CR>
" nnoremap <leader>td :colorscheme gruvbox<CR>

" nnoremap <leader>bd :set background=dark<CR>
" nnoremap <leader>bl :set background=light<CR>

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

" maybe in the future make my own plugin for jumps back n forth !!!
" nnoremap <leader>y :call JumpLatexEnv()<CR>
" function! JumpLatexEnv()
"   let l:line = getline('.')
"   if l:line =~ '\\begin{'
"     let l:env = matchstr(l:line, '\\begin{\zs[^}]*')
"     execute 'normal! /\\end{' . l:env . '}<CR>'
"   elseif l:line =~ '\\end{'
"     let l:env = matchstr(l:line, '\\end{\zs[^}]*')
"     execute 'normal! ?\\begin{' . l:env . '}<CR>'
"   endif
" endfunction

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
"dt + <char> -> delete up to char going right
"df + <char> -> delete up to and including char going right
"dT + <char> -> delete up to char going left

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

" gv						- reselect last visual selection

" <leader>v9A <input>		- visual block for at end of line
"
" gx						- open url under cursor into browser 
" gf						- open a file under cursor
" gv						- select previous visual

" g Ctrl-a					- increment many lines sequentially
" g Ctrl-x					- decrement many lines sequentially
"
" guw						- lowercase word
" gUw						- uppercase word
" guu						- lowercase entire line
" gUU   					- uppercase entire line
"
" gU + motion				- transform that range
" gu + motion				- transform that range
"
" visual mode + o			- switches cursor pos to top/bottom of selection

" >>>>>>>>>> COLORS <<<<<<<<<<<<<
" --- Try vim-signature possible groups ---
" highlight SignatureMarkText ctermfg=yellow
highlight link SignatureMarkText GruvboxBlue
" highlight link SignatureMarkText WarningMsg
" highlight SignatureMarkLine ctermfg=yellow
" highlight link SignatureMarkLine GruvboxBlue
" highlight SignatureMarkTextHL ctermfg=yellow
" highlight SignatureMarkLineHL ctermfg=yellow

" 80 for blue
hi MatchParen ctermfg=109

let g:hiPairs_enable_matchParen = 1

let g:hiPairs_hl_matchPair = {
\ 'term'    : 'bold',
\ 'cterm'   : 'bold',
\ 'ctermfg' : '109',
\ 'ctermbg' : 'NONE',
\ 'gui'     : 'bold',
\ 'guifg'   : '#87AFAF',
\ 'guibg'   : 'NONE'
\ }

let g:hiPairs_hl_unmatchPair = {
\ 'term'    : 'bold',
\ 'cterm'   : 'bold',
\ 'ctermfg' : 'Black',
\ 'ctermbg' : '167',
\ 'gui'     : 'bold',
\ 'guifg'   : 'NONE',
\ 'guibg'   : 'NONE' 
\ }

" 80 electric blue
" #D75F5F or 167
" #87AFAF or 109
" #FBAC06 or 214
" #BF55EC or 135

" TODO
" do a keybind that can goto next synatx error via lsp

nnoremap J <C-e>
nnoremap K <C-y>

