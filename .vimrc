" ---------------------------------- VUNDLE -----------------------------------

" Required to make Vundle works
set nocompatible

" Fetch Plugins File
so ~/.vim/plugins.vim

" ------------------------------- CONFIGURATIONS -------------------------------

"Vim command to accept syntax configurations
syntax enable

" Make backspace behave like every other editor.
set backspace=indent,eol,start

" The default leader is \, but a comma is much better.
let mapleader = ','

" Make sure always Open new horizontal split screen below
set splitbelow

" Make sure always Open new vertical split screen on right
set splitright

" Remove bell sounds when type something wrong
set noerrorbells visualbell t_vb=

" Tab now idents as 4 spaces
set tabstop=4

" Sets the size of identation
set shiftwidth=4

" Sets the tab width in insert mode
set softtabstop=4

" Sets autocompletion list more efficient
set complete=.,w,b,u

" Ignores Case Sensitive in searchs
set ignorecase

" Enables mouse to copy to clipboard
set mouse=r

" Go to the next line even if text is to big
nnoremap j gj
nnoremap k gk

" Do not loose selection after indentation
vnoremap > >gv
vnoremap < <gv


" Unset Line Break for long lines
set nowrap



" ----------------------------------- PLUGINS -----------------------------------

"/
"/ CtrlP
"/

" Ignoring unwanted Results to List
set wildignore+=*/vendor/**,*/node_modules/**
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Setting search result and window positioning.
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,result:30'

" Search Files in project or folder
nmap <C-P> :CtrlP<cr>

" Move cursor to searched Tag inside file
nmap <C-R> :CtrlPBufTag<cr>
"
" List Most Recently Files to open
nmap <C-E> :CtrlPMRUFiles<cr>

"/
"/ NERDTree
"/

" Prevent conflicts between NERDTree and Vinegar
let NERDTreeHijackNetrw = 0

" Let NerdTree show hidden files
let NERDTreeShowHidden=1

"Make it easier to toggle.
nmap <C-K><C-B> :NERDTreeToggle<cr>

"/
"/ CTags
"/

" Search tags in whole project or folder
nmap <C-F> :tag<space>

" Go to Definition. Press Ctrl+T To go back
map <F12> <C-]>

" Update CTags to find new functions when CTRL+F
map <F5> :!ctags -R --exclude=node_modules --exclude=nova_components --php-kinds=cfi<cr><cr>

"/
"/ Greplace
"/

" Using Ag to the search method
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

nmap <Leader>h :Gsearch<cr>
nmap <Leader>r :Greplace<cr>

"/
"/ vim-php-namespace
"/

" Find and adds an use namespace in the header of file.
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <C-@> <Esc>:call IPhpInsertUse()<cr>
autocmd FileType php noremap <C-@> :call PhpInsertUse()<cr>

" Expand Class to its fullpath inline
function! IPhpExpandClass()
		call PhpExpandClass()
		call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<cr>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<cr>

"/
"/ PHP CS Fixer
"/

nnoremap <silent><F3> :call PhpCsFixerFixFile()<CR>

" Define default fixer Standard
let g:php_cs_fixer_level = "psr2"

"/
"/ PDV
"/

" Defines hotkey and set templates to code blocks
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>c :call pdv#DocumentWithSnip()<CR>

"/
"/ UltiSnips
"/

" Fix the conflict of snippets when pressing tab to next ocurrence
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"/
"/ Phpunit
"/

" the directory that contains your phpunit test cases.
let g:phpunit_testroot = 'tests'

" the directory that contains source files
let g:phpunit_srcroot = 'vendor/bin'

" the location of your phpunit file.
let g:phpunit_bin = 'phpunit'

" php unit command line options
let g:phpunit_options = ["--stop-on-failure"]

" Run all Test Cases
nnoremap <F1> :PHPUnitRunAll<CR>

" Switch between source & test file
nnoremap <Leader>tf :PHPUnitRunCurrentFile<CR>

" Run current test case class
nnoremap <Leader>ts :PHPUnitSwitchFile<CR>

" --------------------------------- APPEARANCE ---------------------------------

" Enable 256 Terminal colors
set t_CO=256
set termguicolors

" Enable best template crafted by man
colorscheme manojai

" Let's Activate line numbers
set number

" Set spaces between lines. Exclusive resource from mvim
set linespace=15

" Define font and font-size. Exclusive resource from mvim
set guifont=Roboto_mono:h11

"Disable GUI tabs on top of files
set guioptions-=e

" Remove Scrollbars. Exclusive resource from mvim
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Enables highlight search
set hlsearch

" Highlight the search while typing
set incsearch

" ---------------------------------- MAPPINGS -----------------------------------

" Defines Vertical SplitScreen
nmap <Leader>l :vsp<cr>

" Defines Horizontal SplitScreen
nmap <Leader>j :sp<cr>

" Remapping redo like any standard text editor
nmap <C-Y> :redo<cr>

" Remapping undo like any standard text editor
nmap <C-Z> :undo<cr>

" Add simple highlight removal
nmap <esc><esc> :nohlsearch<cr>

" Keymaps to move between screens using ctrl
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

nnoremap <C-d> <C-N>


" Make it easy to edit the Vimrc file
nmap <Leader>ev :e $MYVIMRC<cr>

" Easy helper to open snippets file
nmap <Leader>es :e ~/.vim/snippets/

" Command to refresh snippets after modification
nmap <Leader>rs :call ReloadAllSnippets()<cr>

" Sorts line by its length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Hotkey to identify the colorscheme syntax highlighting
map <F6> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Auto change directory to match curent file ,cd
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" ----------------------------------- MACROS ------------------------------------

" Add elements to construct and declare variables as protected
let @c = "yiw/__construct\<cr>j%O$this->\<esc>p\<esc>A = $\<esc>p\<esc>A;\<esc>/__construct\<cr>\<esc>kOprotected $\<esc>p\<esc>A;\<esc>O\<esc>/__construct\<cr>\<esc>\<esc>w%i"
nmap <F7> @c
imap <F7> <esc>@c


" ------------------------------- AUTO COMMANDS --------------------------------

" Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
