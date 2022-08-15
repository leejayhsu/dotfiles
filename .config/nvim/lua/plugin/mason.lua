-- seems like it's recommended to use UI to interact with mason
-- https://github.com/williamboman/mason.nvim#commands
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = { "sumneko_lua", "pyright" }
}
