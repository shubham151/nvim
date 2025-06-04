return function(key)
  if not vim.g.neovide then
    return "<M-" .. key .. ">"
  end
  return "<D-" .. key .. ">"
end
