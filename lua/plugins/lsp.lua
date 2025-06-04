return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "eslint", "ts_ls", "svelte", "lua_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
      })
      lspconfig.eslint.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.svelte.setup({})
      lspconfig.lua_ls.setup({})
    end,
  },
}
