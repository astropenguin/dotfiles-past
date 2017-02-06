" .vimrc

" edit
set modifiable
set fenc=utf-8
set autoread
set nobackup
set noswapfile
set hidden
set virtualedit=onemore
set clipboard+=unnamed
set backspace=indent,eol,start
set helplang=ja,en

" indent
set expandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" preferences
set number
set list
set wrap
set textwidth=0
set cursorline
set colorcolumn=80
set visualbell
set showmatch
set matchtime=1
set laststatus=2
set scrolloff=5
set listchars=eol:¬,tab:▸\
set pumheight=10

" search
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

" key mapping
nmap <C-j> <C-d>
nmap <C-k> <C-u>
nmap <S-j> <C-f>
nmap <S-k> <C-b>
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <ESC><ESC> :nohlsearch<CR>
inoremap <silent> jj <ESC>
nnoremap <silent> o :<C-u>call append(line("."), repeat([""], v:count1))
  \ \| silent! call repeat#set("o", v:count1)<CR>j
nnoremap <silent> O :<C-u>call append(line(".")-1, repeat([""], v:count1))
  \ \| silent! call repeat#set("O", v:count1)<CR>k

" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  echo "installing vim-plug\n"
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "successfully installed\n"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'kana/vim-smartinput'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/vim-auto-save'
Plug 'Yggdroot/indentLine'
Plug 'yonchu/accelerated-smooth-scroll'
call plug#end()

" color scheme
syntax enable

if has("termguicolors")
  set termguicolors
endif

if isdirectory(expand("~/.vim/plugged/onedark.vim"))
  colorscheme onedark
  let g:lightline = {'colorscheme': 'onedark'}
endif

" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

