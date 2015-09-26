"call pathogen#helptags()
"call pathogen#infect()

"syntax on
"filetype plugin indent on

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-rails.git'
Bundle 'ervandew/supertab.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'astashov/vim-ruby-debugger.git'
" Dependencies of snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "scrooloose/nerdcommenter.git"

" Good looking bottom band
Bundle 'bling/vim-airline'
Bundle 'ggreer/the_silver_searcher'
Bundle 'rking/ag.vim' 
" Enable snippets 
Bundle 'garbas/vim-snipmate'
Bundle 'craigemery/vim-autotag'

"Enable you completeme
"Bundle 'valloric/YouCompleteMe' 

"vim multiple cursors
Bundle 'terryma/vim-multiple-cursors'
"css/html development
Bundle 'mattn/emmet-vim'

"colorscheme
"Bundle 'altercation/vim-colors-solarized'
"syntax enable
"set background=dark
"colorscheme solarized
Bundle 'croaker/mustang-vim'
Bundle 'vim-ruby/vim-ruby'
imap <C-L> <Plug>snipMateNextOrTrigger
smap <C-L> <Plug>snipMateNextOrTrigger
" set css autocomplete
" https://docs.oseems.com/general/application/vim/auto-complete-css
set omnifunc=csscomplete#CompleteCSS
"map shortcut to autocomplte css to Ctrl o
inoremap <C-o> <C-x><C-o>

filetype on
" change the mapleader from \ to ,
let mapleader=","

"nerd tree toggle
nmap ,N :NERDTreeToggle<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
set hidden

set tabstop=2
set softtabstop=2
set shiftwidth=2  "number of spaces to use for autoindenting
set expandtab

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

filetype plugin indent on

if has('autocmd')
  " autocmd filetype python set expandtab
  filetype indent on
endif

if &t_Co >= 256 || has("gui_running")
    colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

set pastetoggle=<F2>

set mouse=a
"set grepprg=ack

"set autocomplete for commands
set wildmode=longest,list,full
set wildmenu

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

nmap <silent> ,/ :nohlsearch<CR>


"
filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" My Stuff
syntax on
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set ic
set clipboard=unnamed
" Format JSON file
nmap =j :%!python -m json.tool<cr>

"set foldmethod=syntax
"set foldlevel=9
"autocmd BufWinLeave .vimrc mkview
"autocmd BufWinEnter .vimrc silent loadview
autocmd BufWritePre *.rb :%s/\s\+$//e


" Format JSON file
nmap =j :%!python -m json.tool<cr>
" Turn on folding
 set foldenable
" " Make folding indent sensitive
 set foldmethod=indent
" " Don't autofold anything (but I can still fold manually)
set foldlevel=100
" " don't open folds when you search into them
set foldopen-=search
" " don't open folds when you undo stuff
set foldopen-=undo
"use space to toggle folds instead of za (zc,zo)  ..if cursor is not in fold
"then move to the right
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Commenting blocks of code.
" http://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" open in new tab when you click on ctrlp file
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" tabs selected from workspace, rails, gems in workspace
set tags=./tags,tags;/home/scratch.prajaktah_cad/Workspace
" set tags+=/home/ddusk/Workspace/rails-src/rails/rails.tags
" set tags+=./gems.tags,gems.tags;/home/ddusk/Workspace

":highlight Pmenu guibg=brown gui=bold
hi Pmenu ctermbg=blue ctermfg=white
hi PmenuSel ctermbg=yellow ctermfg=black

"let g:ackprg = 'ag --vimgrep'
" The Silver Searcher

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ag_working_path_mode="r"
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
"noremap K :Ack <cword><cr>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
