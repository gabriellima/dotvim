
" Based on https://raw.github.com/MarcWeber/vim-addon-MarcWeber/master/autoload/vim_addon_MarcWeber.vim
" Linked from https://github.com/MarcWeber/vim-addon-manager/blob/master/doc/vim-addon-manager.txt

let s:thisf = expand('<sfile>')

fun! vim_addon_GabrielLima#Activate(vam_features)
  let g:vim_addon_urweb = { 'use_vim_addon_async' : 1 }
  let g:netrw_silent = 0
  let g:linux=1
  let g:config = { 'goto-thing-handler-mapping-lhs' : 'gf' }

"  let g:local_vimrc = {'names':['vl_project.vim']}

  let plugins = {
     \ 'always': [ 'github:scrooloose/nerdcommenter', 'github:scrooloose/nerdtree', 'github:tpope/vim-repeat', 'github:tpope/vim-surround', 'github:tpope/vim-unimpaired', 'github:godlygeek/tabular', 'github:garbas/vim-snipmate', 'github:honza/snipmate-snippets' ],
      \ 'python' : [],
      \ 'javascript' : ['jsbeautify'],
      \ }
  let activate = []
  for [k,v] in items(plugins)
    if k == 'always'
          \ || (type(a:vam_features) == type([]) && index(a:vam_features, k) >= 0)
          \ || (type(a:vam_features) == type('') && a:vam_features == 'all')
      call extend(activate, v)
    endif
  endfor

  " trailing-whitespace.vim
  " "yaifa",
  " "vim-addon-blender-scripting",
  " scion-backend-vim",
  " "JSON",
  " "vim-addon-povray",
  " "vim-addon-lout",

  call vam#ActivateAddons(activate,{'auto_install':1})

  "autocommands:"{{{
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
  "}}}e


  "imap <c-o> <c-x><c-o>
  "imap <c-_> <c-x><c-u>

  "noremap \sen :setlocal spell spelllang=en_us<cr>

  "noremap <leader>lt :set invlist<cr>
  "noremap <leader>iw :set invwrap<cr>
  "noremap <leader>ip :set invpaste<cr>
  "noremap <leader>hl :set invhlsearch<cr>
  "noremap <leader>dt :diffthis<cr>
  "noremap <leader>do :diffoff<cr>
  "noremap <leader>dg :diffget<cr>
  "noremap <leader>du :diffupdate<cr>
  "noremap <leader>ts :if exists("syntax_on") <Bar>
  "  \   syntax off <Bar>
  "  \ else <Bar>
  "  \   syntax enable <Bar>
  "  \ endif <CR>
  "inoremap <s-cr> <esc>o
  "exec "noremap <m-s-f><m-s-t><m-s-p> :exec 'e ".fnamemodify(s:thisf,':h:h')."/ftplugin/'.&filetype.'_mw.vim'<cr>"

  "augroup FOO
  "  autocmd BufRead,BufNewFile *.syn-test  set filetype=syn-test
  "augroup end

  "let g:snipMate = { 'scope_aliases' :
  "    \ {'objc' :'c'
  "    \ ,'cpp': 'c'
  "    \ ,'cs':'c'
  "    \ ,'xhtml': 'html'
  "    \ ,'html': 'javascript'
  "    \ ,'php': 'php,html,javascript'
  "    \ ,'ur': 'html,javascript'
  "    \ ,'mxml': 'actionscript'
  "    \ ,'haml': 'html,javascript'
  "    \ }}

endf
