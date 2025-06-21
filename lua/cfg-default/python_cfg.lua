vim.keymap.set('n', '<leader>rp', function()
  local filename = vim.fn.expand('%')
  vim.cmd('belowright split | terminal python3 ' .. filename)
end, { noremap = true, silent = true })

vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true, desc = 'Yank selection to clipboard' })
