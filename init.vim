set mouse=a  " enable mouse
set encoding=utf-8
set number
set relativenumber
set noswapfile
set scrolloff=7
syntax enable
set completeopt
" set cursorline
set hidden
set nowrap
set incsearch
set nowb
set nobackup
set ruler
map <F2> :NvimTreeToggle<CR>
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set colorcolumn=79
set guicursor+=a:blinkon1
nnoremap ,<space> :nohlsearch<CR>
set linebreak
let mapleader = " "
nmap qq :q<cr>
nmap <leader>w :w!<cr>
nmap <leader>qq :bd<cr>
nmap <leader>qa :bufdo<cr>
nmap <leader><right> :bnext<cr>
nmap <leader><left> :bprevious<cr>
nmap <leader>br :BufferRestore<cr>
nmap <leader>qa :BufferCloseAllButCurrentOrPinned<cr>
nmap <leader>b :Telescope buffers<cr>
nmap <leader>d :BufferMoveNext<cr>
nmap <leader>a :BufferMovePrevious<cr>
nmap <leader>p :BufferPick<cr>
nmap <leader>bd :BufferPickDelete<cr>
nmap <leader>bp :BufferPin<cr>

set pumheight=25

" window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" navigation in insert
imap <A-h> <left>
imap <A-j> <down>
imap <A-k> <up>
imap <A-l> <right>

" delete with Alt + d
imap <A-d> <del>

imap qw <esc>
vmap qw <esc>
imap <C-s> <esc>
nmap <leader>ff :Telescope find_files<cr>
nmap <leader>fg :Telescope live_grep<cr>
nmap <leader>/ :Telescope current_buffer_fuzzy_find<cr>
nmap <leader>fo :Telescope oldfiles<cr>
nmap <leader>f :Files<cr>
nmap <leader>l :Lines<cr>

" Rust formatter
nmap <leader>rf :RustFmt<cr>

" Golang formatters
nmap <leader>gf :!gofmt -w % && golines -w % && goimports -w %<cr>

" Python formatter
nmap <leader>pf :!black %<cr>

" Web formatter
nmap <leader>wf :!prettier % -w<cr>

set autoindent

set iminsert=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set fileformat=unix
filetype indent on      " load filetype-specific indent files

" for tabulation
set smartindent
set shiftwidth=2

call plug#begin('~/.vim/plugged')

Plug 'numToStr/Comment.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" color schemas
Plug 'yassinebridi/vim-purpura'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tribela/vim-transparent'
Plug 'gen740/SmoothCursor.nvim'

" Startup Screen
Plug 'nvimdev/dashboard-nvim'
Plug 'goolord/alpha-nvim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'Pocco81/auto-save.nvim'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'ray-x/lsp_signature.nvim'

call plug#end()

" Moving string
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" coc plug
let g:coc_global_extensions=[
    \'coc-json',
    \'coc-tsserver',
    \'coc-rust-analyzer',
    \'coc-css',
    \'coc-html',
    \'coc-xml',
    \'coc-yaml',
    \'coc-toml',
    \'coc-clangd',
    \'coc-pyright',
    \'coc-go',
    \'coc-snippets',
    \]

"   JS, TS, Json
"    \
"    \'coc-json',
"    \'coc-tsserver',
"   Rust
"    \
"    \'coc-rust-analyzer',
"   HTML, CSS
"    \
"    \'coc-css',
"    \'coc-html',
"   XML, YAML, TOML
"    \
"    \'coc-xml',
"    \'coc-yaml',
"    \'coc-toml',
"   C/C++
"    \
"    \'coc-clangd',
"   Python
"    \
"    \'coc-pyright',
"   Golang
"    \
"    \'coc-go',
"   Snippets
"    \
"    \'coc-snippets',

" Rust
lua << EOF
require("rust-tools").setup()
EOF

" Automatically format frontend files with prettier after file save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Disable quickfix window for prettier
let g:prettier#quickfix_enabled = 0

" Coc-config
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-down> and <C-up> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Turn on vim-sneak
let g:sneak#label = 1

lua << EOF
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'
local async = require "plenary.async"

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  completion = {
    autocomplete = false
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<up>'] = cmp.mapping.select_prev_item(),
    ['<down>'] = cmp.mapping.select_next_item(),
    ['<C-up>'] = cmp.mapping.scroll_docs(-4),
    ['<C-down>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<esc>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      floating_window = false,
      floating_window_above_cur_line = true,
      floating_window_off_x = 20,
      doc_lines = 10,
      hint_prefix = '👻 '
    }, bufnr)  -- Note: add in lsp client on-attach
end

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
    },
    on_attach = on_attach
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = {'rust_analyzer' }
local servers = { 'pyright', 'rust_analyzer', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF


" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)

let g:transparent_enabled = v:true

" Telescope fzf plugin
lua << EOF
local present, telescope = pcall(require, "telescope")

if not present then
  return
end

vim.g.theme_switcher_loaded = true

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "themes", "terms" },
}

telescope.setup(options)
EOF

" SmoothCursor
lua << EOF
require('smoothcursor').setup({
    autostart = true,
    cursor = "👻",              -- cursor shape (need nerd font)
    texthl = "SmoothCursor",   -- highlight group, default is { bg = nil, fg = "#FFD400" }
    linehl = nil,              -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
    type = "default",          -- define cursor movement calculate function, "default" or "exp" (exponential).
    fancy = {
        enable = true,        -- enable fancy mode
        head = { cursor = "🌟", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "👻", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🐢", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🐸", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🐨", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🦀", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🐼", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "⭐", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🧬️", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🦝", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "🦊", texthl = "SmoothCursor", linehl = nil },
        body = {
            { cursor = "", texthl = "SmoothCursorPurple" },
            { cursor = "", texthl = "SmoothCursorPurple" },
            { cursor = "●", texthl = "SmoothCursorPurple" },
            { cursor = "●", texthl = "SmoothCursorPurple" },
            { cursor = "•", texthl = "SmoothCursorPurple" },
            { cursor = ".", texthl = "SmoothCursorPurple" },
            { cursor = ".", texthl = "SmoothCursorPurple" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" }
    },
    flyin_effect = nil,        -- "bottom" or "top"
    speed = 25,                -- max is 100 to stick to your current position
    intervals = 35,            -- tick interval
    priority = 10,             -- set marker priority
    timeout = 3000,            -- timout for animation
    threshold = 3,             -- animate if threshold lines jump
    disable_float_win = false, -- disable on float window
    enabled_filetypes = nil,   -- example: { "lua", "vim" }
    disabled_filetypes = nil,  -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
})

local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'ModeChanged' }, {
  callback = function()
    local current_mode = vim.fn.mode()
    if current_mode == 'n' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
      vim.fn.sign_define('smoothcursor', { text = "🦀" })
    elseif current_mode == 'v' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffffff' })
      vim.fn.sign_define('smoothcursor', { text = "" })
    elseif current_mode == 'V' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffffff' })
      vim.fn.sign_define('smoothcursor', { text = "" })
    elseif current_mode == 's' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ffffff' })
      vim.fn.sign_define('smoothcursor', { text = "" })
    elseif current_mode == 'i' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#FFF6A1' })
      vim.fn.sign_define('smoothcursor', { text = "" })
    end
  end,
})
EOF

" NvimTree setup
lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local options = {
  filters = {
    dotfiles = true,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = "left",
    width = 30,
    preserve_window_proportions = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = true,
    },
  },
  renderer = {
    root_folder_modifier = ":t",
    highlight_git = true,
    highlight_opened_files = "none",

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

      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "󰉋",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "󰀘",
        },
      },
    },
  },
}

require("nvim-tree").setup(options)
EOF

" Comment
lua << EOF
require('Comment').setup(
{
    toggler = {
        ---Line-comment toggle keymap
        line = 'ccc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'c',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment at the end of line
        eol = 'ce',
    },
})
EOF

" Treesitter config
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = { enable = true },
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "go",
    "javascript",
    "json",
    "python",
    "toml",
    "typescript",
    "vim",
    "lua",
    "yaml",
  }
}
EOF

" Tabline config
lua << EOF
vim.g.barbar_auto_setup = false -- disable auto-setup
require'barbar'.setup {
  icons = {
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ '},
      [vim.diagnostic.severity.WARN] = {enabled = true},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = false},
    },
    modified = {button = '●'},
    pinned = {button = '車', filename = true, separator = {right = ''}},
  },
  insert_at_end = true,
  auto_hide = true,
}
EOF

" Statusline config
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = ' 🐨', right = '🐸 ' },
    component_separators = { left = '', right = '' },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    disabled_filetypes = { "alpha", "NvimTree" },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch',
      {'diff', symbols = { added = ' ', modified = ' 柳', removed = '  ' },
        diff_color = {
          added = { fg = '#20fc03' },
          modified = { fg = '#ffffff' },
          removed = { fg = '#00ffff' },
        },
      },
      {'diagnostics', sources = { 'nvim_diagnostic' },
        symbols = { error = '(╯°□°)╯  ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { fg = '#ff0000' },
          color_warn = { fg = '#ff9900' },
          color_info = { fg = '#adadad' },
        },
      }
    },
    lualine_c = {{'filename', color = { gui = 'bold' }}, 'filesize'},
    lualine_x = {'filetype', 'encoding', 'fileformat'},
    lualine_y = {'%l,%c/%L'},
    lualine_z = {'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = { lualine_c = {{"%f", color = { gui = 'bold' }}}, },
  inactive_winbar = {},
  extensions = {}
}
EOF

" Startup Screen
lua << EOF
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
     [[------------------------------------------------------]],
     [[| ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⠿⠿⠛⠛⠋⢉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠛⠛⠛⠿⢿⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀ |]],
     [[| ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⠟⠋⠉⠀⠀⠀⠀⢰⣾⣂⠄⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠈⠀⠀⠀⠉⠛⠿⣶⣤⡀⠀⠀⠀⠀ |]],
     [[| ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡾⠛⠉⠀⠀⠀⠄⠂⠀⢀⣶⡿⠛⢿⡿⠀⠀⠀⠈⠰⠁⡀⣤⣽⣶⡄⠂⠀⢀⠀⠀⠀⠀⠉⠛⢶⣄⠀⠀ |]],
     [[| ⠀⠀⠀⠀⠀⠀⠀⢀⣴⠿⠋⠐⢀⠂⠐⠀⢈⠰⢀⢢⣿⠏⠀⠀⣼⡇⡃⠄⠂⠐⠠⢢⣿⠏⠀⠙⣿⠀⠀⠀⡀⠂⠀⠄⠀⠀⠀⠘⠻⣦ |]],
     [[| ⠀⠀⠀⠀⠀⢀⣴⠿⠃⠐⠀⠈⠂⠀⠠⠁⠀⠢⢰⣿⡏⠀⠀⢠⣿⠃⠁⠄⠂⠱⣰⣿⠇⠀⠀⢰⣿⡇⠀⠀⠀⠀⠀⠄⠁⠀⠁⠠⠁⠈ |]],
     [[| ⠀⠀⠀⡀⣤⣿⠋⠠⠐⠀⡀⠂⠈⠀⠠⠀⢀⢡⣿⣿⣇⣀⣴⣿⡏⠀⢀⠂⠄⣧⣿⣿⠀⠀⢀⣾⣿⠁⠀⠀⡀⠂⠀⠠⠀⠂⠀⠀⠀⠀ |]],
     [[| ⠀⠀⢈⣼⡟⠁⠠⠁⠂⠀⠀⠐⠀⡁⠠⠂⡀⣾⣿⣿⣿⣿⣿⡟⣰⠀⠂⠀⢰⣻⣿⣷⣦⣤⣾⣿⡏⠀⠀⢀⠀⠀⡐⠀⠠⠐⠀⡀⠀⠀ |]],
     [[| ⣠⣄⣾⠃⡀⠀⠐⠀⢀⢠⣀⢄⡀⠀⠁⠀⢀⣿⣿⣿⣿⣿⡟⠀⠀⠀⠐⠀⡁⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠂⠀⠀⠄⠀⠄⠀⠀⠀ |]],
     [[| ⣿⣿⠃⠀⡀⠁⠈⠐⣬⢷⡹⢮⡝⣆⠀⠀⠀⣿⣿⣿⣿⠏⠀⠀⠀⠁⠀⠀⡡⣿⣿⣿⣿⣿⣿⠃⠀⠈⠠⠐⠀⠠⠀⠂⠀⠠⠀⠀⠀⠀ |]],
     [[| ⣾⣧⠀⠀⠐⠀⠀⠀⠈⠫⠝⠧⠛⠀⠀⠀⠀⠹⠿⠟⠁⡀⢤⣤⣤⣀⠠⠀⠑⢻⣿⣿⣿⡿⠁⠀⠀⠐⠀⡀⢀⡀⢀⠀⠀⠁⠠⠀⠀⠀ |]],
     [[| ⣿⡇⠀⠀⠀⠄⠂⠄⠀⡀⠀⠀⠠⠐⠀⡄⠀⠀⠀⠀⠀⠀⣺⣿⣿⣿⣷⠆⠀⠈⠛⠿⠋⠀⠀⢀⠀⢂⡷⣹⢧⣛⢧⣖⡠⠀⠀⢀⠀⠀ |]],
     [[| ⡏⠁⠠⠀⢀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⣹⣿⡿⢻⡏⠀⠀⠀⠀⠀⠀⠀⠄⢀⠀⠹⢜⡳⢮⡝⣾⢸⠓⡀⠁⠀⠀⠀ |]],
     [[| ⠃⠀⠐⠀⡀⣦⣬⣤⣤⣴⣄⣂⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⢼⣏⢻⡿⠃⠀⠀⠉⠀⠀⠀⠀⠄⠀⠀⠀⠀⠉⠂⠙⠀⠁⡀⠀⠀⠁⠀⠀ |]],
     [[| ⠀⠀⢀⣂⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣧⣤⣤⣤⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⢁⠀⠄⠀⠀⠀⠀ |]],
     [[| ⠀⠀⠉⠉⠉⠻⣿⣿⣳⣯⢿⣽⣻⡽⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣤⠀⠀⠀⡀⠀⠂⠀⠀⠀ |]],
     [[| ⠀⠀⠠⢀⠀⠀⠈⢿⣿⡾⣯⡷⣿⣽⣻⣾⡟⠁⢹⣿⡿⠻⢿⣿⣳⣯⢿⡽⣯⣟⣿⣻⣟⡿⣿⢿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠁⠀⠀ |]],
     [[| ⠀⠀⢀⠀⠠⠀⠀⠈⢿⣿⣷⣻⣷⣿⣿⣿⡇⠀⢸⣿⣷⣄⣰⣿⣿⡽⣯⣟⣷⣻⣞⡷⣯⣿⣿⠟⠋⠉⠉⠉⠉⠉⠙⠓⠤⣄⡀⠀⠀⠀ |]],
     [[| ⠀⠀⠀⡀⠄⠀⠀⠀⢹⣿⣿⠋⠁⣠⣀⡀⠀⠀⣿⣿⠋⠉⣿⣿⣿⠿⠟⠛⠿⢿⣾⣿⣿⠟⠁⠀⠀⡀⠐⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀ |]],
     [[| ⠀⠀⠀⢀⠀⠀⠡⠀⢿⣿⡏⠀⣸⣿⣿⣷⠀⢠⣿⣿⠀⠀⣿⡿⠁⢀⣤⡤⠀⠀⢿⣿⠏⠀⠀⠀⠂⠀⠀⠀⠂⠀⠁⡀⢀⠀⠐⠀⠀⠀ |]],
     [[| ⠀⠀⠄⠀⠠⠁⢀⢩⣾⣿⣇⠀⠹⢿⣿⠿⠀⢸⣿⡗⠀⢰⣿⡃⠀⠀⠀⣀⣤⣶⣿⣿⠀⠀⠂⠐⠀⠀⡀⠂⠀⡀⠁⠀⠀⠀⠈⠀⠀⠀ |]],
     [[| ⡀⢀⠀⠁⢠⡐⣮⣾⣿⡿⣿⣷⣄⣈⣉⣀⣀⣸⣿⣇⠀⢸⣿⣧⡀⠈⠛⠿⠟⠉⢿⣿⡆⠀⠀⠁⠀⠀⠀⡀⢀⠀⠄⠁⡀⠈⠀⢁⠀⠀ |]],
     [[| ⣼⡢⢎⣷⣣⣾⣿⣿⣯⣟⣷⣻⣿⣿⣿⣿⣿⢿⣿⣿⣿⡿⣟⣿⣿⣶⣦⣴⣴⣶⣿⣿⣿⡠⢀⠈⠀⠐⠀⠀⠀⠠⠀⢂⠀⠄⠁⢂⠀⣀ |]],
     [[| ⣿⣿⣿⣿⢟⠫⣍⢛⡹⢛⡛⡟⠿⠿⠿⡿⣿⣿⣿⣿⣷⣿⣯⣷⣯⣿⣽⣻⣟⣿⣻⣟⣿⣷⡍⡖⢤⣈⠐⡈⠠⢁⠂⠄⢠⢀⣂⢦⢳⠰ |]],
     [[| ⣿⢯⡿⣿⣯⡖⣡⠏⣔⠫⠴⡙⡬⢃⡳⣘⡔⠲⡤⡩⢍⡍⢏⡛⣛⢛⠻⠟⡿⢿⣿⣿⣾⣿⣿⣜⠦⣌⠳⢥⡓⢮⡜⣎⠳⡜⣬⢳⢣⡙ |]],
     [[| ⣿⢯⣟⡿⣿⣿⣇⣞⣌⢣⠏⣜⡡⢏⠴⣡⠚⡥⢣⡱⢣⠜⣪⠱⡌⡎⣝⢪⢱⣒⢦⣲⠱⣬⢽⡻⢿⣮⣝⢦⡙⢣⡚⢬⢓⣙⢒⡫⢆⡹ |]],
     [[------------------------------------------------------]],
}

dashboard.section.buttons.val = {
   dashboard.button("f", "󰈚  Find File", ":Telescope find_files <CR>"),
   dashboard.button("e", "󰉋  File Explorer", ":NvimTreeToggle <CR>"),
   dashboard.button("t", "󰚩  Find Text", ":Telescope live_grep <CR>"),
   dashboard.button("o", "  Recent files", ":Telescope oldfiles <CR>"),
   dashboard.button("q", "  Quit", ":qa<CR>"),
}

local function footer()
 return "Don't Stop Until You are Proud..."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
EOF

" Colorscheme
colorscheme purpura

" Colors for messages in code
set termguicolors
hi DiagnosticError guifg=#d000ff
hi DiagnosticUnderlineError cterm=undercurl ctermfg=203 ctermbg=54 gui=undercurl guibg=None guifg=#ff21a2 guisp=#fc0394
hi DiagnosticUnderlineWarn cterm=undercurl ctermfg=203 ctermbg=54 gui=undercurl

" Line Numbers
hi LineNr guifg=#aa7dff

" Popup Menu
hi Pmenu guibg=None guifg=#ffffff
hi CocMenuSel guifg=#000000 guibg=#aa7dff
hi PmenuSel guifg=#000000 guibg=#aa7dff
hi PmenuSbar guibg=#503a78
hi PmenuThumb guibg=#ffffff
