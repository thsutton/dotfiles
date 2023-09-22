local M = {
    "stevearc/oil.nvim",
}

M.lazy = false

M.dependencies = {
    { "nvim-tree/nvim-web-devicons" },
}

M.keys = {
    { "<leader>b", ":Oil<CR>", desc = "Open parent directory" },
}

function M.config()
    require("oil").setup {
	default_file_explorer = true,
	columns = {
	    "icon",
	    "permissions",
	    "size",
	    "mtime",
	},
	view_options = {
	    show_hidden = true,
	},
	float = {
	    padding = 5,
	    max_width = 0,
	    max_height = 0,
	    border = "rounded",
	    win_options = {
		winblend = 0,
	    },
	},
    }
end

return M
