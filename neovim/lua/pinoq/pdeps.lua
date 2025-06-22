local package_directory = vim.fn.stdpath('data') .. '/site'
local mini_directory_path = package_directory .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_directory_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/echasnovski/mini.nvim', mini_directory_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
end
local mn_deps = require('mini.deps')
mn_deps.setup({ path = { package = package_directory } })
local add = mn_deps.add
local update = MiniDeps.update
local later = MiniDeps.later
add('rebelot/kanagawa.nvim')
add('tpope/vim-fugitive')
add('tpope/vim-dadbod')
add('lukas-reineke/indent-blankline.nvim')
add('mfussenegger/nvim-dap-python')
add('rcarriga/nvim-dap-ui')
add('Decodetalkers/csharpls-extended-lsp.nvim')
add('b0o/schemastore.nvim')
add({ source = 'mfussenegger/nvim-dap', depends = { { source = 'nvim-neotest/nvim-nio' } } })
add({
    source = 'mason-org/mason-lspconfig.nvim',
    depends = {
        { source = 'mason-org/mason.nvim' },
        { source = 'neovim/nvim-lspconfig' }
    }
})
add({
    source = 'nvim-treesitter/nvim-treesitter-context',
    depends = { {
        source = 'nvim-treesitter/nvim-treesitter',
        hooks = { post_checkout = function() vim.cmd('TSUpdate') end }
    } }
})
-- update(nil, {force = true})
