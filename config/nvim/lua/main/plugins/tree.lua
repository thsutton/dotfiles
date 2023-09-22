require('nvim-tree').setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
--  auto_close          = false,
  open_on_tab         = false,
--  update_to_buf_dir   = {
--    enable = true,
--    auto_open = true,
--  },
  hijack_cursor = false,
  update_cwd          = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
}
