" 
"  __  __            _                __     ___           
" |  \/  | __ ___  _(_) ___   ___     \ \   / (_)_ __ ___  
" | |\/| |/ _` \ \/ / |/ _ \ / _ \ ____\ \ / /| | '_ ` _ \ 
" | |  | | (_| |>  <| | (_) | (_) |_____\ V / | | | | | | |
" |_|  |_|\__,_/_/\_\_|\___/ \___/       \_/  |_|_| |_| |_|
"                                                          

if empty(glob('~/.vim/plugged'))
  " silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  "   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Compatible
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Change Leader
let mapleader=" "

" Highlight syntax
syntax on

" Plug
set relativenumber
set number
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set smartcase

" JK for esc
inoremap jk <ESC>

" Noremap setting
noremap J 7j
noremap K 7k
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>
noremap e $

" map setting
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map <LEADER>rc :edit $MYVIMRC<CR>
map ; :

" windows split setting
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tr :tabe<CR>
map tl :+tabnext<CR>
map th :-tabnext<CR>

" Call figlet
map tx :r !figlet 

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
" Plug 'w0rp/ale'

" Auto Complete
" Plug 'Valloric/YouCompleteMe'
" Plug 'ycm-core/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'jiangmiao/auto-pairs' " auto pairs
Plug 'scrooloose/nerdcommenter' " comment
Plug 'mhinz/vim-startify' " open gui

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

Plug 'easymotion/vim-easymotion'

call plug#end()

" scheme
colorscheme snazzy
let g:SnazzyTransparent = 1

map ff :NERDTreeToggle<CR>

" ===
" === You Complete ME
" ===
nnoremap <LEADER>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <LEADER>g/ :YcmCompleter GetDoc<CR>
nnoremap <LEADER>gt :YcmCompleter GetType<CR>
nnoremap <LEADER>gr :YcmCompleter GoToReferences<CR>
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0

" ===
" === Taglist
" ===
let g:tagbar_map_showproto = 'TT'
nmap <silent><LEADER>t :TagbarOpenAutoClose<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m.",
        \ 'ToggleMarkAtLine'   :  "m,",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "m-",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>

" ===
" === Startify
" ===
noremap <LEADER>st :Startify<CR>

" ===
" === Compile
" ===
noremap <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
      exec "!g++ % -o %<"
      exec "!time ./%<"
    elseif &filetype == 'cpp'
      exec "!g++ -std=c++11 % -Wall -o %<"
      exec "!time ./%<"
    elseif &filetype == 'java'
      exec "!javac %"
      exec "!time java %<"
    elseif &filetype == 'sh'
      :!time bash %
    elseif &filetype == 'python'
      silent! exec "!clear"
      exec "!time python3 %"
    elseif &filetype == 'html'
      silent! exec "!chromium % &"
    elseif &filetype == 'markdown'
      exec "MarkdownPreview"
    elseif &filetype == 'tex'
      silent! exec "VimtexStop"
      silent! exec "VimtexCompile"
    endif
endfunc
