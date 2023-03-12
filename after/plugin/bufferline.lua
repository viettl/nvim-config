local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    numbers = function(opts)
      return string.format('%s', opts.ordinal)
    end,
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = '#073642'
    }
  }
})
vim.opt.termguicolors = true
require("bufferline").setup {}
vim.keymap.set('n', '<C-Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<C-S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
