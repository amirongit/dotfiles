local treesitter = require("nvim-treesitter")
local treesitter_ctx = require("treesitter-context")


treesitter.setup({ install_dir = vim.fn.stdpath("data") .. "/site" })

treesitter.install({
    "python",
    "bash",
    "json",
    "toml",
    "xml",
    "yaml",
    "markdown",
    "markdown_inline",
    "vimdoc"
})

treesitter_ctx.setup({
    enable = true,
    multiwindow = false,
    max_lines = 0,
    min_window_height = 30,
    line_numbers = true,
    multiline_threshold = 1,
    trim_scope = "outer",
    mode = "cursor",
    separator = "⎼",
    zindex = 20,
    on_attach = nil,
})
