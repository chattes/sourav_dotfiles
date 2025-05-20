set nocompatible
set number relativenumber
set path=$PWD/**
set wildignore+=*/node_modules/*,*/dist/*
set tags=tags
set colorcolumn=80
set textwidth=80
set cindent
set tabstop=2
set shiftwidth=2
set nobackup
set noswapfile
set hidden
set signcolumn=yes
set background=dark
set t_Co=256
set t_ut=
set completeopt=menu,menuone,noselect

let mapleader = ","
filetype off

" Preserve your Tmux navigation
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
let g:tmux_navigator_no_mappings = 1

" Terminal mappings
if has('nvim')
    :tnoremap <Esc> <C-\><C-n>
    nnoremap <C-o><C-t> :below 10sp term://$SHELL<cr>i
    set inccommand=split
endif
tnoremap ii <C-\><C-n>

" Start Plug
call plug#begin('~/.local/share/nvim/plugged')
" LSP Support - replacing CoC with native LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'github/copilot.vim'            " AI code completion

" Modern Neovim plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'         " Required for many modern plugins
Plug 'kyazdani42/nvim-web-devicons'  " Icons for file explorer

" File navigation
Plug 'nvim-telescope/telescope.nvim' " For file operations
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-tree.lua'      " Modern replacement for NERDTree
Plug 'jremmen/vim-ripgrep'           " Primary search tool

" JavaScript/Node.js specific
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mattn/emmet-vim'

" Keeping your essential productivity tools
Plug 'tpope/vim-fugitive'            " Git integration
Plug 'tpope/vim-surround'            
Plug 'tpope/vim-commentary'          " Better than tcomment
Plug 'windwp/nvim-autopairs'         " Auto pairing
Plug 'alvan/vim-closetag'            " Keeping for JSX
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'

" Themes and visuals
Plug 'tomasiser/vim-code-dark'       " Keeping your preferred theme
Plug 'nvim-lualine/lualine.nvim'     " Modern replacement for airline
call plug#end()

" Basic settings
filetype plugin indent on
syntax on
colorscheme codedark

" File explorer toggle - keeping your shortcut
map <silent> <C-t> :NvimTreeToggle<CR>
" Find current file in NvimTree
nnoremap <leader>nf :NvimTreeFindFile<CR>

" RipGrep settings - your primary search tool
let g:rg_command = 'rg --vimgrep --smart-case --hidden --glob "!{node_modules/*,.git/*,dist/*}"'
let g:rg_derive_root = 1
let g:rg_highlight = 1

" RipGrep key mappings
nnoremap <leader>rg :Rg<Space>
nnoremap <leader>rw :Rg <C-R><C-W><CR>
nnoremap <leader>rl :Rg<Space><C-R>=expand('%:t')<CR><CR>

" Quickfix navigation shortcuts
nnoremap <leader>co :copen<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>cc :cclose<CR>

" Telescope for file operations (not for searching text)
nnoremap <c-p> <cmd>Telescope git_files<cr>
nnoremap <c-p><c-b> <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles<cr>
nnoremap <leader>/ <cmd>Telescope current_buffer_fuzzy_find<cr>

" VimWiki setup (keeping your wikis)
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

" Keep JSX settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_emptyTags_caseSensitive = 1

" Emmet config for JSX
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}
let g:user_emmet_leader_key='<C-E>'

" Initialize Lua configs
lua << EOF


-- NvimTree Enhanced Setup (Fixed for latest version)
require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    width = 30,
    side = "left",
  },
  -- Remove the mappings from the view section
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    
    -- Default mappings
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  end,
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
      },
    },
  },
  renderer = {
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
})



-- Auto open nvim-tree when opening a directory
local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1
  if not directory then return end
  vim.cmd.cd(data.file)
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Simple Telescope setup - primarily for file operations, not text search
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules/",
      "dist/",
      ".git/"
    },
    path_display = { "truncate" },
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = { "rg", "--files", "--hidden", "--glob", "!{node_modules/*,.git/*,dist/*}" },
    },
  },
}

-- LSP setup with on_attach for proper keybindings
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  
  -- Mappings
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>qf', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  
  -- Print when an LSP attaches to a buffer
  print('LSP attached: ' .. client.name)
end

-- JavaScript/TypeScript LSP setup
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- ESLint setup
lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- Load VSCode-like snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered(),
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end
  }
}

-- Treesitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "json", "lua", "vim" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
}

-- Configure lualine
require('lualine').setup {
  options = {
    theme = 'codedark',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

-- Autopairs setup
require('nvim-autopairs').setup{
  check_ts = true,
  ts_config = {
    javascript = {'template_string'},
    typescript = {'template_string'},
  }
}
EOF
