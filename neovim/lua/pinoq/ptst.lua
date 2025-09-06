local treesitter_cfg = require('nvim-treesitter.configs')
local treesitter_ctx = require('treesitter-context')

treesitter_cfg.setup({
    ensure_installed = {
        "python",
        "bash",
        "json",
        "toml",
        "xml",
        "yaml",
        "markdown",
        "markdown_inline",
        "vimdoc"
    },
    sync_install = true,
    auto_install = true,
    highlight = { enable = true },
})
treesitter_ctx.setup({
    enable = true,
    multiwindow = false,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 1,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = '─',
    zindex = 20,
    on_attach = nil,
})
