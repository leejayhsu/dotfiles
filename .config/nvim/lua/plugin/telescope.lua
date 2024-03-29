require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        layout_config = {
            vertical = { width = 0.6 },
            horizontal = { width = 0.9 }
            -- other layout configuration here
        },
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        project = {
            -- base_dirs = {
            --     { '~/code', max_depth = 1 },
            -- },
            hidden_files = false, -- default: false
            -- theme = "dropdown"
        }
    }
}

-- Finally, load the extensions

-- to configure file_browser
-- https://github.com/nvim-telescope/telescope-file-browser.nvim#setup-and-configuration
require("telescope").load_extension "file_browser"

require 'telescope'.load_extension('project')
