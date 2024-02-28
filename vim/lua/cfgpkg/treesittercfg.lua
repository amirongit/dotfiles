require('pckr').add(
    {
        {
            'nvim-treesitter/nvim-treesitter-context',
            requires = { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        }
    }
)

require('nvim-treesitter.configs').setup(
    {
        ensure_installed = { "python", "c_sharp", "bash", "json", "toml", "xml", "yaml" },
        sync_install = true,
        auto_install = true,
        highlight = { enable = true },
    }
)
