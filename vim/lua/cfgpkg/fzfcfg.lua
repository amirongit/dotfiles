require('pckr').add({ { 'ibhagwan/fzf-lua', requires = { 'nvim-tree/nvim-web-devicons' } } })
local actions = require('fzf-lua.actions')
require('fzf-lua').setup(
    {
        winopts = {
            split = 'belowright 10new',
            border = 'single',
            preview = {
                -- hidden = 'hidden',
                border = 'border',
                title = false,
                layout = 'horizontal',
                horizontal = 'right:50%'
            }
        },
        actions = {
            files = {
                ['default'] = actions.file_tabedit,
                ['ctrl-x'] = actions.file_split,
                ['ctrl-v'] = actions.file_vsplit,
                ['ctrl-e'] = actions.file_edit
            }
        }
    }
)

-- keymaps
vim.keymap.set('n', '<leader>gre', ':FzfLua grep_project<CR>', { silent = true })
vim.keymap.set('n', '<leader>fnd', ':FzfLua files<CR>', { silent = true })
vim.keymap.set('n', '<leader>buf', ':FzfLua buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>hst', ':FzfLua oldfiles<CR>', { silent = true })

vim.keymap.set('n', '<leader>dia', ':FzfLua diagnostics_document<CR>')
vim.keymap.set('n', '<leader>dec', ':FzfLua lsp_declarations<CR>')
vim.keymap.set('n', '<leader>def', ':FzfLua lsp_definitions<CR>')
vim.keymap.set('n', '<leader>imp', ':FzfLua lsp_implementations<CR>')
vim.keymap.set('n', '<leader>ref', ':FzfLua lsp_references<CR>')
vim.keymap.set('n', '<leader>sym', ':FzfLua lsp_live_workspace_symbols<CR>')
