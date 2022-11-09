vim.g.mapleader = ','
vim.g.maplocalleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.o.spell = true
vim.o.spelllang = 'en_au'

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

-- Bad colour
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false

require('thsutton.plugins')

require('thsutton.lsp')

require('thsutton.treesitter')

require('neoclip').setup {}

require('luasnip').setup {}

require('nvim-tree').setup {}

require('trouble').setup {
    position = 'bottom',
    height = 10
}

local telescope = require('telescope')
telescope.load_extension('neoclip')

local cmp = require('cmp')
if cmp ~= nil then
    cmp.setup {
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert {
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        })
    }
end

vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>xt', function () require('nvim-tree').toggle(false, true) end, {})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fy', telescope.extensions.neoclip.neoclip, {})

