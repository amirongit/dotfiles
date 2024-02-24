-- highlight groups
vim.cmd("hi clear SignColumn")
vim.cmd("hi clear LineNr")
-- vim.cmd("hi EndOfBuffer ctermfg=bg ctermbg=bg guifg=bg guibg=bg")
vim.cmd("hi DiffAdd guibg=darkcyan guifg=white cterm=bold gui=bold")
vim.cmd("hi DiffChange guibg=darkmagenta guifg=white cterm=bold gui=bold")
vim.cmd("hi DiffDelete guibg=darkred guifg=white cterm=bold gui=bold")
vim.cmd("hi CocWarningSign guibg=brown guifg=white cterm=bold gui=bold")
vim.cmd("hi CocErrorSign guibg=darkred guifg=white cterm=bold gui=bold")
vim.cmd("hi CocHintSign guibg=lightblue guifg=white cterm=bold gui=bold")
vim.cmd("hi TabLineFill guifg=Gray guibg=bg")
vim.cmd("hi TabLine guifg=Gray guibg=bg")
vim.cmd("hi TabLineSel guifg=DarkYellow guibg=bg")
vim.cmd("hi NonText gui=None")

-- colorscheme
vim.cmd("colorscheme jellybeans")

-- statusline
-- colors: so $VIMRUNTIME/syntax/hitest.vim
Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#ErrorMsg#",
    " %{mode()}",
    " %n",
    " %t",
    " %c",
    " %#DiffChange#",
    " %L",
    " %m",
    " %r",
    " %h",
    " %w",
    " %=",
    " %#DbgBreakPt#",
    " %Y ",
    -- "%{StatusDiagnostic()}",
  }
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.active()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.active()
  augroup END
]], false)
