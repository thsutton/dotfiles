vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.o.backup = false
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.errorbells = false
vim.o.expandtab = true
vim.o.hidden = true
vim.o.incsearch = true
vim.o.shiftwidth = 4
vim.o.showmode = true
vim.o.smartcase = true
vim.o.softtabstop = 0
vim.o.syntax = 'on'
vim.o.tabstop = 8
vim.o.termguicolors = true
vim.o.undodir = vim.fn.stdpath('state') .. '/undodir'
vim.o.undofile = true

vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.swapfile = false

vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false


require("thsutton.plugins")

require("lsp-colors").setup {}

require("lspconfig").sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        }
    }
}

require("lspconfig").terraformls.setup {}

local cmp = require("cmp")
cmp.setup {
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    })
}


require("neoclip").setup {
    history = 1000
}

local telescope = require('telescope')
telescope.load_extension("neoclip")

require("trouble").setup {
    position = "bottom",
    height = 10
}

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fy', telescope.extensions.neoclip.neoclip, {})

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)

