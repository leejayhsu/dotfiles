local wk = require("which-key")

wk.register({
    g = {
        r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "references!", noremap = true },
        d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "definition" }
    }
})

wk.register({
    ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "buffer 1" },
    ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "buffer 2" },
    ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "buffer 3" },
    ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "buffer 4" },
    ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "buffer 5" },
    ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "buffer 6" },
    ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "buffer 7" },
    ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "buffer 8" },
    ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "buffer 9" },
    f = {
        name = "+Find", -- optional group name
        r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "references" },
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "files" },
        s = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", "workspace symbols" },
        g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "string grep" },
        d = { "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", "document diagnostics" },
        a = { "<cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>", "code actions" },
        b = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "buffer symbols" },
    },
    w = {
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
    },
    b = {
        name = "+Buffer",
        d = { ":bd<cr>", "delete buffer" },
        m = {
            name = "+Move buffer to new split",
            v = { ":vsp<cr><C-w>w<C-^>", "VSplit" },
            x = { ":sp<cr><C-w>w<C-^>", "HSplit" }
        }
    },
    o = { "<cmd>SymbolsOutline<cr>", "outline" },
    e = { "<cmd>NvimTreeToggle<cr>", "file explorer" },
    -- a failed attempt to have a toggle that auto finds the file in tree
    -- e = { "<cmd>NvimTreeToggle<cr><cmd>NvimTreeFindFile<cr>", "file explorer" },
    p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>jk", "projects" },
}, { prefix = "<leader>" }
)
