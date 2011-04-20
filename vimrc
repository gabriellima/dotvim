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
