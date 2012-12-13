"Get out of VI's compatible mode..
let $PATH .= ":/opt/local/bin:~/Library/bin/:/opt/local/sbin/:/opt/local/lib/erlang/bin:/opt/local/share/doczen/:/opt/go/bin"
set nocompatible

set shell=zsh
set history=1000

filetype plugin on
filetype indent on
set autoread
set mouse=a

"Set mapleader
"let mapleader = ","
"let g:mapleader = ","
syntax on

if has("ambiwidth")
set ambiwidth=double
endif

set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
"set wildmenu
"Always show current position
set ruler

set cmdheight=1
set nu
"Do not redraw, when running macros.. lazyredraw
set lz
"Change buffer - without saving
set hid
"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
set incsearch
"Set magic on
set magic

"No sound on errors.
set noerrorbells
set visualbell
"set t_vb=

"show matching bracet
set showmatch

"How many tenths of a second to blink
set mat=4
set hlsearch

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
let curdir = substitute(getcwd(), '/Users/wanglei', "~", "g")
return curdir
endfunction

"Format the statusline
set statusline=
set statusline+=%{getcwd()}\ >
set statusline+=\ %f "path to the file in the buffer, relative to current directory
set statusline+=\ %h%1*%m%r%w%0* " flag
set statusline+=\ [%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding}, " encoding
set statusline+=%{&fileformat}] " file format
set statusline+=\ Line:%l/%L,\ %c


""""""""""""""""""""""""""""""
" => Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
let l:saved_reg = @"
execute "normal! vgvy"
let l:pattern = escape(@", '\/.*$^~[]')
let l:pattern = substitute(l:pattern, " $", "", "")
if a:direction == 'b'
execute "normal ?" . l:pattern . "^M"
else
execute "normal /" . l:pattern . "^M"
endif
let @/ = l:pattern
let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> 20j
"map <c-space> ?

"Smart way to move btw. window map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set fo+=mM

"Actually, the tab does not switch buffers, but my arrow
"Bclose function ca be found in "Buffer related" section
"map <leader>bd :Bclose<cr>
" map <down> <leader>bd
"Use the arrows to something usefull
"map <right> :bn<cr>
" map <left> :bp<cr>


map th :tabnext<CR>
map tl :tabprev<CR>
map tn :tabnew<CR>
map td :tabclose<CR>

"Tab configuration
"map <leader>tn :tabnew %<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
if has("usetab")
set switchbuf=usetab
endif

if has("stal")
set stal=2
endif

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>:pwd<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
")
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
"http://www.vim.org/tips/tip.php?tip_id=153
"
"ino ( ()<esc>:let leavechar=")"<cr>i
"ino { {}<esc>:let leavechar="}"<cr>i
"ino $q ''<esc>:let leavechar="'"<cr>i
"ino $w ""<esc>:let leavechar='"'<cr>i
"imap <c-l> <esc>:exec "normal f" . leavechar<cr>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrev
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Comment for C like language
if has("autocmd")
au BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css ino $c /**<cr> **/<esc>O
endif

"My information
ia xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
"iab xname Amir Salihefendic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cno <C-A> <Home>
cno <C-E> <End>
cno <C-K> <C-U>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
"map <c-q> :sb

"Open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,"100,:20,%,n~/.viminfo

" Buffer - reverse everything ... :)
map <F9> ggVGg?

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
buffer #
else
bnext
endif

if bufnr("%") == l:currentBufNum
new
endif

if buflisted(l:currentBufNum)
execute "bdelete! ".l:currentBufNum
endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile
set noar


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set fen
set fdl=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text option
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python script
""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indenting
set cindent

"Wrap line
set nowrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Yank Ring
""""""""""""""""""""""""""""""
map <leader>y :YRShow<cr>

""""""""""""""""""""""""""""""
" => File explorer
""""""""""""""""""""""""""""""
"Split vertically
"let g:explVertical=1
"let g:explHideFiles='^.,.*.class$,.*.swp$,.*.pyc$,.*.swo$,.DS_Store$'
"let g:explDetailedHelp=0


""""""""""""""""""""""""""""""
" => Minibuffer
""""""""""""""""""""""""""""""
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplModSelTarget = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1
let g:bufExplorerSortBy = "name"


""""""""""""""""""""""""""""""
" => Tag list (ctags) - not used
""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = "/sw/bin/ctags-exuberant"
"let Tlist_Sort_Type = "name"
"let Tlist_Show_Menu = 1
"map <leader>t :Tlist<cr>
map <F3> :NERDTreeToggle<cr>
map <F4> :Tlist<cr>


""""""""""""""""""""""""""""""
" => LaTeX Suite thing
""""""""""""""""""""""""""""""
"set grepprg=grep\ -r\ -s\ -n
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf='xpdf'

if has("autocmd")
"Binding
au BufRead *.tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>

"Auto complete some things ;)
au BufRead *.tex ino $i indent
au BufRead *.tex ino $* cdot
au BufRead *.tex ino $i item
au BufRead *.tex ino $m [<cr>]<esc>O
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Todo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim

""""""""""""""""""""""""""""""
" => VIM
""""""""""""""""""""""""""""""
if has("autocmd")
au BufRead,BufNew *.vim map <buffer> <leader><space> :w!<cr>:source %<cr>
endif

""""""""""""""""""""""""""""""
" => HTML related
""""""""""""""""""""""""""""""
" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1

"To HTML
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
"au BufNewFile,BufRead *.js so ~/vim_local/syntax/javascript.vim
"function! JavaScriptFold()
" set foldmethod=marker
" set foldmarker={,}
" set foldtext=getline(v:foldstart)
"endfunction
"au BufNewFile,BufRead *.js call JavaScriptFold()
"au BufNewFile,BufRead *.js imap <c-t> console.log();<esc>hi
"au BufNewFile,BufRead *.js imap <c-a> alert();<esc>hi
"au BufNewFile,BufRead *.js set nocindent
"au BufNewFile,BufRead *.js ino <buffer> $r return

"au BufNewFile,BufRead *.js ino <buffer> $d //<cr>//<cr>//<esc>ka<space>
"au BufNewFile,BufRead *.js ino <buffer> $c /**<cr><space><cr>**/<esc>ka


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m :%s/\r//g<CR>

"Paste toggle - when pasting something in, don't indent.
"set pastetoggle=<F3>

"Remove indenting on empty line
map <Leader>$ :%s/s*$//g<cr>:noh<cr>''

"Super paste
"ino <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

:colo oceandeep
" set nocompatible
set langmenu=zh_CN.utf-8
set noswf
" :au BufAdd,BufNewFile * nested tab sball
set foldmethod=marker 
set foldclose=all
set noeb
set visualbell
set complete+=k 
set gfn="Panic\ Sans"\ 12
set guioptions=
autocmd! bufwritepost .vimrc source %

map <F8> :buffers<CR>

:nmap <C-tab> :tabnext<cr>
:nmap <C-t> :tabnew<cr>

let g:sparkupNextMapping = '<\-n>'
set expandtab
set tabstop=4
"set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=2
set smarttab
set lbr
"set tw=500

call pathogen#infect()
set shiftwidth=4

au BufNewFile,BufRead *.t2t                 setf txt2tags
set fencs=utf-8,gbk

"set noimd
"if has("gui_running")
"set imactivatekey=C-space
"inoremap <ESC> <ESC>:set iminsert=2<CR>
"endif
"
let g:erlangManPath="/opt/local/lib/erlang/man"
map <D-i> :make all install<CR>
source $VIMRUNTIME/ftplugin/man.vim


"自动换行
set tw=80 
set fo+=m

map ss :!svn status<CR>
map sc :!svn commit -m ""<CR>
map su :!svn update<CR>
map spi :!SVN_EDITOR="mvim --remote-tab " svn propedit svn:ignore 

" textmate
nmap <D-F> :vimgrep 
nmap <D-π> :w !bcat<CR>


let Tlist_Use_Right_Window=1
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File=1 " especially with this one
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
set updatetime=1000
nmap ,t :!(cd %:p:h;ctags *)& " Maps the updates of tags to key ,t.
set tags=.tags; " The ';' at the end will cause the ctags plugin to search for current dir and above dirs until it find a tag file.

" Add the following below if you want to generate ctags upon saving a file
" Auto-generate ctags upon making changes to a file
autocmd BufWritePost *.erl :silent !(cd %:p:h;ctags -f .tags *)&

inoremap <C-]>             <C-X><C-]>
inoremap <C-F>             <C-X><C-F>
inoremap <C-D>             <C-X><C-D>
inoremap <C-L>             <C-X><C-L> 
set clipboard=unnamed

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


