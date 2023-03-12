-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup({
--  open_on_setup = true,
---  ignore_buffer_on_setup = true,
-- })
-- require("nvim-tree").tree.toggle({ focus = false, find_file = true, })

-- OR setup with some options
--require("nvim-tree").setup({
--  sort_by = "case_sensitive",
--  view = {
--    width = 30,
--    mappings = {
--      list = {
--        { key = "u", action = "dir_up" },
--      },
--    },
--  },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--    dotfiles = true,
--  },
--})

require("nvim-tree").setup()
