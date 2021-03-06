let mapleader="," 
:nnoremap <leader>ev :e $MYVIMRC<cr>
:nnoremap <leader>sv :so $MYVIMRC<cr>
:nnoremap <leader>, :so %<cr>
:inoremap jj <esc>

set nu

"so ~/.vim/vundle.vim
so ~/.vim/bundle/VimConf/linux_conf/linux_vundle.vim

filetype plugin indent on
filetype on
filetype plugin on
syntax enable
syntax on

set incsearch
set ignorecase

set nobackup
set noswapfile
set noundofile

set ai
set sw=4
set ts=4
set sta

set backspace=indent,eol,start

"ycm config
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/VimConf/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinition ElseDeclaration<cr>
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_autoclose_preview_window_after_completion=1 
let g:ycm_key_invoke_completion='<c-x>'
let g:ycm_cache_omnifunc=0

"会找默认路径,不需要自己设置
"let g:ycm_python_binary_path='/usr/bin/python2.7'
"let g:ycm_server_python_interpreter='/usr/bin/python2.7'

set completeopt=longest,menu
autocmd InsertLeave *if pumvisible()==0 | pclose|endif

let g:ycm_semantic_triggers={
			\ 'c' : ['->','.'],
			\ 'erlang' : [':'],
			\ 'lua' : ['.',':'],
			\ 'cs,java,javascript,typescript,d,python,go':['.'],
			\ }
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir=os.environ['VIRTUAL_ENV']
	sys.path.insert(0,project_base_dir)
	activate_this=os.path.join(project_base_dir,'bin/activate_this.py')
	execfile(activate_this,dict(__file__=activate_this))
EOF

"filetype auto command setting
augroup configPc
	autocmd!
	autocmd BufReadPost * if line("'\"")>0|if line("'\"")<=line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
	autocmd FileType python so ~/.vim/bundle/VimConf/linux_conf/py.vim
aug End
