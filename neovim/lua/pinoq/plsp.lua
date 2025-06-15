local lspcfg = require('lspconfig')
local csls_ex = require('csharpls_extended')
local mason = require('mason')
local mason_lspcfg = require('mason-lspconfig')
local schemastore = require('schemastore')

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.max_height = 25
    opts.max_width = 75
    -- opts.anchor_bias = 'top'
    opts.border = 'single'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

mason.setup()
mason_lspcfg.setup({
    automatic_enable = false,
    ensure_installed = {
        'lua_ls',
        'csharp_ls',
        'bashls',
        'dockerls',
        'yamlls',
        'ruff',
        'pyright',
        'taplo',
        'jsonls'
    }
})
lspcfg['lua_ls'].setup({})
lspcfg['csharp_ls'].setup({})
lspcfg['bashls'].setup({})
lspcfg['dockerls'].setup({})
lspcfg['yamlls'].setup({
    settings = {
        yaml = {
            schemaStore = {
                enable = false,
                url = "",
            },
            schemas = schemastore.yaml.schemas(),
        },
    },
})
lspcfg['ruff'].setup({})
lspcfg['pyright'].setup({
    settings = {
        pyright = {
            disableOrganizeImports = true,
            disableTaggedHints = true
        },
        python = {
            analysis = {
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        }
    }
})
lspcfg['taplo'].setup({})
lspcfg['jsonls'].setup({
    settings = {
        json = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
        },
    },
})

csls_ex.buf_read_cmd_bind()

vim.keymap.set('n', '<leader>ren', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>doc', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>for', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>sig', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>act', vim.lsp.buf.code_action)
vim.keymap.set('n', 'K', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'J', vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>res", ":LspRestart<CR>", {silent = true})

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
})
