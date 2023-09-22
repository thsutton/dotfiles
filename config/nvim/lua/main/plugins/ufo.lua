local M = {
    "kevinhwang91/nvim-ufo",
}

M.dependencies = {
    "kevinhwang91/promise-async",
}

function M.config()
    require("ufo").setup {
	provider_selector = function(bufnr, filetype, buftype)
		return {'treesitter', 'indent'}
	end,
    }
end

function M.keys()
    return {
         { "<leader>zR", function() require("ufo").openAllFolds() end },
         { "<leader>zM", function() require("ufo").closeAllFolds() end },
    }
end

return M
