: source ~/.exrc

:set t_Co=256
:syntax on
:set nohls
:colorscheme darkblue
:set formatoptions=2coqr
:set comments=s1:/*,mb:*,xe:*/,://,n:#,:%,:XCOMM,n:>,fb:-
:set smarttab
:set shiftround
:set tildeop
:set modelines=5
:set nowrap
:set ruler
:filetype plugin indent on
:set iskeyword+=:
:hi MatchParen cterm=none ctermbg=none ctermfg=none
" this turns off the matchparen annoyance
:let g:loaded_matchparen=1
":let g:is_bash=1 "should not be needed with filetype plugin 

"put all swap files together in one place
if isdirectory($HOME . '.vim/swaps') == 0
    :silent !mkdir -p ~/.vim/swaps >/dev/null 2>&1
endif
set dir=~/.vim/swaps//

"put all backup files together in one place
if isdirectory($HOME . '.vim/backups') == 0
    :silent !mkdir -p ~/.vim/backups >/dev/null 2>&1
endif
set backupdir=~/.vim/backups//
set backup

"put all backup files together in one place
if isdirectory($HOME . '.vim/undos') == 0
    :silent !mkdir -p ~/.vim/undos >/dev/null 2>&1
endif
set undodir=~/.vim/undos//
set undofile

" yes, folding is good
set foldcolumn=4
set foldmethod=marker
set foldmarker=AAA,ZZZ

"abbreviations
:source ~/.vimrc-abbr
:source ~/.vimrc-maps
