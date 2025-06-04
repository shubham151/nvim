local colors = require("config.colors")

vim.g.terminal_color_0 = colors.dark
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue2
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.blue
vim.g.terminal_color_7 = colors.white2
vim.g.terminal_color_8 = colors.dark
vim.g.terminal_color_9 = colors.red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.blue2
vim.g.terminal_color_13 = colors.magenta
vim.g.terminal_color_14 = colors.blue
vim.g.terminal_color_15 = colors.white2

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = "<D-t>",
      size = 30,
      highlights = { Normal = { link = "ToggleTerm" } },
      -- Fix issue where terminal is not in insert mode after toggle
      on_open = function()
        vim.defer_fn(function()
          vim.cmd("startinsert")
        end, 1)
      end,
    },
  },
}
