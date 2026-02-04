local cmd = require("config.cmd-key")

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "folke/which-key.nvim", event = "VeryLazy" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { cmd("l"), mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
      {
        "<leader>gc",
        function()
          local opt = vim.opt.diffopt:get()
          local has_full = vim.tbl_contains(opt, "context:99999")
          if has_full then
            vim.opt.diffopt:remove("context:99999")
            print("Diff: showing changes only")
          else
            vim.opt.diffopt:append("context:99999")
            print("Diff: showing full file")
          end
        end,
        desc = "Toggle diff context",
      },
    },
    opts = {
      view = {
        default = { winbar_info = true },
        file_history = { winbar_info = true },
      },
    },
  },
}
