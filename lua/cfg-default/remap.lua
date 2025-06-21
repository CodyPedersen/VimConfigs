vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set('n', '<leader>rt', function()
  vim.cmd('belowright split | terminal')
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- swap windows
--vim.keymap.set('n', '<M-j>', '<C-w>j', { noremap = true, silent = true })
--vim.keymap.set('n', '<M-k>', '<C-w>k', { noremap = true, silent = true })
--vim.keymap.set('n', '<M-h>', '<C-w>h', { noremap = true, silent = true })
--vim.keymap.set('n', '<M-l>', '<C-w>l', { noremap = true, silent = true })

