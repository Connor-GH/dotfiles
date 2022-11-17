set number
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd BufWritePre * :%s/\s\+$//e
endif
set mouse=n
map <ScrollWheelUp> k
map <ScrollWheelDown> j
