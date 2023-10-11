local lspconfig = require("lspconfig")

-- 1. python language server
local pyright=require("lsp.config.pyright")
lspconfig.pyright.setup(pyright.default_config)

-- 2. markdown language server
local marksman=require("lsp.config.marksman")
lspconfig.marksman.setup(marksman.default_config)

--3. lua language server
local lua_ls = require("lsp.config.lua")
lspconfig.lua_ls.setup({lua_ls.default_config})




-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  end,
})
