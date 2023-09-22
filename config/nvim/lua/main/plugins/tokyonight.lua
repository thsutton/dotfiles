local M = {
    "folke/tokyonight.nvim",
}

M.lazy = false
M.priority = 1000

function M.config()
    require("tokyonight").setup {
    }

    vim.cmd[[colorscheme tokyonight]]
end

return M
