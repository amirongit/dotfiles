local mn_splitjoin = require('mini.splitjoin')
local mn_move = require('mini.move')
local mn_trailspace = require('mini.trailspace')
local mn_comment = require('mini.comment')
local mn_surround = require('mini.surround')
local mn_ai = require('mini.ai')

mn_splitjoin.setup({
    mappings = { toggle = '<leader>tas', split = '', join = '', },
    detect = { brackets = nil, separator = ',', exclude_regions = nil, },
    split = { hooks_pre = {}, hooks_post = {}, },
    join = { hooks_pre = {}, hooks_post = {}, },
})
mn_move.setup({
    mappings = {
        left = '<M-h>',
        right = '<M-l>',
        down = '<M-j>',
        up = '<M-k>',
        line_left = '<M-h>',
        line_right = '<M-l>',
        line_down = '<M-j>',
        line_up = '<M-k>',
    },
    options = { reindent_linewise = true, },
})
mn_trailspace.setup({ only_in_normal_buffers = true, })
mn_surround.setup({
    custom_surroundings = nil,
    highlight_duration = 1000,
    mappings = {
        add = 'sa',
        delete = 'sd',
        find = 'sf',
        find_left = 'sF',
        highlight = 'sh',
        replace = 'sr',
        update_n_lines = 'sn',
        suffix_last = 'l',
        suffix_next = 'n',
    },
    n_lines = 50,
    respect_selection_type = false,
    search_method = 'cover',
    silent = false,
})
mn_ai.setup({
    custom_textobjects = nil,
    mappings = {
        around = 'a',
        inside = 'i',
        around_next = 'an',
        inside_next = 'in',
        around_last = 'al',
        inside_last = 'il',
        goto_left = 'g[',
        goto_right = 'g]',
    },
    n_lines = 50,
    search_method = 'cover_or_next',
    silent = false,
})
mn_comment.setup({
    options = {
        custom_commentstring = nil,
        ignore_blank_line = true,
        start_of_line = false,
        pad_comment_parts = true,
    },
    mappings = {
        comment = '',
        comment_line = 'gcc',
        comment_visual = 'gc',
        textobject = 'gc',
    },
    hooks = { pre = function() end, post = function() end, },
})

vim.keymap.set("n", "<leader>trm", function() vim.cmd('lua MiniTrailspace.trim()') end, { silent = true })
vim.keymap.set("n", "<leader>cln", function() vim.cmd('lua MiniTrailspace.trim_last_lines()') end, { silent = true })
