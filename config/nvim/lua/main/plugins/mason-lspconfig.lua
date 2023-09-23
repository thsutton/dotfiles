local M = {
    "williamboman/mason-lspconfig.nvim",
}

M.dependencies = {
    "williamboman/mason.nvim",
}

function M.config()
    require("mason-lspconfig").setup {
        ensure_installed = {
            "bashls",
            "lua_ls",
        },
    }
end

return M
