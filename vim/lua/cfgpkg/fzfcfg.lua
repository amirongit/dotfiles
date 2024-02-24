-- keymaps
vim.keymap.set("n", "<leader>gre", ":Rg<CR>", {silent=true})
vim.keymap.set("n", "<leader>fnd", ":Files<CR>", {silent=true})
vim.keymap.set("n", "<leader>wnd", ":Windows<CR>", {silent=true})

-- settings
vim.g.fzf_preview_window = {'right,50%,noborder', 'ctrl-/'}
vim.g.fzf_tags_command = 'ctags -R'
vim.g.fzf_layout = {down = '30%'}
vim.g.fzf_action = {enter = 'tab split', ['ctrl-x'] = 'split', ['ctrl-v'] = 'vsplit'}

