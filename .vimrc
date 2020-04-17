set nocompatible              " be iMproved, required
set number relativenumber
set path=$PWD/**
set wildignore+=*/node_modules/*
set tags=tags
set colorcolumn=80
set textwidth=80
set cindent
set tabstop=2
set shiftwidth=2

let mapleader = ","
" set autochdir
filetype off                  " required


" set the runtime path to include Vundle and initialize
"set rtp+=$HOME/Vundle/vimfiles/bundle/ctrlp.vim
set completeopt=longest,menuone
call plug#begin('~/.local/share/nvim/plugged')
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'airblade/vim-rooter'
Plug 'rizzatti/dash.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'mtth/scratch.vim'
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-zoom'
Plug 'w0rp/ale'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'jelera/vim-javascript-syntax'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'gavocanov/vim-js-indent'
Plug 'gmarik/ingretu'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/Txtfmt-The-Vim-Highlighter'
Plug 'moll/vim-node'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-endwise'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'alvan/vim-closetag'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'xolox/vim-notes'
Plug 'mhinz/vim-mix-format'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'morhetz/gruvbox'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'metakirby5/codi.vim'
Plug 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
call plug#end()
let g:deoplete#enable_at_startup = 1
" To map <Esc> to exit terminal-mode:
if has('nvim')
    :tnoremap <Esc> <C-\><C-n>
    nnoremap <C-o><C-t> :below 10sp term://$SHELL<cr>i
    set inccommand=split
endif
tnoremap ii <C-\><C-n>



let g:tmux_navigator_no_mappings = 1
let g:NERDTreeIgnore = ['^node_modules$']
colorscheme gruvbox

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

filetype plugin indent on    " required
syntax on
set background=dark
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set nohlsearch
"Set Tab = 2 spaces
set tabstop=2
"Key Maps
imap <C-c> <CR><Esc>O
imap ii <Esc>
set backspace=indent,eol,start
"
" make YCM compatible with UltiSnips (using supertab)
" VIM WIKI SETUP
let wiki_1 = {}
let wiki_1.path = '~/vimwiki_work_md/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_2 = {}
let wiki_2.path = '~/vimwiki_personal_md/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:rustfmt_autosave = 1

set hidden
let g:racer_cmd = "/home/souravchatterjee/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1



" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:codi#interpreters = {
  \ 'javascript': {
     \ 'rightalign': 0,
  \ },
\ }

let g:used_javascript_libs='underscore,ramda,react,jquery'
"Auto Close YCMD Hints and Semantics
let g:jsx_ext_required = 0
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" better key bindings for UltiSnipsExpandTrigger
let g:ale_sign_error = '>' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file
let g:mkdp_refresh_slow = 1
"Nerdtree Shortcut mapping
map <silent> <C-t> :NERDTreeToggle<ENTER>
map <silent> <C-e> :Errors
let g:NERDTreeGitStatusWithFlags = 1

"FZF Settings
"
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }


nnoremap <c-p> :FZF<cr>
nnoremap <c-p><c-b> :Buffers<cr>
nnoremap <c-p><c-s> :Ag <C-R><C-W><CR>
let g:ackprg = 'ag --nogroup --nocolor --column'

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

"Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
" Emmet Configuration
let g:user_emmet_leader_key='<C-E>'

" COC Settings

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
	\ 'coc-snippets',
  \ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json',
	\ ]

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:user_emmet_settings = {
												\  'javascript.jsx' : {
												\      'extends' : 'jsx',
												\  },
												\}
let g:syntastic_javascript_checkers = ['eslint']
" let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier-eslint', 'eslint']}
" let g:ale_enabled = 1
" let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma --bracket-spacing --jsx-bracket-same-line'
" Match tag types
let g:mta_filetypes = {
												\ 'html' : 1,
												\ 'xhtml' : 1,
												\ 'xml' : 1,
												\ 'jinja' : 1,
												\ 'jsx'    : 1,
												\ 'javascript': 1
												\}
"Auto close tags including jsx
"-----------------------------
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

let g:notes_directories = ['~/Documents/Notes']
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
" "
"Elixir Tage Stack
let g:alchemist_tag_stack_map = '<C-T><C-A>'


" always show signcolumns
set signcolumn=yes
let g:mix_format_on_save = 1

"Script to autoclose NERDTree side pane
"--------------------------------------
function! s:CloseIfOnlyControlWinLeft()
				if winnr("$") != 1
								return
				endif
				if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
																\ || &buftype == 'quickfix'
								q
				endif
endfunction
augroup CloseIfOnlyControlWinLeft
				au!
				au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

" Tab Coloring
:hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
:hi TabLine ctermfg=Blue ctermbg=Yellow
:hi TabLineSel ctermfg=Red ctermbg=Yellow
