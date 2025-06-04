local colors = require("config.colors")

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
    config = function()
      local recordingMode = require("noice").api.statusline.mode
      require("lualine").setup({
        sections = {
          lualine_x = {
            {
              recordingMode.get,
              cond = recordingMode.has,
              color = { fg = colors.orange },
            },
            "filetype",
          },
        },
        options = {
          globalstatus = true,
          theme = {
            normal = {
              a = { bg = colors.blue, fg = colors.dark },
              b = { bg = colors.dark3, fg = colors.white },
              c = { bg = colors.dark, fg = colors.white },
            },
            insert = {
              a = { bg = colors.green, fg = colors.dark },
            },
            visual = {
              a = { bg = colors.magenta, fg = colors.white },
            },
          },
        },
      })
    end,
  },
  { "rcarriga/nvim-notify" },
  { "folke/noice.nvim", opts = { cmdline = { enabled = true } } },
}
