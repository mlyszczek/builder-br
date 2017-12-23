""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'VundleVim/Vundle.vim'
"Plugin 'gnu-c'
Plugin 'Valloric/MatchTagAlways'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()            " required
filetype plugin indent on    " required

" call :PluginInstall to install new plugins

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set colorcolumn=80
set textwidth=80
set formatoptions-=t
set colorcolumn=+1,+41
set showmatch

set number
set splitbelow
set splitright
set laststatus=2
set t_Co=256

set list
set listchars=tab:> 

set spelllang=pl

hi clear SpellBad
hi SpellBad term=standout ctermfg=1 term=underline cterm=underline

let g:vim_markdown_folding_disabled = 1
set pastetoggle=<C-P>
nnoremap <S-W> :set fo+=a<CR>
nnoremap <C-W> :set fo-=a<CR>

nnoremap <S-M> :!make all<CR>
nnoremap <S-B> :buffers<CR>:buffer<Space>
nnoremap <S-H> :call HexMe()<CR>

nnoremap <S-C> :r ~/.vim/c/decor_comment<CR>
nnoremap <S-L> :r ~/.vim/c/license<CR>
nnoremap <S-S> :r ~/.vim/c/separator <CR>
nnoremap <C-J> :call Just()<CR>
vnoremap <C-J> :call JustV()<CR>
nnoremap <S-F> :call FigletComment("
nnoremap <C-C> :call CowsayComment("
nnoremap <C-F> 0j<C-V>k%kld

colorscheme stefan

function FigletComment(comment)
    read !echo "/* =========================================================================="
    let c=system("figlet -w78 -c -fslant -k " . a:comment)
    "let c=system("toilet -w78 -k -f slant " . a:comment)
    put =c
    read !echo "   ========================================================================== */"
endfunction

function CowsayComment(comment)
    read !echo "/* =========================================================================="
    let c=system("cowsay -W 60 -f $(ls /usr/share/cowsay-3.03/cows/ | shuf -n1) " . a:comment)
    put =c
    read !echo "   ========================================================================== */"
endfunction

function Just()
    set textwidth=76
    execute "normal {j0v%kgqgv_j"
    set textwidth=80
endfunction

function JustV()
    set textwidth=76
    execute "normal gvgqgv_j"
    set textwidth=80
endfunction

let $in_hex=0
function HexMe()
set binary
set noeol
if $in_hex>0
:%!xxd -r
let $in_hex=0
else
:%!xxd
let $in_hex=1
endif
endfunction

autocmd BufWritePre * %s/\s\+$//e
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

:runtime macros/justify.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gnu indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"setlocal cinoptions=>2s,e-s,n-s,f0,{s,^-s,:s,=s,g0,+.5s,p2s,t0,(0 cindent
setlocal fo-=t fo+=croql
setlocal comments=sO:*\ -,mO:\ \ \ ,exO:*/,s1:/*,mb:\ ,ex:*/
set cpo-=C
