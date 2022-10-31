--                          CMP SETUP
vim.opt.completeopt = {"menu", "menuone", "noselect"}
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    -- completion = {
    --     autocomplete = false
    -- },
    mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<c-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),

    ["<c-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },

      -- ['<C-<Leader>'] = cmp.mapping.complete(),
      -- ['<C-a>'] = cmp.mapping.abort(),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    --  { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer', keyword_length = 5 },
      { name = 'path' },
    }),


  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,

    -- Let's play with this for a day or two
    ghost_text = false,
  },
  })

  -- Set configuration for specific filetype.
  -- cmp.setup.filetype('gitcommit', {
  --   sources = cmp.config.sources({
  --     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  --   }, {
  --     { name = 'buffer' },
  --   })
  -- })


  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['jdtls'].setup {
    capabilities = capabilities
  }

--                          LSP SETUP
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<Leader>gj", vim.diagnostic.goto_next, opts) 
vim.keymap.set("n", "<Leader>gk", vim.diagnostic.goto_prev, opts) 
vim.keymap.set("n", "<Leader>gl", "<cmd>Telescope diagnostics<cr>", opts) 

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=0 }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) 
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) 
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts) 
    vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts) 
    vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action, bufopts) 
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['jdtls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- local nvim_lsp = require('lspconfig')
-- local servers = { 'clangd', 'jdtls' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = function()
--        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) 
--        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) 
--        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) 
--        vim.keymap.set("n", "<Leader>gj", vim.diagnostic.goto_next, {buffer=0}) 
--        vim.keymap.set("n", "<Leader>gk", vim.diagnostic.goto_prev, {buffer=0}) 
--        vim.keymap.set("n", "<Leader>gl", "<cmd>Telescope diagnostics<cr>", {buffer=0}) 
--        vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, {buffer=0}) 
--        vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action, {buffer=0}) 
--     end,
--   }
-- end

-- require('lspconfig').clangd.setup{
--     on_attach = function()
--        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) 
--        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) 
--        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) 
--        vim.keymap.set("n", "<Leader>gj", vim.diagnostic.goto_next, {buffer=0}) 
--        vim.keymap.set("n", "<Leader>gk", vim.diagnostic.goto_prev, {buffer=0}) 
--        vim.keymap.set("n", "<Leader>gl", "<cmd>Telescope diagnostics<cr>", {buffer=0}) 
--        vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, {buffer=0}) 
--        vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action, {buffer=0}) 
--     end,
-- }
