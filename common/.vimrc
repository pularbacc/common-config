" ===============================================================================
" =[vim]=
" ===============================================================================

"| leader key
let mapleader = ","







" _______________________________________________________________________________
" =[plugin]=
"

call plug#begin()
	"| nerdtree
	Plug 'preservim/NERDTree'

	"| ranger explore
	Plug 'iberianpig/ranger-explorer.vim'

	"| highlight vue 
	Plug 'leafOfTree/vim-vue-plugin'

	"| auto indent tab width
	Plug 'vim-scripts/matchindent.vim'

	"| indentline vert
	Plug 'Yggdroot/indentLine'

	Plug 'Xuyuanp/nerdtree-git-plugin'

	Plug 'wfxr/minimap.vim'

	"Plug 'airblade/vim-gitgutter'

	"| auto close bracket
	"Plug 'jiangmiao/auto-pairs'
	"Plug 'junegunn/fzf'
	"Plug 'junegunn/fzf.vim'
call plug#end()









"=[netrw]=================================
		
"|		:E : open netrw
"|		:Rex : close netrw | :bd
"|		
"|		:r : change sort
"|		
"|		:R : move or rename file
"|		
"|		:d : create directory

"| disable annoying banner
let g:netrw_banner=0

"| tree view
let g:netrw_liststyle=3

let g:netrw_list_hide=netrw_gitignore#Hide()

let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'











"=[nerdtree]===============================

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"| toggle nerdtree
"nnoremap <Leader>ee :NERDTreeToggle<CR> 

"| nerdtree focus
nnoremap <Leader>e :NERDTreeToggle<CR> 

"| hide status line
let g:NERDTreeStatusline = '%#NonText#'

"| hide help
let NERDTreeMinimalUI=1







"=[nerdtree git]============================

let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  :'✹',
			\ 'Staged'    :'✚',
			\ 'Untracked' :'✭',
			\ 'Renamed'   :'➜',
			\ 'Unmerged'  :'═',
			\ 'Deleted'   :'✖',
			\ 'Dirty'     :'✗',
			\ 'Ignored'   :'☒',
			\ 'Clean'     :'✔︎',
			\ 'Unknown'   :'?',
			\ }







" _________________________________________________________________________________
" =[common]=
"

"|		$ % : to match bracket
"|		
"|		$ p : paste
"|		
"|		$ ctrl + g : info file

"| turn off highlight match bracket
let g:loaded_matchparen=1

"| color ~
highlight EndOfBuffer ctermfg=237

set updatetime=100














" _________________________________________________________________________________
" =[mode]=
"

"|		$ ctrl + c | esc | jj : command mode
"|		
"|		$ v : visual mode
"|		
"|		$ ctrl + v : rectangular mode
"|		
"|		$ shift + r : replace mode
"|		
"|		$ ctrl + o : listen one command

"| switch mode
inoremap jj <ESC>


"| show cmd when typing
set showcmd

"| cursor shape
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"















" __________________________________________________________________________________
" =[move]=
"

"|		$ [count][move]
"|		
"|		------
"|		 $ ctrl + u : page up
"|		
"|		 $ ctrl + d : page down
"|		
"|		 $ ctrl + o : back position
"|		
"|		 :[num line] : to line
"|		
"|		------
"|		 $ 0 : to begin line
"|		
"|		 $ $ : to end line
"|		
"|		 $ shift + a : to end line | insert
"|		
"|		------
"|		 $ w : to begin next word
"|		
"|		 $ e : to end word
"|		
"|		 $ a : to next character | insert
"|		
"|		------
"|		 $ o : add new line below | insert
"|		
"|		 $ shift + o : add new line above | insertv

"| page down
nnoremap <Space> <C-d>






















" __________________________________________________________________________________
" =[edit]=
"

"|-[delete]-
"|		
"|		$ d : delete select 
"|		
"|		$ d[count][motion]
"|		
"|		$ dd : delte line 
"|		
"|		$ x : delete character
"|		$ s : delete character | insert


"|-[change]-
"| 
"|		$ c : delete select
"|		
"|		$ c[count][motion]
"|		
"|		$ r[character] : replace character


"|-[copy/paste]-
"| 
"|		$ y : copy select
"|		
"|		$ yy : copy line
"|		
"|		$ y[count][motion]


"|-[undo/redo]
"| 
"|		$ u : undo
"|		
"|		$ ctrl + r : redo












" __________________________________________________________________________________
" =[multiple edit]=
"

"|		1. rectangular mode
"|		2. select
"|		3. action
"|		    - shift + i      :	add text
"|		    - shift + a      :	add text to next
"|		    - x              :	deletee
"|		    - p              :	paste
"|		    - c              :	change
"|		    - shift + c      :	change to end line
"|		    - shift + r      :	change whole line
"|		4. off insert modev












" ___________________________________________________________________________________ 
" =[system]=
"

"|		:![command] : excute 1 command
"|		
"|		:sh : open shell

" enable mouse click
set mouse=a  

" copy to clipboard
set clipboard=unnamed

" Delete backspace
set backspace=indent,eol,start 

" not special key insert
set nocompatible 




















" ____________________________________________________________________________________ 
" =[search]=
"

"|		:/[word] : search
"|		
"|		- [word]\c : without upper case
"|		
"|		$ n : next search
"|		
"|		$ shift + n : previous search
"|		
"|		:set hls : highlight search
"|		:nohls : no highlight search
"|		
"|		:set ic : search ignore case 
"|		:set noic : search without ignore case 
"|		
"|		
"|		:%s/[content]/[replace]/gc : search and replace
"|		:%s//[replace]/gc : replace current search highlight


" highlight search result
set hlsearch

" search with ignore case
set ic

" search when typing
set is

" off search
nnoremap <C-l> :nohl<cr>



"|-[search in project]
"|
"|		:vimgrep /[content]/gj `git ls-files` | cw
"|		:vim /[content]/gj 
"|		
"|		- g : multiple word in line
"|		- j : not jump to first match
"|		- `git ls-files` : ignore gitignore
"|		- cw : show menu

"| vimgrep map
command -nargs=1 S noautocmd vimgrep /<args>/gj `git ls-files` | cw





















" ____________________________________________________________________________________
" =[window]=
"

"|		:vert : open window in vertical
"|		:hor : open window in horization
"|		
"|		:res [size] : resize height
"|		:vert res [size] : resize width
"|		
"|		$ ctrl + w + w : switch windows

"| border window
hi VertSplit ctermfg=232
hi VertSplit ctermbg=14

"| line number
set nonu
hi LineNr ctermfg=237

"| line color
hi StatusLine ctermbg=250 ctermfg=235

"| unactive window status
hi StatusLineNC ctermfg=233 ctermbg=25

"| wildmenu
set wildmenu
set wildmode=longest:full,full
hi Wildmenu ctermbg=250
















" ____________________________________________________________________________________
" =[project]=
"

"autocmd BufNewFile,BufRead *.vue set ft=html

set path+=**

"| ignore files
let g:project_find_path = '.,' . system("git ls-tree -d HEAD --name-only | tr '\n' : | sed 's/:/**,/g'")

autocmd VimEnter let &path = g:project_find_path

autocmd BufReadPost * let &path = g:project_find_path

syntax on

filetype plugin on

filetype indent on


















" ____________________________________________________________________________________ 
" =[buffers]=
"

"|		:ls : list buffers
"|		:b[num] : open buffer
"|		
"|		:e# : previous buffer 
"|		$ ctrl + 6 : previous buffer
"|		
"|		:bd : delete buffer

"| list buffer
nnoremap <Leader>b :buffers<CR>:b<Space> 

"| switch buffer
nnoremap <Leader><BS> :e#<CR> 

"| auto save file
"autocmd TextChanged,TextChangedI <buffer> silent write

"| auto write when switch file
set autowriteall






















" _____________________________________________________________________________________ 
" =[indent]=
"

set autoindent
set smartindent
set cindent
set smarttab
set noexpandtab
set nowrap

"| tab space
set tabstop=4
set shiftwidth=4

"| render tab
set list listchars=tab:\│\ 
let g:indentLine_char = '│'
hi SpecialKey ctermfg=237   

"| indent tab
:map <Tab> >
:map <Tab> <Esc> >
:map <Tab> >gv
:map <S-Tab> <j
:map <S-Tab> <Esc> <
:map <S-Tab> <gv



















" _____________________________________________________________________________________ 
" =[fold]=
"

"| za | zA | zi

"| set fold=indent
nnoremap <Leader>fi :set foldmethod=indent<CR>

"| reset fold
nnoremap zk :e!<cr>

"| click open fold
noremap <2-LeftMouse> za

hi Folded ctermbg=233

hi Folded ctermfg=247

function! MyFoldText()
	let nl = v:foldend - v:foldstart + 1
	let comment = substitute(getline(v:foldstart),"^ *","",1)
	let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
	let txt = '> '. linetext . ''
	return txt
endfunction

set foldtext=MyFoldText()

set fillchars=vert:\│,fold:\ 
























" _____________________________________________________________________________________ 
" =[script]=
"

fu! Test(name, age)
	let name = a:name

	let age = a:age
	let age = age + 10

	let &statusline = "hello : "  . name . age
endf

"| :call Test("nguyen", 20) : run

command! -nargs=* Test call Test(<f-args>)

"| Test command
nnoremap <Leader>i :Test<Space>






