-- turn on line numbers and activate relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Ignore the case when the search pattern is all lowercase
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Disable line wrapping
vim.opt.wrap = false

-- Keep lines below cursor when scrolling
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5

-- Don't highlight search results
vim.opt.hlsearch = false

-- Enable cursorline
vim.opt.cursorline = true

-- Always display signcolumn (for diagnostic related stuff)
vim.opt.signcolumn = 'yes'

-- When opening a window put it right or below the current one
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tab set to four spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Insert mode completion setting
vim.opt.completeopt = { 'menu', 'menuone' }

-- color theme
-- vim.opt.termguicolors = true
-- vim.cmd('colorscheme gruvbox')

-- this also controls how fast which key comes up
vim.opt.timeoutlen = 500

---WORKAROUND https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
    end
})
---ENDWORKAROUND

-- for https://github.com/wfxr/minimap.vim plugin
vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.inimap_auto_start_win_enter = 1
vim.g.minimap_block_filetypes = { 'nvim-tree', 'fugitive', 'nerdtree', 'tagbar', 'fzf' }
vim.g.minimap_block_buftypes = { 'nofile', 'nowrite', 'quickfix', 'terminal', 'prompt' }
vim.g.minimap_git_colors = 1
vim.g.minimap_highlight_range = 1
