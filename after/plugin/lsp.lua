local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'pyright',
  'rust_analyzer',
  'hls',
  'elixirls',
-- 'ty'
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('elixirls', {
  cmd = { "/opt/homebrew/bin/elixir-ls" },
})

-- not entirely sure this works
lsp.configure('hls', {
  on_attach = function(client, bufnr)
    -- Disable signature help if you don't like inline signatures
    client.server_capabilities.signatureHelpProvider = false

    -- Optional: keymaps for LSP functionality
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  end,
  settings = {
    haskell = {
      formattingProvider = "ormolu", -- or "fourmolu", "brittany", "stylish-haskell"
      checkProject = true,
    },
  },
})
--
-- lsp.configure('hls', {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--   end,
-- })
--
--
-- -- can probably remove
-- vim.api.nvim_create_autocmd("CursorHoldI", {
--   pattern = "*",
--   callback = function()
--     vim.lsp.buf.signature_help()
--   end,
-- })
--

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>gd", function()
    vim.cmd("belowright split")                     -- opens a horizontal split
    vim.lsp.buf.definition()             -- jumps to the definition in that split
end, { desc = "LSP definition in split" })
end)


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
