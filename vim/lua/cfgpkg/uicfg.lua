-- colorscheme
vim.cmd("colorscheme base16-gruvbox-dark-hard")

-- animations
require('mini.animate').setup()

-- highlight cursor word
require('mini.cursorword').setup()


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
        delay = 250,
        -- animation = require('mini.indentscope').gen_animation.quadratic({ easing = 'out', duration = 500, unit = 'total' }),
        animation = require('mini.indentscope').gen_animation.none(),
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
vim.api.nvim_set_hl(0, 'MiniCursorword', { underline = true })
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', {})

-- statusline
-- colors: so $VIMRUNTIME/syntax/hitest.vim
require('mini.statusline').setup(
    {
        content = {
            active = function()
                return MiniStatusline.combine_groups({
                    { hl = 'StatusLine', strings = { '%{mode()} %t %m %r %h %w' } },
                    '%=',
                    { hl = 'MatchParen', strings = { '%c %y' } },
                })
            end,
            inactive = function()
                return MiniStatusline.combine_groups({
                    { hl = 'CursorLineNr', strings = { '%t %m' } },
                    '%=',
                    { hl = 'MatchParen', strings = { '%y' } },
                })
            end,
        },
        use_icons = false,
        set_vim_settings = true,
    }
)
