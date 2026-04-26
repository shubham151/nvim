local colors = require("config.colors")
local cmd = require("config.cmd-key")

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

local claude_term = nil

local function toggle_claude()
  local Terminal = require("toggleterm.terminal").Terminal
  if not claude_term then
    claude_term = Terminal:new({
      cmd = "claude",
      direction = "vertical",
      size = function()
        return math.floor(vim.o.columns * 0.4)
      end,
      highlights = { Normal = { link = "ToggleTerm" } },
      on_open = function()
        vim.defer_fn(function()
          vim.cmd("startinsert")
        end, 1)
      end,
    })
  end
  claude_term:toggle()
end

local terminal_instance = nil

local function toggle_terminal()
  local dir = vim.fn.expand("%:p:h")
  if vim.bo.filetype == "NvimTree" or dir == "" or dir:match("^term://") then
    dir = vim.fn.getcwd()
  end

  local Terminal = require("toggleterm.terminal").Terminal

  if not terminal_instance then
    terminal_instance = Terminal:new({
      direction = "vertical",
      on_open = function(term)
        vim.cmd("startinsert!")
      end,
    })
  end

  local size = math.floor(vim.o.columns * 0.4)

  if not terminal_instance:is_open() then
    terminal_instance:toggle(size)
    -- Send a cd command to the shell to ensure the working directory actually changes
    terminal_instance:send("cd " .. vim.fn.fnameescape(dir))
  else
    terminal_instance:toggle()
  end
end

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { cmd("o"), toggle_claude, desc = "Toggle Claude Code", mode = { "n", "i", "v" } },
      { cmd("t"), toggle_terminal, desc = "Toggle Terminal (Current Dir)", mode = { "n", "i", "v", "t" } },
    },
    opts = {
      size = 15,
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
