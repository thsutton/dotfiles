local M = {
    "folke/trouble.nvim",
}

M.dependencies = {
    "nvim-tree/nvim-web-devicons",
}

function M.keys()
    return {
        { "<leader>xx", function() require("trouble").open() end, desc = "Show problems" },
    }
end

function M.config()
    require('trouble').setup {
        position = 'bottom',
        height = 10,
    }
end

return M
