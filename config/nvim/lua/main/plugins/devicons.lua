local M = {
    "nvim-tree/nvim-web-devicons",
}

function M.config()
    require('nvim-web-devicons').setup {
        color_icons = true;
    }
end

return M