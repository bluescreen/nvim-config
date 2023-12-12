
-- require("mason").setup()
-- require("mason-lspconfig").setup()


local lsp = require('lsp-zero')

lsp.on_attach = function(client, bufnr)
  print("lspattach", bufnr)
  vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  local opts = { noremap=true, silent=true, buffer = bufnr  }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})


-- require'lspconfig'.tsserver.setup{}
-- local nvim_lsp = require('lspconfig')




-- end

-- local servers = { "vuels","pyright", "rust_analyzer", "tsserver","gopls","intelephense" }

-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end

-- nvim_lsp.tsserver.setup {
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("package.json"),
-- }
