set nocompatible " Improved mode, req'd

set rtp+=~/.vim/bundle/Vundle.vim
filetype on " needed for stock vim on macOS to not exit 1"
filetype off

call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let vundle manage intself
Plugin 'tpope/vim-sensible' " good defaults  
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim' " best file searcher
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish' " case preserving :S/foo/bar/g
Plugin 'jiangmiao/auto-pairs' " auto ({[]})
Plugin 'dag/vim-fish' " fish syntax hl
Plugin 'elzr/vim-json' "json syntax hl
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'chriskempson/base16-vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
Plugin 'edkolev/tmuxline.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim' " comment with gc
Plugin 'ryanoasis/vim-devicons'
Plugin 'fatih/vim-go'
Plugin 'google/vim-jsonnet'
Plugin 'leafgarland/typescript-vim'
Plugin 'dracula/vim'
call vundle#end()

""let base16colorspace=256
""set background=dark " needed by colorscheme

"source ~/.vim/colorscheme.vim

""set termguicolors " use highlight-guifg/guibg in terminal
" - force 24bit color in IOS8613-3 compat terminal
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:dracula_colorterm = 0
let g:dracula_italic = 0 
color dracula
" for now we need this until hyper again supports truecolor
set hidden

set noshowmode " remove the bit at the bottom that says -- INSERT --
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab     " makes tabs spaces
"set noshowmode    " don't show default indicators
set mouse=a
let mapleader="\<Space>" " make a sane choice for <LEADER>
set number
set showcmd
set relativenumber " show line nums
set lazyredraw " don't always redraw.. should be faster
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux
set nostartofline " `prevent cursor from changing current column when switching lines`
set confirm " PRESS ENTER TO CONFIRM
set noerrorbells visualbell " please no beeping dear lord!
set cmdheight=2 " two line cmd height
set hlsearch " highlight matches
set ignorecase " ignore case when searching...
set smartcase " except when we want it!

" use nearest .git as cwd
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = 'rg --files %s --hidden'

nnoremap <LEADER>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>``

" show current cursor column
map <LEADER>c :set cursorcolumn!<CR>

" toggle paste/nopaste
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>

" mappings!
"
vnoremap > >gv
vnoremap < <gv
nmap j gj
nmap k gk
nmap <LEADER>l :set list!<CR>
" cool! highlight last chars in insert mode :D
nnoremap gV `[v`]

" shift over hjkl to jkl; so it's on where fingers rest on home row...

noremap <C-W>n <C-W>h
noremap <C-W>e <C-W>j
noremap <C-W>i <C-W>k
noremap <C-W>o <C-W>l

noremap <LEADER>g gg=G``zz

" hjkl => neio
noremap n h
noremap e j
noremap i k
noremap o l

"  h insert, k open below (kudaru), j end, l repeat (l)ast
noremap h i
noremap j e
noremap k o
noremap K O
noremap l n

map ; :
noremap ;; ;

cmap w!! w !sudo tee > /dev/null %

" ctrlp niceness
noremap <LEADER>v :CtrlPBuffer<CR>
noremap <LEADER>p :CtrlP<CR>

" jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" auto reload vimrc
autocmd! bufwritepost .vimrc source %

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let @q ='G2iA€kb:wq'
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

let g:syntastic_python_checkers = ['flake8', 'python']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:jsonnet_fmt_options = '-n 4'

let g:tcommentTextObjectInlinecomment = 'tc'
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
