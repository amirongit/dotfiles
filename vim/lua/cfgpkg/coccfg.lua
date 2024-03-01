require('pckr').add(
    {
        { 'neoclide/coc.nvim', branch = 'release' },
    }
)

-- highlights
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- functions
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- keymaps
vim.keymap.set("n", "<leader>doc", "<CMD>lua _G.show_docs()<CR>", { silent = true })
vim.keymap.set("n", "<leader>dia", ":<C-u>CocList diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>sym", ":<C-u>CocList symbols<CR>", { silent = true })
vim.keymap.set("n", "<leader>def", "<Plug>(coc-definition)", { silent = true })
vim.keymap.set("n", "<leader>imp", "<Plug>(coc-implementation)", { silent = true })
vim.keymap.set("n", "<leader>ref", "<Plug>(coc-references)", { silent = true })
vim.keymap.set("n", "<leader>act", "<Plug>(coc-codeaction-selected)", { silent = true })
vim.keymap.set("n", "<leader>ren", "<Plug>(coc-rename)", { silent = true })
vim.keymap.set("n", "<leader>for", "<Plug>(coc-format-selected)", { silent = true })
vim.keymap.set("n", "<leader>clk", "<Plug>(coc-codelens-action)", { silent = true })
vim.keymap.set("n", "J", "<Plug>(coc-diagnostic-next)", { silent = true })
vim.keymap.set("n", "K", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("i", "<TAB>", [[coc#pum#visible() ? coc#pum#next(1) : "<TAB>"]], { silent = true, expr = true })
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<TAB>"]], { silent = true, expr = true })
vim.keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

-- settings
vim.g.coc_status_error_sign = 'e'
vim.g.coc_status_warning_sign = 'w'
vim.g.coc_global_extensions = { 'coc-pyright', 'coc-toml', 'coc-xml', 'coc-json', 'coc-marketplace', 'coc-yaml',
    'coc-lua', 'coc-docker', 'coc-sql' }
