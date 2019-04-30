" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/cscope.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'roblillack/vim-bufferlist'
Plugin 'fholgado/minibufexpl.vim'

"Bundle 'scrooloose/syntastic'

" color scheme
Plugin 'flazz/vim-colorschemes'

call vundle#end()

" enable filetype detection
filetype plugin indent on

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za


"number of spaces that a pre-existing tab is equal to.
"tabstop: how many space equal to tab.
"shiftwidth: auto indent.
"softtabstop:if you want to change
au BufRead,BufNewFile *.py,*pyw set tabstop=4 shiftwidth=4 autoindent
au BufRead,BufNewFile *c,*h set tabstop=4 expandtab shiftwidth=4

"General set
"leader or Leader default is \
"if wan to change to ',' use below command
"let mapleader = ,

"set split region
"set splitdown
"set splitright

"NO Swap file
set noswapfile

"turn line number
set nu

"set default file encoding to UTF-9
set encoding=utf-8

"Use mouse
set mouse=a
map m :set mouse=<CR>
map <leader>m :set mouse=a<CR>

"high light
set hls

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=yellow guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c match BadWhitespace /^\t\+/

" Make trailing whitespace and space before tab as bad
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$\| \+\ze\t/ 

" The-NERD-tree Plug-in
" use \nt open nerdree windows and show left
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <F2> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" Tarbar Plug-in
map <F3> :Tagbar<CR>
let g:tagbar_autofocus = 1
let g:tagbar_left=1

" Vim-easymotion Plug-in
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
"" 重複上一次操作, 類似repeat插件, 很強大
map <Leader><leader>. <Plug>(easymotion-repeat)

" PowerLine Plug-in
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy' " show arrow

" YouCompleteMe Plug-in
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_path_to_python_interpreter='/usr/bin/python'
"let g:ycm_seed_identifiers_with_syntax=1
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
"nnoremap <leader>jt :YcmCompleter GoTo<CR>

" vim-colorschemes Plug-in
" desert cannot see tab
" colorscheme molokai
set background = "dark"

" nerdcommenter Plug-in
" Fast comment: press F4
map <F4> <leader>ci <CR>"

" Python fast execute
au BufRead,BufNewFile *.py map <F5> :1<CR> :w<CR> :!python %<CR>


" CtrlP Plug-in
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'
" 設置過濾不進行查找的後綴名 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$' 

" ctags
set tags=./tags,./TAGS,tags;~,TAGS;~

" cscope
set cscopetag
set csto=0

if filereadable("cscope.out")
   cs add cscope.out   
elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB
endif
set cscopeverbose

"找出C語言name的符號
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"找出name定義的地方
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"找出使用name的地方
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"找出name的字串
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"相當於egrep功能，但速度更佳
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"尋找檔案
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"尋找include此檔案的檔案
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"尋找name裡面使用到的函式
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" airline
"set guifont=Inconsolata\ for\ Powerline\ 20
"let g:airline_powerline_fonts = 1
"set laststatus=2
"
" bufferlist
"map <silent> <F3> :call BufferList()<CR>
"let g:BufferListWidth = 25
"let g:BufferListMaxWidth = 50
"hi BufferSelected term=reverse ctermfg=white ctermbg=red cterm=bold
"hi BufferNormal term=NONE ctermfg=black ctermbg=darkcyan cterm=NONE
"
"
"Resize
map <F6> :resize +2<CR>
map <S-F6> :resize -2<CR>
map <C-F6> :vertical resize +2<CR>
map <A-F6> :vertical resize -2<CR>

