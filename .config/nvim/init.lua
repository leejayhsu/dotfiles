-- ========================================================================== --
-- ==                            DEPENDENCIES                              == --
-- ========================================================================== --

-- ripgrep    - https://github.com/BurntSushi/ripgrep
-- fd         - https://github.com/sharkdp/fd
-- git        - https://git-scm.com/
-- make       - https://www.gnu.org/software/make/
-- c compiler - gcc or tcc or zig


-- Basic editor options
require('user.settings')

-- -- Keybindings
require('user.keymaps')

-- Plugin management and config
require('plugins')
require('plugin.telescope')
require('plugin.whichkey')
require('plugin.onedark')
require('plugin.treesitter')
require('plugin.mason')
require('plugin.lualine')
-- require('plugin.lspconfig')
require('plugin.lspzero')
require('plugin.lspsignature')
require('plugin.bufferline')
require('plugin.symbolsoutline')
require('plugin.nvimtree')
require('plugin.gitsigns')
