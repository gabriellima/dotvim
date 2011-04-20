call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Enable tab and eol indications
" set list
" set listchars=tab:►\.
"

set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Improve the search
set incsearch
set hlsearch

if has ("autocmd")
  " Enable file type detection ('filetype on').
  filetype plugin indent on
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandta
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
endif

" Remove trailling spaces
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Break lines, but doesn't spill words  (nobreak is needed so that it don't
" spill words
set wrap linebreak nolist

" Bubble with the help of unimpaired
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" " Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Visually select the text that was last edited/pasted (because if I cut and
" paste it somewhere, the next simple 'gv' will select the wrong text)
nmap gV `[v`]

" Tabularize
let mapleader=','
nmap <Leader>t :Tabularize /
vmap <Leader>t :Tabularize /

" Map tab creation and close (also for last tab) - kind like firefox browser
" shortcuts
nmap <C-t> :tabnew<CR>
"nmap <C-w> :q<CR>   " because <C-w>q will close it anyway

" Map NERDTree show and hide
map <F2> :NERDTreeToggle<CR>
imap <F2> <Esc>:NERDTreeToggle<CR>
