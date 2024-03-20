require('lspfuzzy').setup(
    {
        methods = 'all',
        jump_one = false,
        fzf_preview = { 'right,50%,border-sharp' },
        fzf_action = {
            ['enter'] = 'tab split',
            ['ctrl-v'] = 'vsplit',
            ['ctrl-x'] = 'split',
            ['ctrl-e'] = 'e'
        }
    }
)

-- settings
vim.g.fzf_preview_window = { 'right,50%,border-sharp', 'ctrl-/' }
vim.g.fzf_tags_command = 'ctags -R'
vim.g.fzf_layout = { down = '30%' }
vim.g.fzf_action = { enter = 'tab split', ['ctrl-x'] = 'split', ['ctrl-v'] = 'vsplit', ['ctrl-e'] = 'e' }

-- keymaps
vim.keymap.set("n", "<leader>gre", ":Rg<CR>", { silent = true })
vim.keymap.set("n", "<leader>fnd", ":Files<CR>", { silent = true })
vim.keymap.set("n", "<leader>wnd", ":Windows<CR>", { silent = true })
vim.keymap.set("n", "<leader>hst", ":History<CR>", { silent = true })
vim.keymap.set("n", "<leader>dib", ":LspDiagnostics 0<CR>", { silent = true })
vim.keymap.set("n", "<leader>dia", ":LspDiagnosticsAll<CR>", { silent = true })
