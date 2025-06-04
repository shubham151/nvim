local ensure_installed = {
  "prettier",
  "stylua",
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      local masonRegistry = require("mason-registry")
      masonRegistry.refresh(function()
        for _, packageName in ipairs(ensure_installed) do
          local package = masonRegistry.get_package(packageName)
          if not package:is_installed() then
            package:install()
          end
        end
      end)
    end,
  },
  {
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "VeryLazy" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier", stop_after_first = true },
        typescript = { "prettier", stop_after_first = true },
        svelte = { "prettier", stop_after_first = true },
      },
      format_on_save = { timeout_ms = 500 },
    },
  },
}
