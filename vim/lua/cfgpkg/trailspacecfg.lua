require('mini.trailspace').setup()

-- keymaps
vim.keymap.set("n", "<leader>trm", function() vim.cmd('lua MiniTrailspace.trim()') end, { silent = true })
vim.keymap.set("n", "<leader>cln", function() vim.cmd('lua MiniTrailspace.trim_last_lines()') end, { silent = true })
