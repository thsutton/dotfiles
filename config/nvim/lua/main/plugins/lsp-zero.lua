local M = {
    "VonHeikemen/lsp-zero.nvim",
}

M.branch = "v3.x"

M.dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    -- Snippets
    "L3MON4D3/LuaSnip",
}

function M.config()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
    end)

    require("mason").setup {}
    require("mason-lspconfig").setup {
	ensure_installed = {
	    "lua_ls",
	    "bashls",
	},
	handlers = {
	    lsp_zero.default_setup,
	},
    }
end

return M
