vim.opt.relativenumber = true
vim.opt.tabstop = 4       -- Number of visual spaces per TAB
vim.opt.shiftwidth = 4    -- Number of spaces for each indentation
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.updatetime = 100  -- Speed up modified lines refresh
vim.opt.termguicolors = true
vim.opt.mouse = 'a'

-- clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 15

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

