set nocompatible
set shell=/bin/sh
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage intself
Plugin 'VundleVim/Vundle.vim'
" Airline for fun statusline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" file browser plz
Plugin 'ctrlpvim/ctrlp.vim'
" badwolf is best theme
Plugin 'sjl/badwolf'
" birds-of-paradise theme :o vimcolors.com
Plugin 'ronny/birds-of-paradise.vim'
" hybrid same as vim-hybrid[line]
Plugin 'tpope/vim-surround'
" abolish... magic. case preserving replacement and magic.
Plugin 'tpope/vim-abolish'
" vim-bufferline
" Bundle 'bling/vim-bufferline'
Plugin 'jelera/vim-javascript-syntax'
" match closing braces
Plugin 'Raimondi/delimitMate'
"  buffergator
Plugin 'jeetsukumaran/vim-buffergator'
" vim-fish syntax
Plugin 'dag/vim-fish'
" vim-json syntax highlight
Plugin 'elzr/vim-json'
" vim indent guides
Plugin 'nathanaelkane/vim-indent-guides'
" css colors highlight
Plugin 'ap/vim-css-color'
" match html tags _always_
Plugin 'valloric/MatchTagAlways'
" ansible-vim syntax
Plugin 'pearofducks/ansible-vim'
" Base16 vim
Plugin 'chriskempson/base16-vim'
" proper vim indent for pep8
Plugin 'hynek/vim-python-pep8-indent'
" flake8 pep8 style checker
Plugin 'nvie/vim-flake8'
" tmuxline
Plugin 'edkolev/tmuxline.vim'
" tagbar -- class outline viewer
Plugin 'majutsushi/tagbar'
call vundle#end()

filetype on
set t_Co=256 " before unsetting need to map 256co to theme
let base16colorspace=256
set background=dark " needed by colorscheme
colorscheme base16-default

syntax on
set hidden

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab     " makes tabs spaces
"set noshowmode    " don't show default indicators
"let g:Powerline_symbols = 'unicode' " enable powerline unicode (no special font)
"let g:Powerline_theme = 'default'  " default theme is nice

let mapleader="," " make a sane choice for <LEADER>
set number
set relativenumber " show line nums
set showcmd " show bottom cmd
set laststatus=2 " needed for powerline
filetype indent plugin on " load filetype plugins
set wildmenu " visual autocomplete for cmd menu
set noshowmode " we have airline
set wildignore=*.o,*.obj,*.bak,*.exe " don't complete these things
set lazyredraw " don't always redraw.. should be faster
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< " show these when list is on
set backspace=indent,eol,start " what chars can we backspace over?
set autoindent " auto indent like code...
set nostartofline " `prevent cursor from changing current column when switching lines`
set confirm " PRESS ENTER TO CONFIRM
set noerrorbells visualbell " please no beeping dear lord!
set cmdheight=2 " two line cmd height
set notimeout ttimeout ttimeoutlen=0 "helps with macro input
set scrolloff=2 " move the screen when the cursor is +/- 2

set hlsearch " highlight matches
set incsearch " incremental matches
"set nomodeline " should be off... because?
" off bc of vuln but would like to use it locally. be careful!
set ignorecase " ignore case when searching...
set smartcase " except when we want it!
" turn off search hl
nnoremap <C-L> :nohl<CR><C-L>

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" https://github.com/chrissimpkins/Hack/issues/201
let g:airline_symbols.maxlinenr = ""

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='base16'


" use nearest .git as cwd
let g_ctrlp_working_path_mode = 'r'

let g:buffergator_supress_keymaps = 1

nmap <LEADER><TAB> :BuffergatorMruCycleNext<CR>
nnoremap <silent><F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>``

" show current cursor column
map <LEADER>c :set cursorcolumn!<CR>
" regenerate ctags...
"map <F5> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" toggle paste/nopaste
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

"" set fold
"set foldenable
"set foldmethod=syntax
"nnoremap <SPACE> za

" mappings!
"
vnoremap > >gv
vnoremap < <gv
nmap j gj
nmap k gk
inoremap \\ <ESC>
nmap <LEADER>l :set list!<CR>
map Y y$

map <F2> :TagbarToggle<CR>
" cool! highlight last chars in insert mode :D
nnoremap gV `[v`]

" shift over hjkl to jkl; so it's on where fingers rest on home row...

noremap <C-W>n <C-W>h
noremap <C-W>e <C-W>j
noremap <C-W>i <C-W>k
noremap <C-W>o <C-W>l

noremap gg=G gg=G``zz
"noremap ; l
"noremap l k
"noremap k j
"noremap j h

" hjkl => neio
noremap n h
noremap e j
noremap i k
noremap o l

" h insert, k open below (kudaru), j end, l repeat (l)ast
noremap h i
noremap j e
noremap k o
noremap K O
noremap l n

map ; :
noremap ;; ;
" important make commands!
command! Make execute "!cd %:p:h && make && make install"
command! Test execute "!cd %:p:h && make && make test"
map <F8> :Make<CR>
map <F9> :Test<CR>

cmap w!! w !sudo tee > /dev/null %

" omni complete
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" auto reload vimrc
autocmd! bufwritepost .vimrc source %

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" python file type fix triple quote behaviour
au FileType python let b:delimitMate_nesting_quotes = ['"']
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
   let myUndoDir = expand(vimDir . '/undodir')
   " Create dirs
   if !isdirectory(myUndoDir)
       call system('mkdir -p' . myUndoDir)
   endif
   let &undodir = myUndoDir
   set undofile
endif

function! g:ToggleColorColumn()
   if &colorcolumn != ''
      setlocal colorcolumn&
   else
      setlocal colorcolumn=80
   endif
endfunction

nnoremap <silent> <leader>p :call g:ToggleColorColumn()<CR>
let g:ctrlp_root_markers = ['pom.xml']

