local M = {
    "m4xshen/smartcolumn.nvim",
}

function M.config()
    require("smartcolumn").setup {
        colorcolumn = { "80", "100" },
    }
end

return M
