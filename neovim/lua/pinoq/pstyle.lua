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
local navic = require("nvim-navic")

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
        }
    end,
    theme = "dragon",
    background = { dark = "dragon", light = "lotus" },
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
vim.api.nvim_set_hl(0, 'TabLine', { fg = 'Gray', bg = 'bg' })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = 'DarkYellow', bg = 'bg' })
vim.api.nvim_set_hl(0, 'NonText', { bold = false, italic = false, underline = false, fg = 'Gray' })
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = 'Gray', bold = true })
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbolOff', { fg = 'Gray', bold = true })
vim.api.nvim_set_hl(0, 'MiniCursorword', { underline = false, fg = 'LightRed' })
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', {})
vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#43242B" })
vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#49443C" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#717C7C" })
vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#6A9589" })
vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#2B3328" })
vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#54546D" })
vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#2D4F67" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "LightBlue" })

mn_animate.setup()
mn_icons.setup()
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
            local first_strings = {}
            local file_section;
            local relative = vim.fn.expand('%')
            if relative:sub(1,1) == "/" then
                file_section = mn_icons.get('file', vim.fn.expand('%:t')) .. " " .. relative
            else
                file_section = mn_icons.get('file', vim.fn.expand('%:t')) .. " ./" .. relative
            end
            if navic.is_available() then
                first_strings = file_section .. ' > ' .. navic.get_location()
            else
                first_strings = file_section
            end

            return mn_statusline.combine_groups(
                {
                    { hl = 'PmenuSel',  strings = { first_strings } },
                    -- { hl = 'CursorLine' },
                    '%=',
                    {
                        hl = 'Cursor',
                        strings = {
                            mn_statusline.section_git({ trunc_width = 120 }),
                            mn_statusline.section_location({ trunc_width = 75 }),
                            mn_statusline.section_lsp({ trunc_width = 75 }),
                            mn_statusline.section_diagnostics({ trunc_width = 75 }),
                            mn_statusline.section_fileinfo({ trunc_width = 120 })
                        }
                    },
                }
            )
        end,
        inactive = function()
            return mn_statusline.combine_groups({
                { hl = 'CursorLine', strings = { mn_icons.get('file', vim.fn.expand('%:t')) .. " ./" .. vim.fn.expand('%') } },
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
navic.setup({
    icons = {
        File          = mn_icons.get('lsp', 'File') .. " ",
        Module        = mn_icons.get('lsp', 'Module') .. " ",
        Namespace     = mn_icons.get('lsp', 'Namespace') .. " ",
        Package       = mn_icons.get('lsp', 'Package') .. " ",
        Class         = mn_icons.get('lsp', 'Class') .. " ",
        Method        = mn_icons.get('lsp', 'Method') .. " ",
        Property      = mn_icons.get('lsp', 'Property') .. " ",
        Field         = mn_icons.get('lsp', 'Field') .. " ",
        Constructor   = mn_icons.get('lsp', 'Constructor') .. " ",
        Enum          = mn_icons.get('lsp', 'Enum') .. " ",
        Interface     = mn_icons.get('lsp', 'Interface') .. " ",
        Function      = mn_icons.get('lsp', 'Function') .. " ",
        Variable      = mn_icons.get('lsp', 'Variable') .. " ",
        Constant      = mn_icons.get('lsp', 'Constant') .. " ",
        String        = mn_icons.get('lsp', 'String') .. " ",
        Number        = mn_icons.get('lsp', 'Number') .. " ",
        Boolean       = mn_icons.get('lsp', 'Boolean') .. " ",
        Array         = mn_icons.get('lsp', 'Array') .. " ",
        Object        = mn_icons.get('lsp', 'Object') .. " ",
        Key           = mn_icons.get('lsp', 'Key') .. " ",
        Null          = mn_icons.get('lsp', 'Null') .. " ",
        EnumMember    = mn_icons.get('lsp', 'EnumMember') .. " ",
        Struct        = mn_icons.get('lsp', 'Struct') .. " ",
        Event         = mn_icons.get('lsp', 'Event') .. " ",
        Operator      = mn_icons.get('lsp', 'Operator') .. " ",
        TypeParameter = mn_icons.get('lsp', 'TypeParameter') .. " ",
    },
    lsp = {
        auto_attach = false,
        preference = nil,
    },
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = false,
    click = false,
    format_text = function(text)
        return text
    end,
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
