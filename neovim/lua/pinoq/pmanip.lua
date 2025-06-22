local mn_splitjoin = require('mini.splitjoin')
local mn_move = require('mini.move')
local mn_trailspace = require('mini.trailspace')

mn_splitjoin.setup({
    mappings = { toggle = '<leader>tas', split = '', join = '', },
    detect = { brackets = nil, separator = ',', exclude_regions = nil, },
    split = { hooks_pre = {}, hooks_post = {}, },
    join = { hooks_pre = {}, hooks_post = {}, },
})
mn_move.setup()
mn_trailspace.setup()

vim.keymap.set("n", "<leader>trm", function() vim.cmd('lua MiniTrailspace.trim()') end, { silent = true })
vim.keymap.set("n", "<leader>cln", function() vim.cmd('lua MiniTrailspace.trim_last_lines()') end, { silent = true })
