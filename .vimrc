" don't bother with vi compatibility
"
set nocompatible

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  source ~/.vimrc.bundles.local
endif

call vundle#end()

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set autoindent                                               " automatically indent on new lines
set backspace=indent,eol,start                               " Makes backspace key more powerful
set backupcopy=yes                                           " see :help crontab
set directory-=.                                             " don't store swapfiles in the current directory
set nobackup                                                 " Don't create annoying backup files
set splitbelow                                               " Split horizontal windows below to the current windows
set noswapfile                                               " Don't use swapfile
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set listchars=trail:▫                                        " add special visible trailing char
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 4 spaces
set showcmd                                                  " Show me what I'm typing
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 4 spaces
set tabstop=2                                                " actual tabs occupy 4 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set autowrite                                                " Automatically save before :next, :make etc.
set nocursorcolumn                                           " speed up syntax highlighting
set nocursorline
set pumheight=10                                             " Completion window max size
set conceallevel=2                                           " Concealed text is completely hidden
" Enable basic mouse behavior such as resizing buffers.
set mouse=a

" keyboard shortcuts
let mapleader = ','
let maplocalleader = ','
nnoremap <leader>f :NvimTreeFindFile<CR>
nnoremap <leader>d :NvimTreeToggle<CR>
nnoremap <leader>] :TagbarToggle<CR>
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd BufNewFile,BufRead Fastfile set filetype

autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
