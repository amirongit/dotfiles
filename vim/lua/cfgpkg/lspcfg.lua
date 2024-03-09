require('pckr').add(
    {
        'neovim/nvim-lspconfig',
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'Decodetalkers/csharpls-extended-lsp.nvim'
    }
)

local servers = {
    'csharp_ls', 'diagnosticls', 'docker_compose_language_service', 'dockerls', 'fsautocomplete',
    'jsonls', 'lua_ls', 'pyright', 'sqlls', 'taplo', 'lemminx', 'yamlls'
}
local lspconfig = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason').setup()
require('mason-lspconfig').setup({ ensure_installed = servers })
for _, lsp in ipairs(servers) do
    if lsp == 'csharp_ls' then
        lspconfig[lsp].setup(
            {
                capabilities = cmp_capabilities,
                handlers = {
                    ['textDocument/definition'] = require('csharpls_extended').handler,
                    ['textDocument/typeDefinition'] = require('csharpls_extended').handler,
                }
            }
        )
    else
        lspconfig[lsp].setup({ capabilities = cmp_capabilities })
    end
end
local cmp = require('cmp')
cmp.setup(
    {
        mapping = cmp.mapping.preset.insert(
            {
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                ['<Tab>'] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end,
                    { 'i', 's' }
                ),
                ['<S-Tab>'] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end,
                    { 'i', 's' }
                ),
            }
        ),
        sources = { { name = 'nvim_lsp' }, { name = 'buffer' }, { name = 'path' }, { name = 'cmdline' } }
    }
)

-- autocommands
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  group = vim.api.nvim_create_augroup('float_diagnostic_cursor', { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false, scope='cursor'})
  end
})

-- keymaps
vim.keymap.set('n', 'K', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'J', vim.diagnostic.goto_next)
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
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
    }
)

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = {
        {' ', 'FloatBorder'},
        {'-', 'FloatBorder'},
        {' ', 'FloatBorder'},
        {'|', 'FloatBorder'},
        {' ', 'FloatBorder'},
        {'-', 'FloatBorder'},
        {' ', 'FloatBorder'},
        {'|', 'FloatBorder'},
    }
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
