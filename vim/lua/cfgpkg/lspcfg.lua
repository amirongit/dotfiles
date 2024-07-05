local servers = {
    'docker_compose_language_service', 'dockerls', 'fsautocomplete',
    'jsonls', 'pyright', 'sqlls', 'taplo', 'lemminx', 'yamlls',
    'docker_compose_language_service', 'dockerls', 'lua_ls',
    'bashls'
}

require('mini.cursorword').setup()
require('mini.completion').setup()
require('mason').setup()
require('mason-lspconfig').setup({ ensure_installed = servers })

local lspconfig = require('lspconfig')
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({})
end

-- highlight groups
vim.api.nvim_set_hl(0, 'MiniCursorword', { bold = true })
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', {})

-- keymaps
vim.keymap.set('n', 'K', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'J', vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>res", ":LspRestart<CR>", { silent = true })
vim.keymap.set('n', '<leader>ren', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>doc', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>sig', vim.lsp.buf.signature_help)

-- settings
for _, diag in ipairs({ 'Error', 'Warn', 'Info', 'Hint' }) do
    vim.fn.sign_define('DiagnosticSign' .. diag, {
        text = '',
        texthl = 'DiagnosticSign' .. diag,
        linehl = '',
        numhl = 'DiagnosticSign' .. diag,
    })
end

vim.diagnostic.config(
    {
        virtual_text = true,
        signs = true,
        underline = false,
        update_in_insert = false,
        severity_sort = false,
    }
)

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}

    opts.winblend = 10
    opts.border = {
        {'┎', 'FloatBorder'},
        {' ', 'FloatBorder'},
        {'┒', 'FloatBorder'},
        {' ', 'FloatBorder'},
        {'┚', 'FloatBorder'},
        {' ', 'FloatBorder'},
        {'┖', 'FloatBorder'},
        {' ', 'FloatBorder'},
    }
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
