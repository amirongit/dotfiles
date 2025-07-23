-- :source $VIMRUNTIME/syntax/hitest.vim

local kanagawa = require('kanagawa')
local rosepine = require('rose-pine')
local ibl = require('ibl')
local mn_hipatterns = require('mini.hipatterns')
local mn_statusline = require('mini.statusline')
local mn_indentscope = require('mini.indentscope')
local mn_animate = require('mini.animate')
local mn_cursorword = require('mini.cursorword')
local mn_icons = require('mini.icons')
local mn_tabline = require('mini.tabline')
local mn_diff = require('mini.diff')

kanagawa.setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = { italic = false },
    keywordStyle = { italic = true },
    statementStyle = { bold = false },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    colors = { palette = {}, theme = { wave = {}, lotus = {}, dragon = {}, all = {} }, },
    overrides = function(colors)
        local theme = colors.theme
        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            RainbowRed = { fg = "#2A2A37" },
            RainbowYellow = { fg = "#363646" },
            RainbowBlue = { fg = "#54546D" },
            RainbowOrange = { fg = "#2D4F67" },
            RainbowGreen = { fg = "#76946A" },
            RainbowViolet = { fg = "#C34043" },
            RainbowCyan = { fg = "#FF9E3B" },
        }
    end,
    theme = "dragon",
    background = { dark = "dragon", light = "dragon" },
})
rosepine.setup({
    variant = "moon",
    dark_variant = "moon",
    dim_inactive_windows = false,
    extend_background_behind_borders = true,
    enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
    },
    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },
    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",
        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",
        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",
        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },
    palette = {},
    highlight_groups = {
        CurSearch = { fg = "base", bg = "leaf", inherit = false },
        Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
        RainbowRed = { fg = "#2a273f" },
        RainbowYellow = { fg = "#393552" },
        RainbowBlue = { fg = "#6e6a86" },
        RainbowOrange = { fg = "#908caa" },
        RainbowGreen = { fg = "#e0def4" },
        RainbowViolet = { fg = "#eb6f92" },
        RainbowCyan = { fg = "#f6c177" },
    },

    before_highlight = function(group, highlight, palette)
    end,
})

vim.cmd("colorscheme kanagawa-dragon")

vim.api.nvim_set_hl(0, 'LineNr', {})
vim.api.nvim_set_hl(0, 'SignColumn', {})
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = 'darkcyan', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = 'darkmagenta', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = 'darkred', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'CocWarningSign', { bg = 'brown', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'CocErrorSign', { bg = 'darkred', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'CocHintSign', { bg = 'lightblue', fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = 'Gray', bg = 'bg' })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = 'Gray', bg = 'bg' })
vim.api.nvim_set_hl(0, 'TabLine', { fg = 'Gray', bg = 'bg' })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = 'DarkYellow', bg = 'bg' })
vim.api.nvim_set_hl(0, 'NonText', { bold = false, italic = false, underline = false, fg = 'Gray' })
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = 'Gray', bold = true })
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbolOff', { fg = 'Gray', bold = true })
vim.api.nvim_set_hl(0, 'MiniCursorword', { underline = false, fg = 'LightBlue' })
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', {})
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "LightBlue" })
vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { bg = "none" })
vim.api.nvim_set_hl(0, "MiniDiffSignChange", { bg = "none" })
vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { bg = "none" })

mn_animate.setup(
    {
        cursor = { enable = false, },
        scroll = {
            enable = true,
            timing = mn_animate.gen_timing.linear({ duration = 200, unit = 'total' }),
            subscroll = mn_animate.gen_subscroll.equal()
        },
        resize = {
            enable = true,
            timing = mn_animate.gen_timing.linear({ duration = 50, unit = 'total' }),
            subresize = mn_animate.gen_subresize.equal()
        },
        open = {
            enable = true,
            timing = mn_animate.gen_timing.linear({ duration = 200, unit = 'total' }),
            winconfig = mn_animate.gen_winconfig.wipe(),
            winblend = mn_animate.gen_winblend.linear()
        },
        close = {
            enable = true,
            timing = mn_animate.gen_timing.linear({ duration = 200, unit = 'total' }),
            winconfig = mn_animate.gen_winconfig.wipe(),
            winblend = mn_animate.gen_winblend.linear()
        },
    }
)
mn_icons.setup({
    style = 'glyph',
    default = {},
    directory = {},
    extension = {},
    file = {},
    filetype = {},
    lsp = {},
    os = {},
    use_file_extension = function(ext, file) return true end,
})
mn_cursorword.setup({ delay = 500 })
mn_indentscope.setup({
    draw = { delay = 250, priority = 2, },
    mappings = {},
    options = { border = 'both', indent_at_cursor = true, try_as_border = false, },
    symbol = '›',
})
mn_statusline.setup({
    content = {
        active = function()
            local mode, mode_hl = mn_statusline.section_mode({ trunc_width = 5 })
            return mn_statusline.combine_groups(
                {
                    { hl = mode_hl, strings = { mode } },
                    {
                        hl = 'PmenuSel',
                        strings = {
                            mn_statusline.section_git({ trunc_width = 120 }),
                            mn_statusline.section_fileinfo({ trunc_width = 120 }),
                        },
                    },
                    {
                        hl = mode_hl,
                        strings = { mn_statusline.section_filename({ trunc_width = 120 }) }
                    },
                    '%=',
                    {
                        hl = 'Cursor',
                        strings = {
                            mn_statusline.section_searchcount({ trunc_width = 75 }),
                            mn_statusline.section_location({ trunc_width = 75 }),
                        }
                    },
                }
            )
        end,
        inactive = function()
            return mn_statusline.combine_groups({
                { hl = 'CursorLine', strings = { mn_statusline.section_filename({ trunc_width = 120 }) } },
            })
        end,
    },
    use_icons = true,
    set_vim_settings = true,
})
mn_hipatterns.setup({
    highlighters = {
        ufixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        uhack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        utodo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        unote = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        uwarning = { pattern = '%f[%w]()WARNING()%f[%W]', group = 'MiniHipatternsFixme' },
        fixme = { pattern = '%f[%w]()fixme()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()hack()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()todo()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()note()%f[%W]', group = 'MiniHipatternsNote' },
        warning = { pattern = '%f[%w]()warning()%f[%W]', group = 'MiniHipatternsFixme' },
        hex_color = mn_hipatterns.gen_highlighter.hex_color(),
    }
})
mn_tabline.setup({ show_icons = true, format = nil, tabpage_section = 'right', })
mn_diff.setup({
    view = {
        -- style = vim.go.number and 'number' or 'sign',
        style = 'number',
        signs = { add = '+', change = '~', delete = '-' },
        priority = 199,
    },
    source = nil,
    delay = { text_change = 200, },
    mappings = {
        apply = 'gh',
        reset = 'gH',
        textobject = 'gh',
        goto_first = '[H',
        goto_prev = '[h',
        goto_next = ']h',
        goto_last = ']H',
    },
    options = {
        algorithm = 'histogram',
        indent_heuristic = true,
        linematch = 60,
        wrap_goto = false,
    },
})
ibl.setup({
    scope = { enabled = false },
    indent = {
        highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }
    }
})

mn_icons.tweak_lsp_kind('replace')


vim.opt.cursorline = false
vim.opt.listchars = {
    tab = '> ',
    trail = '.',
    extends = '➔',
    precedes = '➔',
    -- space = '.',
    -- eol = '↓',
}
vim.opt.fillchars = { eob = " ", fold = " " }
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldtext = ""
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 5
vim.opt.foldlevel = 1
vim.opt.foldcolumn = "0"
vim.opt.foldenable = false
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"
vim.opt.signcolumn = "number"
vim.opt.syntax = "on"
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 1
-- vim.opt.shortmess:append("C")
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
