-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Cmd+.: trigger autocomplete suggestions
map("i", "<D-.>", function()
  require("blink.cmp").show()
end, { desc = "Trigger completion" })
map("i", "<D-j>", function()
  require("blink.cmp").show()
end, { desc = "Trigger completion" })
map("n", "<D-.>", function()
  vim.cmd("startinsert")
  vim.schedule(function()
    require("blink.cmp").show()
  end)
end, { desc = "Trigger completion" })
map("n", "<D-j>", function()
  vim.cmd("startinsert")
  vim.schedule(function()
    require("blink.cmp").show()
  end)
end, { desc = "Trigger completion" })

-- Ghostty fallback for Cmd+. (mapped to F22 in ~/.config/ghostty/config)
map({ "n", "i" }, "<F22>", function()
  if vim.api.nvim_get_mode().mode ~= "i" then
    vim.cmd("startinsert")
  end
  vim.schedule(function()
    require("blink.cmp").show()
  end)
end, { desc = "Trigger completion (Ghostty Cmd+.)" })

-- Fallback manual completion (useful if Cmd+. is intercepted)
map("i", "<C-Space>", function()
  require("blink.cmp").show()
end, { desc = "Trigger completion" })
map("i", "<A-.>", function()
  require("blink.cmp").show()
end, { desc = "Trigger completion" })
map("n", "<A-.>", function()
  vim.cmd("startinsert")
  vim.schedule(function()
    require("blink.cmp").show()
  end)
end, { desc = "Trigger completion" })

-- Cmd+': code actions
map({ "n", "i", "v" }, "<D-'>", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Cmd+S: save current file
map({ "n", "i", "v" }, "<D-s>", function()
  if vim.api.nvim_get_mode().mode ~= "n" then
    vim.cmd("stopinsert")
  end
  vim.cmd("write")
end, { desc = "Save file" })

map({ "n", "v" }, "<D-Left>", "0", { desc = "Line start" })
map({ "n", "v" }, "<D-Right>", "$", { desc = "Line end" })
map("i", "<D-Left>", "<C-o>0", { desc = "Line start" })
map("i", "<D-Right>", "<End>", { desc = "Line end" })

map({ "n", "v" }, "<A-Left>", "b", { desc = "Previous word" })
map({ "n", "v" }, "<A-Right>", "w", { desc = "Next word" })
map("i", "<A-Left>", "<C-o>b", { desc = "Previous word" })
map("i", "<A-Right>", "<C-o>w", { desc = "Next word" })
map({ "n", "v" }, "<Esc>[1;3D", "b", { desc = "Previous word" })
map({ "n", "v" }, "<Esc>[1;3C", "w", { desc = "Next word" })
map("i", "<Esc>[1;3D", "<C-o>b", { desc = "Previous word" })
map("i", "<Esc>[1;3C", "<C-o>w", { desc = "Next word" })

map("i", "<D-BS>", "<C-u>", { desc = "Delete to line start" })
map("c", "<D-BS>", "<C-u>", { desc = "Delete to line start" })
map("n", "<D-BS>", "d0", { desc = "Delete to line start" })

map("i", "<A-BS>", "<C-w>", { desc = "Delete previous word" })
map("c", "<A-BS>", "<C-w>", { desc = "Delete previous word" })
map("n", "<A-BS>", "db", { desc = "Delete previous word" })

map("n", "G", "Gzz", { desc = "Goto line centered" })
map("n", "gg", "ggzz", { desc = "Goto first line centered" })
map("n", "g+", ":+", { desc = "Goto relative line forward" })
map("n", "g-", ":-", { desc = "Goto relative line backward" })
map("n", "<S-Down>", "<C-d>zz", { desc = "Half page down centered" })
map("n", "<S-Up>", "<C-u>zz", { desc = "Half page up centered" })
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })
map("n", "rr", vim.lsp.buf.rename, { desc = "Rename" })
