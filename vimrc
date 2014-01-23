"Show invisibles
set number
set nocompatible
set list
set listchars=tab:↠\ ,eol:↵,trail:∘

"Tabs and spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"Whitespace preferences and filetypes
filetype on
filetype plugin on
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noet
autocmd Filetype markdown setlocal ts=4 sts=4 sw=4 et
autocmd BufNewFile,BufRead *.js setfiletype javascript
autocmd BufNewFile,BufRead *.md setfiletype markdown

set hidden

"The :edit command
let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

noremap <silent> <buffer> zz :call Toggle_task_status()<CR>:w<CR>

syntax on
