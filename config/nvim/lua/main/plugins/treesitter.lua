local M = {
    "nvim-treesitter/nvim-treesitter",
}

function M.config()
    require("nvim-treesitter.configs").setup {
        ensure_installed = {
            "bash",
            "c",
            "lua",
            "rust",
            "terraform",
            "vim",
            "vimdoc",
            "yaml",
        },
        ignore_install = {
            "javascript",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }
end

return M
