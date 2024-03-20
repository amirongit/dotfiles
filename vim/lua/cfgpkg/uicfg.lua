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

-- colorscheme
vim.cmd("colorscheme codedark")

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
