require('nvim-treesitter.configs').setup(
    {
        ensure_installed = { "python", "bash", "json", "toml", "xml", "yaml" },
        sync_install = true,
        auto_install = true,
        highlight = { enable = true },
    }
)
