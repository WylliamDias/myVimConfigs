nnoremap <C-t> :tabnew<bar>:NERDTree<CR>
nnoremap <S-tab> gt
nnoremap <tab> gT

nnoremap <C-J> :m .+1<CR>== 
nnoremap <C-S-k> :m .-2<CR>==
inoremap <C-J> <Esc>:m .+1<CR>==gi
inoremap <C-S-k> <Esc>:m .-2<CR>==gi
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-1<CR>gv=gv

inoremap { {}<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap ' ''<left>
inoremap " ""<left>
inoremap ` ``<left>

set nowrap
set formatoptions-=t

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

let g:UltiSnipsExpandTrigger="<C-RIGHT>" 
let g:UltiSnipsJumpForwardTrigger="<C-DOWN>" 
let g:UltiSnipsJumpBackwardTrigger="<C-UP>"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:user_emmet_leader_key='<C-A>'
:set tabstop=2    
:set expandtab     
:set shiftwidth=2  
:set autoindent    
:set smartindent
:set nu rnu
so ~/.vim/plugins.vim
syntax enable
colorscheme dracula
" 212 dracula
hi tsxComponentName ctermfg=117
hi tsxCloseComponentName ctermfg=117
hi tsxTagName ctermfg=212

hi tsxCloseString ctermfg=212
hi tsxCloseTag ctermfg=15
hi tsxCloseTagName ctermfg=212
hi tsxAttributeBraces ctermfg=212
hi tsxEqual ctermfg=212
hi tsxAttrib ctermfg=84

let g:vim_jsx_pretty_disable_tsx = 1

