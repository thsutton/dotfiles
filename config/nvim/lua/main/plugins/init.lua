local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    require("main.plugins.cmp"),
    require("main.plugins.devicons"),
    require("main.plugins.gitsigns"),
    require("main.plugins.lsp-zero"),
    require("main.plugins.lualine"),
    require("main.plugins.oil"),
    require("main.plugins.smartcolumn"),
    require("main.plugins.telescope"),
    require("main.plugins.todo-comments"),
    require("main.plugins.tokyonight"),
    require("main.plugins.treesitter"),
    require("main.plugins.trouble"),
    require("main.plugins.ufo"),
}
