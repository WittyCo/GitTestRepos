" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
filetype off
" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes', { 'frozen': 1 }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } " NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'tpope/vim-fugitive'  " VCS(Version Control System)信息,允许在vim上执行git指令
"Plug 'mhinz/vim-signify'  " 同gitgutter但支持Git/svn/mercurial/cvs 在侧边栏实时显示修改状态
Plug 'airblade/vim-gitgutter', { 'lazy': 1 }   "hunks信息以及在侧边栏显示修改信息
Plug 'ycm-core/YouCompleteMe', { 'for': ['cc', 'cpp', 'cxx','c', 'python', 'js', 'html'], 'do': './install.py --clangd-completer'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'dstein64/vim-startuptime', { 'lazy': 1, 'on': 'StartupTime' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
"Plug 'junegunn/vim-easy-align'
call plug#end()
" }}}

" PLUGINS_CONFIGURATION -------------------------------------------------- {{{
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
let g:user_emmet_leader_key='<A-,>' 
let g:airline_theme='cobalt2'
let g:airline#extensions#tabline#enabled=1 
let g:airline_powerline_fonts=1
" enable none extensions for opimization
let g:airline_extensions = ['tabline', 'hunks', 'branch']
" cache :hight calls for optimization 
let g:airline_highlighting_cache = 1
let g:ycm_min_num_of_chars_for_completion=1 " 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_identifier_candidate_chars=2
" 触发语义补全
let g:ycm_key_invoke_completion='<C-z>'
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启YCM标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1 "在注释输入中也能补全
let g:ycm_complete_in_strings=1 "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
" 自动触发语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
" 仅在以下文件类型中使用ycm补全
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
            \ "python":1,
            \ "js":1,
            \ "cc":1,
            \ "cs":1,
            \ "java":1,
			\ "sh":1,
			\ }
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
" 修改提示框颜色
highlight Pmenu ctermfg=yellow ctermbg=darkgrey guifg=#ABB2BF guibg=#21252B
highlight PMenuSel ctermfg=blue ctermbg=black guifg=white guibg=#2C313C
" }}}

" SET -------------------------------------------------------- {{{

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Add numbers to the file.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" 让vim把连续数量的空格视为一个制表符(按tab键和删除时插入或删除一个制表符即四个空格)
set softtabstop=4

" Do not save backup files.
set nobackup
set noswapfile
set noundofile

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=5

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
"set showmode

" Show matching words during a search.
"set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=500

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" VCS永远显示侧边栏
"set signcolumn=yes

" 使侧边栏变透明 
highlight! link SignColumn LineNr

" 默认更新时间为4000ms,不利于异步更新
set updatetime=100
"默认右侧打开新buffer
set splitright 

" 在上面的基础上拆行时从以整个单词为单位而非字母
set linebreak

set fileencoding=utf-8
set langmenu=zh_CN.UTF-8
set encoding=utf-8
" 解决consle输出乱码
"set termencoding=cp936
" 自动重新读取
set autoread
" 自动保存
set autowrite
set autoindent
set smartindent
set smarttab
"set laststatus=2
" 解决vim 退格键（backspace）不能用
set backspace=indent,eol,start
" set vim's default shell[notice: It will result in some unpredicted script errors]
"set shell=pwsh
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" MAPPINGS --------------------------------------------------------------- {{{
" Press the space bar to type the : character in command mode.
nnoremap <space> :
noremap! jj <Esc>  

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" move the current line up/down
nnoremap <M-up> kddpk
nnoremap <M-down> ddp

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing Alt+j, Alt+k, Alt+h, or Alt+l.
nnoremap <A-j> <c-w>j
nnoremap <A-k> <c-w>k
nnoremap <A-h> <c-w>h
nnoremap <A-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w><
noremap <c-right> <c-w>>

" save and quit current file
noremap <A-w> :x<CR>
" ... all files
noremap <A-s> :xa<CR>
" force quit the current file
noremap <A-q> :q!<CR>
" ... all files
noremap <A-a> :qa!<CR>

" switch to next/previous file
nnoremap <S-n> :bn<CR>
nnoremap <S-p> :bp<CR>

" NERDTree specific mappings.
" Map the <A-t key to toggle NERDTree open and close.
nnoremap <A-t> :NERDTreeToggle<cr>
nnoremap <A-r> :NERDTreeRefreshRoot<CR>
nnoremap <leader>\ :noh<Esc>  
" 复制到系统剪切板
nnoremap +y "+y 
" 从系统剪切板粘贴
nnoremap +p "+p 
" 全选
nnoremap <C-a> ggVG
" 补全括号
noremap <C-c> "+y 
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O
inoremap <TAB> <c-r>=SkipPair()<CR>
" -----Start interactive EasyAlign in visual mode (e.g. vipga) -----------
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"}}}

" VIMSCRIPT -------------------------------------------------------------- {{{
"Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup vimStartup
    autocmd!
    "When editing a file, always jump to the last known cursor position.
    "Don't do it when the position is invalid, when inside an event handler
    "(happens when dropping a file on gvim), for a commit or rebase message
    "(likely a different one than last time), and when using xxd(1) to filter
    "and edit binary files (it transforms input files back and forth, causing
    "them to have dual nature, so to speak)
    autocmd BufReadPost *
      \ let line = line("'\"")
      \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
      \      && index(['xxd', 'gitrebase'], &filetype) == -1
      \ |   execute "normal! g`\""
      \ | endif
augroup END

" 开启语法高亮功能，不覆盖自定义颜色设置
if !exists("g:syntax_on")
    syntax enable
endif

" 首次进入时用绝对行号，从insert退出到normal后换位相对行号
augroup relative_numbser
	autocmd!
	autocmd InsertEnter * :set norelativenumber
	autocmd InsertLeave * :set relativenumber
augroup END

" 开启24bit真彩色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" 当离开插入模式或文本内容变更时自动保存
"autocmd InsertLeave,TextChanged * if &modified | silent write | endif

"Display cursorline and cursorcolumn ONLY in active window.
" augroup cursor_off
"     autocmd!
"     autocmd WinLeave * set nocursorline nocursorcolumn
"     autocmd WinEnter * set cursorline cursorcolumn
" augroup END

"设置tab跳出自动补全的括号
func SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'  
        return "\<ESC>la"  
    else  
        return "\t"  
    endif  
endfunc  

"}}}
