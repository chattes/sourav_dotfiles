set nocompatible              " be iMproved, required
set number relativenumber
set path=$PWD/**
set wildignore+=*/node_modules/*
set tags=tags
set colorcolumn=80
set textwidth=80
set nofoldenable
let mapleader = ","
" set autochdir
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=$HOME/Vundle/vimfiles/bundle/ctrlp.vim
set completeopt=longest,menuone
call plug#begin('~/.local/share/nvim/plugged')
if has('nvim')
				Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
				Plug 'Shougo/denite.nvim'
else
				Plug 'Shougo/deoplete.nvim'
				Plug 'roxma/nvim-yarp'
				Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'airblade/vim-rooter'
Plug 'rizzatti/dash.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'mtth/scratch.vim'
Plug 'vimwiki/vimwiki'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'dhruvasagar/vim-zoom'
Plug 'w0rp/ale'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'nightsense/vim-crunchbang'
Plug 'tomasr/molokai'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'gavocanov/vim-js-indent'
Plug 'Sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'gmarik/ingretu'
Plug 'ervandew/supertab'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'altercation/vim-colors-solarized'
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
Plug 'xolox/vim-easytags'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-endwise'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'Valloric/MatchTagAlways'
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
call plug#end()
let g:deoplete#enable_at_startup = 1
" To map <Esc> to exit terminal-mode:
if has('nvim')
    :tnoremap <Esc> <C-\><C-n>
    nnoremap <C-o><C-t> :below 10sp term://$SHELL<cr>i
    set inccommand=split
endif
tnoremap ii <C-\><C-n>

filetype plugin indent on    " required
" colo Tomorrow-Night-Eighties
syntax on
set background=dark
colorscheme palenight
" colorscheme solarized
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set nohlsearch
"Set Tab = 2 spaces
set tabstop=2
"Key Maps
imap <C-c> <CR><Esc>O
imap ii <Esc>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>


set backspace=indent,eol,start
"
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
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




let g:UltiSnipsSnippetDirectories=['~/.local/share/nvim/plugged/vim-snippets/UltiSnips', 'UltiSnips']
let g:used_javascript_libs='underscore,ramda,react,jquery'
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"Auto Close YCMD Hints and Semantics
let g:jsx_ext_required = 0
let g:nerdtree_tabs_open_on_console_startup=0
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:ale_sign_error = '>' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file
let g:mkdp_refresh_slow = 1
"Tag completion
:iabbrev </ </<C-X><C-O>
"Nerdtree Shortcut mapping
map <silent> <C-t> :NERDTreeToggle<ENTER>
map <silent> <C-e> :Errors
"FZF Settings
"
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

" denite file search (c-p uses gitignore, c-o looks at everything)
" map <C-P> :DeniteProjectDir -buffer-name=git -direction=top file_rec/git<CR>
" map <C-O> :DeniteProjectDir -buffer-name=files -direction=top file_rec<CR>

" -u flag to unrestrict (see ag docs)
" denite content search
" map <C-p><C-s> :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<CR>
nnoremap <c-p> :FZF<cr>
nnoremap <c-p><c-b> :Buffers<cr>
" nnoremap <c-p><c-s> :Ack <C-R><C-W><CR>
nnoremap <c-p><c-s> :Ag <C-R><C-W><CR>
nnoremap <c-p><c-d> :Dash <C-R><C-W><CR>
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

let g:user_emmet_settings = {
												\  'javascript.jsx' : {
												\      'extends' : 'jsx',
												\  },
												\}
let g:syntastic_javascript_checkers = ['eslint']
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier-eslint', 'eslint']}
let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma --bracket-spacing --jsx-bracket-same-line'
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

let g:notes_directories = ['~/Documents/Notes']
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
" "
let g:closetag_shortcut = '>'
"Elixir Tage Stack
let g:alchemist_tag_stack_map = '<C-T><C-A>'

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
