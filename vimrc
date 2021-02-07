" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

color peachpuff
syntax enable
set foldmethod=marker
set foldmarker={{,}}

set rtp+=/usr/local/opt/fzf

" Settings From G0tM1lk
set number
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=4
nnoremap <space> za
set hlsearch
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
filetype on
filetype plugin on
set grepprg=grep\ -nH\ $*
set wildmenu

set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set mouse=a
