vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.linespace = -4

vim.o.ignorecase = true
vim.o.confirm = true
vim.o.swapfile = false
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

vim.opt.showmode = false
vim.opt.fillchars = { eob = " " }
vim.opt.fillchars:append({ vert = " " })

vim.diagnostic.config({ signs = false }) -- Disable the diagnostic indicator

vim.g.neovide_cursor_animation_length = 0
