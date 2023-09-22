local M = {
    "nvim-lualine/lualine.nvim",
}

M.dependencies = {
    { "nvim-tree/nvim-web-devicons" },
}

function M.config()
    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = "tokyonight",
        },
    }
end

return M
