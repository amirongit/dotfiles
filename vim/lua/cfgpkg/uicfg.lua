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

-- highlight groups
vim.cmd("hi clear LineNr")
vim.cmd("hi clear SignColumn")
vim.cmd("hi DiffAdd guibg=darkcyan guifg=white cterm=bold gui=bold")
vim.cmd("hi DiffChange guibg=darkmagenta guifg=white cterm=bold gui=bold")
vim.cmd("hi DiffDelete guibg=darkred guifg=white cterm=bold gui=bold")
vim.cmd("hi CocWarningSign guibg=darkbrown guifg=white cterm=bold gui=bold")
vim.cmd("hi CocErrorSign guibg=darkred guifg=white cterm=bold gui=bold")
vim.cmd("hi CocHintSign guibg=lightblue guifg=white cterm=bold gui=bold")
vim.cmd("hi TabLineFill guifg=Gray guibg=bg")
vim.cmd("hi TabLine guifg=Gray guibg=bg")
vim.cmd("hi TabLineSel guifg=DarkYellow guibg=bg")
vim.cmd("hi NonText gui=None")

-- functions
local function get_mode_color()
    local current_mode = vim.api.nvim_get_mode().mode

    if current_mode == "i" or current_mode == "ic" or current_mode == "R" then
        return "%#IncSearch#"
    elseif current_mode == "v" or current_mode == "V" or current_mode == "" or current_mode == "t" then
        return "%#CocMenuSel#"
    end

    return "%#Visual#"
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
