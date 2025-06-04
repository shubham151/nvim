local keyfns = require("config.keyfns")
local cmd = require("config.cmd-key")

vim.keymap.set({ "n", "v" }, cmd("k"), "15<C-y>M", { desc = "Scroll up" })
vim.keymap.set({ "n", "v" }, cmd("j"), keyfns.scroll_down, { desc = "Scroll down" })
vim.keymap.set({ "n", "v" }, "<ScrollWheelDown>", keyfns.mouse_scroll_down, { desc = "Mouse scroll down" })

vim.keymap.set("n", "q", "V", { desc = "Switch to visual line mode" })
vim.keymap.set("v", "q", "<esc>", { desc = "Exit visual line mode" })
vim.keymap.set({ "n", "v" }, "2", keyfns.toggle_macro, { desc = "Toggle macro recording" })
vim.keymap.set({ "n", "v" }, "3", "@a", { desc = "Replay macro" })

vim.keymap.set({ "n", "v" }, ",", "{", { desc = "Move to previous paragraph" })
vim.keymap.set({ "n", "v" }, "m", "}", { desc = "Move to next paragraph" })

vim.keymap.set("n", cmd("p"), keyfns.select_paragraph, { desc = "Select paragraph", silent = true })
vim.keymap.set("v", cmd("p"), "ap", { desc = "Select next paragraph" })
vim.keymap.set("n", cmd("e"), keyfns.select_function, { desc = "Select function" })
vim.keymap.set("v", cmd("e"), keyfns.goto_function_end, { desc = "Select next function" })

vim.keymap.set({ "n", "v" }, "9", "0", { desc = "Move to start of the line" })
vim.keymap.set({ "n", "v" }, "0", "$", { desc = "Move to end of the line" })

vim.keymap.set({ "n" }, "<cr>", "ciw", { desc = "Change word" })

vim.keymap.set({ "n", "i", "v" }, cmd("i"), keyfns.insert_line_above, { silent = true, desc = "Insert line above" })
vim.keymap.set({ "n", "i", "v" }, cmd("u"), keyfns.insert_line_below, { silent = true, desc = "Insert line below" })

vim.keymap.set("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

vim.keymap.set("n", cmd("/"), "gcc", { desc = "Comment line", remap = true })
vim.keymap.set("i", cmd("/"), "<esc>gcc", { desc = "Comment line", remap = true })

vim.keymap.set("v", cmd("/"), "gc", { desc = "Comment block", remap = true })
vim.keymap.set("v", cmd("]"), ">gv", { desc = "Indent right" })
vim.keymap.set("v", cmd("["), "<gv", { desc = "Indent left" })
vim.keymap.set("n", cmd("]"), "V>gv<esc>", { desc = "Indent right", silent = true })
vim.keymap.set("n", cmd("["), "V<gv<esc>", { desc = "Indent left", silent = true })

vim.keymap.set({ "v" }, cmd("c"), "y", { desc = "Copy" })
vim.keymap.set({ "n", "v" }, cmd("v"), "p", { desc = "Paste" })
vim.keymap.set({ "i" }, cmd("v"), "<esc>pa", { desc = "Paste" })
vim.keymap.set({ "n", "i", "v" }, cmd("z"), "<C-r>", { desc = "Redo" })

vim.keymap.set({ "n", "i", "v" }, cmd("a"), "gg0VG", { desc = "Select all" })
vim.keymap.set({ "n", "i", "v" }, cmd("s"), "<cmd>w<CR>", { desc = "Save", silent = true })
vim.keymap.set({ "n", "i", "v" }, cmd("d"), keyfns.close_buffer, { desc = "Close buffer" })
vim.keymap.set({ "n" }, cmd("r"), keyfns.toggle_tree_buffer, { desc = "Toggle between tree and buffers" })
vim.keymap.set({ "i", "v" }, cmd("r"), "<esc>" .. cmd("r"), { desc = "Toggle between tree and buffers", remap = true })

local builtin = require("telescope.builtin")
vim.keymap.set({ "n", "i", "v" }, cmd("f"), builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set({ "n", "i", "v" }, cmd("g"), builtin.live_grep, { desc = "Telescope live grep" })

vim.keymap.set({ "n", "v" }, "<leader>d", vim.lsp.buf.definition, { desc = "LSP go to definition" })
vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, { desc = "LSP rename" })
vim.keymap.set({ "n", "v" }, "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic dialog" })
vim.keymap.set({ "n", "v" }, "<leader>i", "<cmd>Inspect<CR>", { desc = "Inspect element with treesitter" })
vim.keymap.set({ "n", "v" }, "<leader>o", "<cmd>InspectTree<CR>", { desc = "Inspect tree with treesitter" })
vim.keymap.set({ "n", "v" }, "<leader>h", "<cmd>Telescope highlights<CR>", { desc = "Show all highlights" })
vim.keymap.set({ "n", "v" }, "<leader>w", "<cmd>NvimWebDeviconsHiTest<CR>", { desc = "Show all web dev icons" })
