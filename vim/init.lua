local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- '--branch', 'stable',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

require('mini.deps').setup({ path = { package = path_package } })

local add = MiniDeps.add
local update = MiniDeps.update
local later = MiniDeps.later


add('RRethy/base16-nvim')
add('tpope/vim-fugitive')
add('tpope/vim-dadbod')
add('lukas-reineke/indent-blankline.nvim')
add(
    {
        source = 'ojroques/nvim-lspfuzzy',
        depends = {
            {
                source = 'junegunn/fzf.vim',
                dependes = {
                    {
                        source = 'junegunn/fzf',
                        hooks = {post_checkout = function() vim.cmd('fzf#install()') end}
                    }
                }
            }
        }
    }
)
add({source = 'mfussenegger/nvim-dap', depends = {{source = 'nvim-neotest/nvim-nio'}}})
add({source = 'mfussenegger/nvim-dap-python'})
add({source = 'rcarriga/nvim-dap-ui'})
add(
    {
        source = 'williamboman/mason.nvim',
        depends = {
            {source = 'williamboman/mason-lspconfig.nvim'},
            {source = 'neovim/nvim-lspconfig'}
        }
    }
)
add(
    {
        source = 'nvim-treesitter/nvim-treesitter-context',
        depends = {
            {
                source = 'nvim-treesitter/nvim-treesitter',
                hooks = {post_checkout = function() vim.cmd('TSUpdate') end}
            }
        }
    }
)

-- update(nil, { force = true })

require('cfgpkg')
