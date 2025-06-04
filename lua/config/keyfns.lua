local M = {}

local textObjectSelect = require("nvim-treesitter.textobjects.select")
local textObjectMove = require("nvim-treesitter.textobjects.move")

local function tree_focused()
  local curr_buf = vim.api.nvim_get_current_buf()
  local curr_ft = vim.api.nvim_buf_get_option(curr_buf, "filetype")
  return curr_ft == "NvimTree"
end

M.toggle_tree_buffer = function()
  if tree_focused() then
    vim.cmd("wincmd p")
  else
    vim.cmd("NvimTreeFocus")
  end
end

M.close_buffer = function()
  local buffer_count = #vim.fn.getbufinfo({ buflisted = 1 })
  if buffer_count <= 1 then
    vim.cmd("NvimTreeClose")
    vim.cmd("quit")
  else
    vim.cmd("bp|bd #")
  end
end

-- Stop scrolling once the last line of the file is a few lines above the bottom of the window
M.scroll_down = function(isMouse)
  local default_scroll_amount = isMouse and 3 or 15
  local window_height = vim.fn.winheight(0)
  local first_visible_line = vim.fn.line("w0")
  local last_line = vim.fn.line("$")
  local min_visible_lines = window_height - 5
  local max_scroll_line = last_line - min_visible_lines
  if first_visible_line < max_scroll_line then
    local scroll_amount = math.min(default_scroll_amount, max_scroll_line - first_visible_line)
    vim.cmd.normal({ scroll_amount .. "\x05", bang = true }) -- \x05 is <C-e>
  end
  if not isMouse then
    vim.cmd.normal("M")
  end
end

M.mouse_scroll_down = function()
  M.scroll_down(true)
end

M.toggle_macro = function()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    vim.cmd("normal! qa", "n", false)
  else
    vim.cmd("normal! q", "n", false)
  end
end

M.insert_line_above = function()
  local current_line = vim.fn.line(".")
  vim.api.nvim_buf_set_lines(0, current_line - 1, current_line - 1, false, { "" })
end

M.insert_line_below = function()
  local current_line = vim.fn.line(".")
  vim.api.nvim_buf_set_lines(0, current_line, current_line, false, { "" })
end

M.select_paragraph = function()
  vim.cmd("normal! jvap", { silent = true })
end

M.select_function = function()
  textObjectSelect.select_textobject("@function.outer", "textobjects", "V")
  vim.cmd("normal! j", { silent = true })
end

M.goto_function_end = function()
  textObjectMove.goto_next_end("@function.outer", "textobjects")
  vim.cmd("normal! j", { silent = true })
end

return M
