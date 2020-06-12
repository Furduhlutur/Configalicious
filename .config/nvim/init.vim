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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" More useful word motions!
Plug 'chaoren/vim-wordmotion'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Add syntax highlighting to NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Prettify vim with icons and glyphs
Plug 'ryanoasis/vim-devicons'

" Personal Wiki using vim
Plug 'vimwiki/vimwiki'

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

" Add ruler at column 100
set cc=100

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

" Setting color of ruler
highlight ColorColumn ctermbg=0

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
" #               RUST SETTINGS               #
" =============================================
autocmd BufWritePost *.rs :Format

" =============================================
" #              PYTHON SETTINGS              #
" =============================================
let g:python3_host_prog='/usr/bin/python'

" =============================================
" #                COC SETTINGS               #
" =============================================
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" =============================================
" #                ALE SETTINGS               #
" =============================================
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'

" =============================================
" #           WORD-MOTION SETTINGS            #
" =============================================
let g:wordmotion_spaces='_-.'
" Fixing annoying deletion of line when deleting word
nmap dw de
nmap cw ce

" =============================================
" #             VIMWIKI SETTINGS              #
" =============================================
set nocompatible
filetype plugin on
let g:vimwiki_list = [{'path': '~/.wiki/', 'syntax': 'markdown', 'ext': '.md',
                     \ 'path_html': '~/.wiki_html/'},
                     \ {'path': '~/.TILs/',  'syntax': 'markdown', 'ext': '.md',
                     \ 'path_html': '~/.TILs_html/'}]
