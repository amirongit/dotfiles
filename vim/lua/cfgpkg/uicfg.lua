-- colorscheme
vim.cmd("colorscheme base16-gruvbox-dark-hard")

-- animations
require('mini.animate').setup()

-- highlight patterns
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
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

-- functions
local function get_mode_color()
    local current_mode = vim.api.nvim_get_mode().mode

    if current_mode == "i" or current_mode == "ic" or current_mode == "R" then
        return "%#RedrawDebugComposed#"
    elseif current_mode == "v" or current_mode == "V" or current_mode == "" or current_mode == "t" then
        return "%#User2#"
    end

    return "%#FloatShadow#"
end

local function get_status_line_items()
    return table.concat {
        "%#DiffChange#",
        get_mode_color(),
        " %{mode()}",
        " %t",
        " %m",
        " %r",
        " %h",
        " %w",
        " %=",
        " %c",
        " %Y ",
    }
end

-- statusline
-- colors: so $VIMRUNTIME/syntax/hitest.vim
Statusline = {}

Statusline.active = get_status_line_items

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.active()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.active()
  augroup END
]], false)
