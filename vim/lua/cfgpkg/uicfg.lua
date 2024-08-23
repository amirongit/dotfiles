-- colorscheme
vim.cmd("colorscheme base16-classic-dark")

-- animations
require('mini.animate').setup()

-- icons
-- require('mini.icons').setup()
-- MiniDeps.later(MiniIcons.tweak_lsp_kind)

-- highlight patterns
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote' },
    warning = { pattern = '%f[%w]()WARNING()%f[%W]', group = 'MiniHipatternsFixme' },

    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- scope guides
require('mini.indentscope').setup(
    {
    draw = {
        delay = 100,
        animation = require('mini.indentscope').gen_animation.quadratic({ easing = 'out', duration = 500, unit = 'total' }),
        priority = 2,
    },
    mappings = {},
    options = {
        border = 'both',
        indent_at_cursor = true,
        try_as_border = false,
    },
    symbol = '>',
    }
)
require("ibl").setup({ scope = { enabled = false } })

-- highlight groups
vim.api.nvim_set_hl(0, 'LineNr', {})
vim.api.nvim_set_hl(0, 'SignColumn', {})
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = 'darkcyan', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = 'darkmagenta', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = 'darkred', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'CocWarningSign', { bg = 'brown', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'CocErrorSign', { bg = 'darkred', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'CocHintSign', { bg = 'lightblue', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = 'Gray', bg = 'bg' })
vim.api.nvim_set_hl(0, 'TabLine', { fg = 'Gray', bg = 'bg' })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = 'DarkYellow', bg = 'bg' })
vim.api.nvim_set_hl(0, 'NonText', { bold = false, italic = false, underline = false })
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = 'Gray', bold = true })
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbolOff', { fg = 'Gray', bold = true })

-- statusline
-- colors: so $VIMRUNTIME/syntax/hitest.vim
require('mini.statusline').setup(
    {
        content = {
            active = function()
                return MiniStatusline.combine_groups({
                    { hl = 'Conditional', strings = { '%{mode()} %t %m %r %h %w' } },
                    '%=',
                    { hl = 'Question', strings = { '%c %y' } },
                })
            end,
            inactive = function()
                return MiniStatusline.combine_groups({
                    { hl = 'PmenuThumb', strings = { '%t %m' } },
                    '%=',
                    { hl = 'Question', strings = { '%y' } },
                })
            end,
        },
        use_icons = false,
        set_vim_settings = true,
    }
)
