local M = {
    "folke/todo-comments.nvim",
}


M.dependencies = {
    "nvim-lua/plenary.nvim",
}

function M.config()
    require("todo-comments").setup()
end

return M
