local mn_completion = require('mini.completion')
local mn_pairs = require('mini.pairs')

local keycode = vim.keycode or function(x)
    return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
    ['cr'] = keycode('<CR>'),
    ['ctrl-y'] = keycode('<C-y>'),
    ['ctrl-y_cr'] = keycode('<C-y><CR>'),
}
_G.cr_action = function()
    if vim.fn.pumvisible() ~= 0 then
        local item_selected = vim.fn.complete_info()['selected'] ~= -1
        return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
    else
        return mn_pairs.cr()
    end
end

mn_completion.setup({
    delay = {completion = 100, info = 100, signature = 50},
    window = {
        info = {height = 25, width = 80, border = 'single'},
        signature = {height = 25, width = 80, border = 'single'},
    },
    lsp_completion = {
        source_func = 'completefunc',
        auto_setup = true,
        process_items = mn_completion.default_process_items,
    },
    mappings = {force_twostep = '<C-Space>',},
    set_vim_settings = true,
})
mn_pairs.setup()

vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', {expr = true, noremap = true})
vim.keymap.set(
    'i',
    '<Tab>',
    function()return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"end,
    {expr = true, silent = true}
)
vim.keymap.set(
    'i',
    '<S-Tab>',
    function()return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"end,
    {expr = true, silent = true}
)
