set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"cd Y:\r01_svn_of_scripter\develop\code_scripter\script_wow\scripts

if has("win32")
	set fileencoding=utf-8
else
	set fileencoding=utf-8
endif

language message zh_CN.utf-8

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

set nu!
colorscheme murphy

set tabstop=4
set shiftwidth=4
set bs=2
set ru
set incsearch
set showcmd
set nobackup
set textwidth=0
set wrap

set mouse=a
syntax on

set hlsearch

au GUIEnter * simalt ~x

set guioptions-=m
set guioptions-=T

set dir=d:/vimtmp

set guifont=Consolas:h11

function Search_Word()
	let w = expand("<cword>")
	exe "vimgrep /\\<" . w ."\\>/ **/*.py | copen"
endfunction
map ft :call Search_Word()<CR><CR>

map fn :call Pyflakes_neo()<CR><CR>
function Pyflakes_neo()
	exe "!python c:/Python27/Scripts/pyflakes Y:/r01_svn_of_scripter/develop/code_scripter/script_wow/scripts/client"
	exe "!python c:/Python27/Scripts/pyflakes Y:/r01_svn_of_scripter/develop/code_scripter/script_wow/scripts/moduc"
	exe "!python c:/Python27/Scripts/pyflakes Y:/r01_svn_of_scripter/develop/code_scripter/script_wow/scripts/moduk"
	exe "!python c:/Python27/Scripts/pyflakes Y:/r01_svn_of_scripter/develop/code_scripter/script_wow/scripts/typec"
	exe "!python c:/Python27/Scripts/pyflakes Y:/r01_svn_of_scripter/develop/code_scripter/script_wow/scripts/editor"
	exe "!start explorer Y:\\r01_svn_of_scripter\\develop\\code_scripter\\script_wow\\scripts"
endfunction

map cdw :call Cdw()<CR><CR>
function Cdw()
	cd F:\fyc\dydg\code_scripter\script_wow\scripts
endfunction

map cdd :call Cdd()<CR><CR>
function Cdd()
	cd Y:\r01_svn_of_scripter\develop\code_scripter\script_dbg\scripts
endfunction

map gb :call Find_file()<CR><CR>
function Find_file()
	if (expand("%")!="")
		exe "!start explorer /select, %"
	else
		exe "!start explorer /select, %:p:h"
	endif
endfunction

map ts :call Pyflakes_one()<CR><CR>
function Pyflakes_one()
	if (expand("%")!="")
		exe "!python c:/Python27/Scripts/pyflakes %"
	else
		exe "!python c:/Python27/Scripts/pyflakes %:p:h"
	endif
endfunction

