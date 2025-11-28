local lspcfg = require('lspconfig')
local csls_ex = require('csharpls_extended')
local mason = require('mason')
local mason_lspcfg = require('mason-lspconfig')
local schemastore = require('schemastore')
local lensline = require('lensline')

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.max_height = 25
    opts.max_width = 75
    -- opts.anchor_bias = 'top'
    opts.border = 'single'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local function global_on_attach(client, bufnr)
end

lensline.setup({
    providers = {
        {
            name = "references",
            enabled = true,
            quiet_lsp = true,
        },
        {
            name = "last_author",
            enabled = true,
            cache_max_files = 100,
        },
        {
            name = "diagnostics",
            enabled = false,
        },
        {
            name = "complexity",
            enabled = false, -- disabled by default - enable explicitly to use
        },
    },
    style = {
        separator = " • ",
        highlight = "Comment",
        prefix = " ",
        placement = "inline",
        use_nerdfont = true,
    },
    render = "all",
    limits = {
        exclude = {},
        exclude_gitignored = true,
        max_lines = 2000,
        max_lenses = 120,
    },
    debounce_ms = 500,
    focused_debounce_ms = 150,
    debug_mode = false,
})

local lsps = {
    'lua_ls',
    'csharp_ls',
    'bashls',
    'dockerls',
    'yamlls',
    'ruff',
    'pyright',
    'taplo',
    'jsonls',
}

mason.setup()
mason_lspcfg.setup({ automatic_enable = false, ensure_installed = lsps })
vim.lsp.config('lua_ls', {})
vim.lsp.config('csharp_ls', {})
vim.lsp.config('bashls', {})
vim.lsp.config('dockerls', {})
vim.lsp.config(
    'yamlls',
    {
        settings = {
            yaml = {
                schemaStore = { enable = false, url = "", },
                schemas = schemastore.yaml.schemas(),
            },
        },
    }
)
vim.lsp.config('ruff', {})
vim.lsp.config(
    'pyright',
    {
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
    }
)
vim.lsp.config('taplo', {})
vim.lsp.config(
    'jsonls',
    {
        settings = {
            json = {
                schemas = schemastore.json.schemas(),
                validate = { enable = true },
            },
        },
    }
)

csls_ex.buf_read_cmd_bind()
vim.lsp.enable(lsps)

vim.keymap.set('n', '<leader>ren', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>doc', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>for', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>sig', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>act', vim.lsp.buf.code_action)
vim.keymap.set('n', 'K', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'J', vim.diagnostic.goto_next)
vim.keymap.set("n", '<leader>res', ':LspRestart<CR>', { silent = true })

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
})
