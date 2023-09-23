local M = {}

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.sourcekit.setup {
    capabilities = capabilities,
}

lspconfig.terraformls.setup {
    capabilities = capabilities,
}

lspconfig.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
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

lspconfig.bashls.setup {
    capabilities = capabilities,
}

-- lspconfig.html.setup {
--     capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--     capabilities = capabilities,
-- }
--
-- lspconfig.yamlls.setup {
--     capabilities = capabilities,
-- }

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.hoverProvider then
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.bug })
        end

    end
})

