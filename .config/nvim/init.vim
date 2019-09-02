" =============================================
" #                  PLUGINS                  #
" =============================================
syntax on
call plug#begin('~/.local/share/nvim/plugged')
" Search for docs using Zeal within vim
" Plug 'KabbAmine/zeavim.vim'

" Lean & mean statusbar.
Plug 'bling/vim-airline'

" Enable repeating for supported plugins.
Plug 'tpope/vim-repeat'

" Surround objects with chars.
Plug 'tpope/vim-surround'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Comment stuff out.
Plug 'tpope/vim-commentary'

" Sexy start screen
Plug 'mhinz/vim-startify'

" Automatically add closing value for '/[/{ etc
Plug 'jiangmiao/auto-pairs'

" OneDark theme for vim
Plug 'joshdick/onedark.vim'

" File system explorer
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Asynchronous linting, lint as you type!
Plug 'w0rp/ale'

" Semantic language support
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" Completion plugins ncm2 -> neovim-completion-manager
Plug 'ncm2/ncm2'                     " Actual completion plugin
Plug 'roxma/nvim-yarp'               " To make ncm2 work properly
Plug 'ncm2/ncm2-bufword'             " Completions from the current buffer
Plug 'ncm2/ncm2-path'                " Path completions
" Plug 'ncm2/ncm2-jedi'                " Completions for python
" Plug 'ncm2/ncm2-pyclang'             " Completions for C/C++
Plug 'ncm2/ncm2-go', { 'for': 'go' } " Completions for Go
" Plug 'ncm2/ncm2-racer'               " Completions for Rust

" Go features for vim
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

" More useful word motions!
Plug 'chaoren/vim-wordmotion'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Add syntax highlighting to NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Prettify vim with icons and glyphs
Plug 'ryanoasis/vim-devicons'

" Fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" =============================================
" #             EDITOR SETTINGS               #
" =============================================
if has('autocmd')
    filetype plugin indent on
endif

" Set to good boi encoding
set encoding=utf-8

" Sane splits
set splitright
set splitbelow

" Set linenumbers 
set number relativenumber

" Set smart searching
set incsearch ignorecase smartcase

" Set tab length
set tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab 

" Show a few lines of context around the cursor
" Scroll offset
set scrolloff=5

" ctrl+a and ctrl+x will no longer recognize octal numbers
set nrformats-=octal

" Enable mouse controls
set mouse=a

" When autocompleting VIM commands show a list
set wildmode=longest,list,full

" Enable persistent undo
set undofile

" Save undo files in the following directory
set undodir=~/.local/share/nvim/undo

" Turn off annoying wrapping
set textwidth=0
set wrapmargin=0

" =============================================
" #                KEYBINDINGS                #
" =============================================

" ===Leader keybindings===
" Set leader key to space
let mapleader=" "

" Turn off search highlight with leader+nh ([n]o [h]ighlight)
map <silent> <leader>nh :nohl<CR>

" Move to next/previous error
map <silent> <leader>ne :lnext<CR>
map <silent> <leader>pe :lprev<CR>

" Don't use Ex mode
map Q gq

" Open NERDTree with ctrl+n
map <silent> <C-n> :NERDTreeToggle<CR>

" Keybindings for saving with ctrl+s
noremap <silent> <C-S>  :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Keybindings for comfier movement between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" For moving lines up or down by one in normal or visual mode
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

" For moving between tabs
nnoremap <silent> <A-h> :tabprevious<CR>
nnoremap <silent> <A-l> :tabnext<CR>

" Tab/shift-tab to indent/outdent selected lines
nnoremap <Tab> >>_
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Move by lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" Keymaps for fzf
nnoremap <silent> <leader>o :FZF<CR>

" =============================================
" #                  THEMING                  #
" =============================================
let g:onedark_color_overrides = {
            \ "white": {"gui": "#dcdcdc", "cterm": "252", "cterm16": "7"},
            \}

" Get all onedark colors
let s:colors=onedark#GetColors()

" :h w18 for more information and also check out onedark.vim git repo
if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Set all types to be purple instead of yellow (int, float, bool)
    autocmd ColorScheme * call onedark#extend_highlight("Type", { "fg": s:colors.purple})
    " Set all storageclasses to be purple instead of yellow (static, register, volatile)
    autocmd ColorScheme * call onedark#extend_highlight("StorageClass", { "fg": s:colors.purple})
    " Set hlsearch hits to be blue instead of yellow
    autocmd ColorScheme * call onedark#extend_highlight("Search", { "bg": s:colors.blue})
    augroup END
endif

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" if (empty($TMUX))
"   if (has("nvim"))
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif

colorscheme onedark
hi Normal ctermbg=None

" NERDTree syntax highlight changed
let s:blue = "42A5F5"
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['python'] = s:blue
let g:NERDTreeExtensionHighlightColor['go'] = s:blue

" =============================================
" #              SYNTAX SETTINGS              #
"=============================================

" For Python
let g:python_highlight_all=1

" For Golang
let g:go_highlight_fields=1
let g:go_highlight_types=1
let g:go_highlight_operators=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_format_strings=1

"    ---=== === === === === === === === === === === ===---
" ---=== HERE BEGINS PLUGIN/LANGUAGE SPECIFIC SETTINGS ===---
"    ---=== === === === === === === === === === === ===---

" =============================================
" #            AUTO-PAIRS SETTINGS            #
" =============================================
let g:AutoPairsMapBS=0
let g:AutoPairsMapCh=0

" =============================================
" #              PYTHON SETTINGS              #
" =============================================
let g:python3_host_prog='/usr/bin/python'

" =============================================
" #               NCM2 SETTINGS               #
" =============================================
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help  Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

" =============================================
" #           LANGUAGE CLIENT SETTINGS        #
" =============================================
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'stable', 'rls'],
            \ 'python': ['pyls']
            \ }

let g:LanguageClient_useVirtualText=0

" =============================================
" #                ALE SETTINGS               #
" =============================================
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'
" TODO: Figure out how to get these commands to work
" nnoremap <leader>gh :ALEHover<CR>
" nnoremap <leader>gd :ALEGoToDefinition<CR>

" =============================================
" #           WORD-MOTION SETTINGS            #
" =============================================
let g:wordmotion_spaces='_-.'
" Fixing annoying deletion of line when deleteing word
nmap dw de
nmap cw ce


