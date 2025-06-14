-- :source $VIMRUNTIME/syntax/hitest.vim

local kanagawa = require('kanagawa')
local ibl = require('ibl')
local mn_hipatterns = require('mini.hipatterns')
local mn_statusline = require('mini.statusline')
local mn_indentscope = require('mini.indentscope')
local mn_animate = require('mini.animate')
local mn_cursorword = require('mini.cursorword')
local mn_icons = require('mini.icons')
local mn_tabline = require('mini.tabline')

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
    colors = {palette = {}, theme = { wave = {}, lotus = {}, dragon = {}, all = {} },},
    overrides = function(colors)
        local theme = colors.theme
        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
    end,
    theme = "dragon",
    background = {dark = "dragon", light = "lotus"},
})
vim.cmd("colorscheme kanagawa-dragon")

vim.api.nvim_set_hl(0, 'LineNr', {})
vim.api.nvim_set_hl(0, 'SignColumn', {})
vim.api.nvim_set_hl(0, 'DiffAdd', {bg = 'darkcyan', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'DiffChange', {bg = 'darkmagenta', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'DiffDelete', {bg = 'darkred', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'CocWarningSign', {bg = 'brown', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'CocErrorSign', {bg = 'darkred', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'CocHintSign', {bg = 'lightblue', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'TabLineFill', {fg = 'Gray', bg = 'bg'})
vim.api.nvim_set_hl(0, 'TabLine', {fg = 'Gray', bg = 'bg'})
vim.api.nvim_set_hl(0, 'TabLineSel', {fg = 'DarkYellow', bg = 'bg'})
vim.api.nvim_set_hl(0, 'NonText', {bold = false, italic = false, underline = false, fg = 'Gray'})
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', {fg = 'Gray', bold = true})
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbolOff', {fg = 'Gray', bold = true})
vim.api.nvim_set_hl(0, 'MiniCursorword', {underline = false, fg = 'LightRed'})
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', {})
vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#C34043" })
vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#DCA561" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#658594" })
vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FF5D62" })
vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#7AA89F" })
vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#D27E99" })
vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#7E9CD8" })

mn_animate.setup()
mn_icons.setup()
mn_cursorword.setup({delay = 500})
mn_indentscope.setup({
    draw = {delay = 250, priority = 2,},
    mappings = {},
    options = {border = 'both', indent_at_cursor = true, try_as_border = false,},
    symbol = '›',
})
mn_statusline.setup({
    content = {
        active = function()
            local git           = mn_statusline.section_git({trunc_width = 40});
            local diff          = mn_statusline.section_diff({trunc_width = 75});
            local diagnostics   = mn_statusline.section_diagnostics({trunc_width = 75});
            local lsp           = mn_statusline.section_lsp({trunc_width = 75});
            local filename      = mn_statusline.section_filename({trunc_width = 120});
            local fileinfo      = mn_statusline.section_fileinfo({trunc_width = 120});
            local location      = mn_statusline.section_location({trunc_width = 75});

            return mn_statusline.combine_groups({
                -- {hl = 'TSVariable', strings = {'%{mode()} %t %m %r %h %w'}},
                {hl = 'PmenuThumb', strings = {filename, diff, '%r'}},
                '%=',
                {hl = 'Cursor', strings = {git, location, lsp, diagnostics, fileinfo}},
            })
        end,
        inactive = function()
            return mn_statusline.combine_groups({
                {hl = 'CursorLine', strings = {'%t %m'}},
            })
        end,
    },
    use_icons = true,
    set_vim_settings = true,
})
mn_hipatterns.setup({
    highlighters = {
        ufixme = {pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme'},
        uhack = {pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'},
        utodo = {pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'},
        unote = {pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'},
        uwarning = {pattern = '%f[%w]()WARNING()%f[%W]', group = 'MiniHipatternsFixme'},
        fixme = {pattern = '%f[%w]()fixme()%f[%W]', group = 'MiniHipatternsFixme'},
        hack = {pattern = '%f[%w]()hack()%f[%W]',  group = 'MiniHipatternsHack'},
        todo = {pattern = '%f[%w]()todo()%f[%W]',  group = 'MiniHipatternsTodo'},
        note = {pattern = '%f[%w]()note()%f[%W]',  group = 'MiniHipatternsNote'},
        warning = {pattern = '%f[%w]()warning()%f[%W]', group = 'MiniHipatternsFixme'},
        hex_color = mn_hipatterns.gen_highlighter.hex_color(),
    }
})
mn_tabline.setup({show_icons = true, format = nil, tabpage_section = 'right',})
ibl.setup({
    scope = {enabled = false},
    indent = { highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }}
})

mn_icons.tweak_lsp_kind('replace')


vim.opt.cursorline = false
vim.opt.listchars = {
    tab = '→ ',
    trail = '܁',
    -- extends = '➔',
    -- precedes = '➔',
    space = '܁',
    eol = '↓',
}
vim.opt.fillchars = {eob = " ", fold = " "}
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
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
