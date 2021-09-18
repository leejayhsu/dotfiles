--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- vim.g.vscode_style = "dark"
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "storm"
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

lvim.keys.normal_mode["gdv"] = ":vsp<cr><cmd>lua vim.lsp.buf.definition()<CR>"
lvim.keys.normal_mode["gdx"] = ":sp<cr><cmd>lua vim.lsp.buf.definition()<CR>"
lvim.keys.normal_mode["gd<space>"] = "<cmd>lua vim.lsp.buf.definition()<CR>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
lvim.builtin.which_key.mappings["f"] = {
  name = "+Find",
  r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "References" },
  f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
  s = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "Workspace Symbols" },
  g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "String Grep" },
}
lvim.builtin.which_key.mappings["w"] = {
  name = "+Window",
  w = { "<C-w>w", "switch window" },
  h = { "<C-w>h", "activate window left" },
  H = { "<C-w>H", "move window to far left" },
  l = { "<C-w>l", "activate window right" },
  L = { "<C-w>L", "move window to far right" },
  j = { "<C-w>j", "activate window below" },
  k = { "<C-w>k", "activate window above" },
  s = { "<C-w>s", "split window horizontal" },
  v = { "<C-w>v", "split window vertical" },
  q = { "<C-w>q", "close window" }
}
lvim.builtin.which_key.mappings["g"]["O"] = { "<cmd>GBrowse<cr>", "Open on Github.com"}
lvim.builtin.which_key.mappings["b"]["N"] = {":enew<cr>", "New Buffer in place"}
lvim.builtin.which_key.mappings["b"]["X"] = {":new<cr>", "New Buffer (HSplit)"}
lvim.builtin.which_key.mappings["b"]["V"] = {":vnew<cr>", "New Buffer (VSplit)"}
lvim.builtin.which_key.mappings["b"]["T"] = {":tabnew<cr>", "New Buffer (Tab)"}
lvim.builtin.which_key.mappings["b"]["m"] = {
    name = "+Move buffer to new split",
    v = {":vsp<cr><C-w>w<C-^>", "VSplit"},
    x = {":sp<cr><C-w>w<C-^>", "HSplit"}
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.lualine.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 6
lvim.builtin.nvimtree.ignore = { '.git', '__pycache__' }
lvim.builtin.nvimtree.git_hl = 1
lvim.builtin.nvimtree.hide_dotfiles = 0
vim.g.gitblame_date_format = "%r"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true


lvim.builtin.telescope.defaults.path_display = { }
lvim.builtin.telescope.defaults.file_sorter = require'telescope.sorters'.get_fuzzy_file
lvim.builtin.telescope.extensions.project = {
    base_dirs = {
        "~/repo/baas_bsa",
        "~/repo/baas_financial_core",
        "~/repo/cbw-gateway-service",
    },
    hidden_files = true
}

-- dashboard
lvim.builtin.dashboard.custom_header = {
  '               ▄▄██████████▄▄             ',
  '               ▀▀▀   ██   ▀▀▀             ',
  '       ▄██▄   ▄▄████████████▄▄   ▄██▄     ',
  '     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   ',
  '    ████▄ ▄███▀              ▀███▄ ▄████  ',
  '   ███▀█████▀▄████▄      ▄████▄▀█████▀███ ',
  '   ██▀  ███▀ ██████      ██████ ▀███  ▀██ ',
  '    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  ',
  '       ███           ▀▀           ███     ',
  '       ██████████████████████████████     ',
  '   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ ',
  '   ███  ███ ███   ██    ██   ███▄███  ███ ',
  '   ▀██▄████████   ██    ██   ████████▄██▀ ',
  '    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  ',
  '     ▀███▄  ▀███████    ███████▀  ▄███▀   ',
  '       ▀███    ▀▀██████████▀▀▀   ███▀     ',
  '         ▀    ▄▄▄    ██    ▄▄▄    ▀       ',
  '               ▀████████████▀             ',
}

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
lvim.lsp.null_ls.setup = {
  root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules", "pyproject.toml", "requirements.txt"),
}
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)

-- disabling nvim lsp diagnostic formatters because
-- 1. ale has better options for exactly when to lint (like not linting when opening 3rd party repo files)
-- 2. null ls doesn't support mypy yet (https://github.com/jose-elias-alvarez/null-ls.nvim/pull/155)
-- 3. i don't know how to configure nvim lsp without null-ls :)

-- lvim.lang.python.formatters = {
--   {
--     exe = "black"
--   },
--     { exe = "isort"}

-- }
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }
lvim.lang.go.formatters = {
  {
    exe = "gofmt"
  },
    {
        exe = "goimports"
    }
}
lvim.lang.json.formatters = {
  {
    exe = "prettier"
  }
}
lvim.lang.yaml.formatters = {
  {
    exe = "prettier"
  }
}
lvim.lang.sh.formatters = {
  {
    exe = "shfmt"
  },
  {
    exe = "shellharden"
  }
}
lvim.lang.sh.linters = {
  {
    exe = "shellcheck",
  }
}

-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"},
    {"Mofiqul/vscode.nvim"},
    {"dracula/vim"},
    {
        "nvim-telescope/telescope-project.nvim",
        event = "BufWinEnter",
        setup = function()
            vim.cmd [[packadd telescope.nvim]]
        end,
    },
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            vim.g.gitblame_enabled = 1
            vim.g.gitblame_date_format = '%x'
        end,
    },
    {
      "tpope/vim-fugitive",
      cmd = {
        "G",
        "Git",
        "Gdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GDelete",
        "GBrowse",
        "GRemove",
        "GRename",
        "Glgrep",
        "Gedit"
      },
      ft = {"fugitive"}
    },
    { "tpope/vim-rhubarb" },
    {
        "pwntester/octo.nvim",
        event = "BufRead",
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = function()
        require "lsp_signature".setup()
        end
    },
    { 'dense-analysis/ale' }
}

-- these are mostly to avoid linting when opening 3rd party repo files
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_enter = 0
-- if i can figure out how to do this config in lua, this could be used to ignore 3p repo files instead of the 3 lines above
-- let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}
vim.g.ale_linters = {
    python = {'mypy', 'flake8'}
}
vim.g.ale_fixers = {
    python = {'black', 'isort', 'trim_whitespace'}
}
