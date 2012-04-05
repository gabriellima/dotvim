" vim power
set nocompatible

" call VAM (vim-addon-manager)
filetype off
let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'
"call vam#ActivateAddons([], {'auto_install' : 0})
filetype on
filetype plugin on
filetype plugin indent on


set number
set tabstop=2 "A four-space tab indent width
set shiftwidth=2 "This allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set smarttab "Use the "shiftwidth" setting for inserting <TAB>s instead of the "tabstop" setting, when at the beginning of a line.
set expandtab "Insert spaces instead of <TAB> character when the <TAB> key is pressed
set softtabstop=2 "When pressing BACKSPACE or DELETE does the right thing and will delete four spaces (assuming 4 is your setting)
set autoindent
"set list
"set listchars=tab:▸\ ,nbsp:¬

" disable automatic backup
set nobackup

" enable the x,y position display on the status bar
set ruler

" show statusbar with 2 lines
set laststatus=2

set ignorecase
set smartcase

" Improve the search
set incsearch
set hlsearch

" exclude unnecessary directories and files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

if has ("autocmd")
  " Enable file type detection ('filetype on').
  filetype plugin indent on
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  " Treat sh correctly
  autocmd FileType sh setlocal ts=4 sts=4 sw=4 expandtab
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml

  " Let VAM (vim-addon-manager) load by vim_addon_GabrielLima options
  " InstallAddons {name} instead of ActivateAddons {name}  to review addon first
  " ActivateInstalledAddons <Ctrl-d> autocomplete to activate installed addon
  " UpdateAddons {name}    and   UninstallNotLoadedAddons {name}
  call vim_addon_GabrielLima#Activate([])
  " this autocmd will let addons loading be dynamic, based on filetype
  autocmd FileType * call vim_addon_GabrielLima#Activate([strtrans(&ft)])
  "autocmd FileType python call vim_addon_GabrielLima#Activate(['python'])
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
:set showbreak=>\  wrap linebreak textwidth=0

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
nmap <Leader>a :Tabularize /
vmap <Leader>a :Tabularize /

" Map tab creation and close (also for last tab) - kind like firefox browser
" shortcuts
nmap <C-t> :tabnew<CR>
"nmap <C-w> :q<CR>   " because <C-w>q will close it anyway

" Map NERDTree show and hide
map <F2> :NERDTreeToggle<CR>
imap <F2> <Esc>:NERDTreeToggle<CR>

" Highlight trailing whitespaces and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" Only show up as soon as you leave insert mode, and apply to any opened
" buffer
autocmd BufWinEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Configure snipmate to use my name as author
let g:snips_author="Gabriel L. Oliveira"

" Speed up buffer switching {{{2
 map <C-k> <C-W>k
 map <C-j> <C-W>j
 map <C-h> <C-W>h
 map <C-l> <C-W>l

" map <C-m> to comment
map <C-m> :call NERDComment(0, 'invert')<cr>,gv

" Show TaskList
map T :TaskList<CR>
let g:tlTokenList = ['FIXME', 'TODO', 'XXX', 'IMPROVE']

" prevent doc pannel from showing when autocompleting
set completeopt-=preview

" set default colorscheme wanted
colorscheme peachpuff_modified

" set F4 to toogle number/nonumber
map <silent><F4> :set invnumber<CR>

" map copy,paste,cut to system clipboard
vnoremap <C-c> "+y
vnoremap y "+y
map <C-v> "+gP
cmap <C-v> <C-r>+
vnoremap <C-x> "+x
" Use CTRL-R to do what CTRL-V used to do
noremap <C-r> <C-v>
" select all text with <Ctrl-a>
nmap <C-a> ggVG
" TODO: HAVE A LOOK AT: /usr/share/vim/vim72/mswin.vim
