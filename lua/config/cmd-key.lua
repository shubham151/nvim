return function(key)
  -- Use Command key on macOS with Neovide, Ctrl on Linux/Windows
  local is_mac = vim.fn.has("macunix") == 1
  if vim.g.neovide and is_mac then
    return "<D-" .. key .. ">"
  end
  return "<C-" .. key .. ">"
end
