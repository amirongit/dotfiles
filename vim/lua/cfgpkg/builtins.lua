-- keymaps
-- vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { silent = true })
-- vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { silent = true })
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")
vim.keymap.set("n", "<leader>sex", ":Sexplore<CR>", { silent = true })
vim.keymap.set("n", "<leader>vex", ":Vexplore<CR>", { silent = true })
vim.keymap.set("n", "<leader>tex", ":Texplore<CR>", { silent = true })
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, silent = true })
vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, silent = true })
vim.keymap.set("n", "<leader>hls", ":set hlsearch!<CR>", { silent = true })
vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })


-- functions
local keycode = vim.keycode or function(x)
    return vim.api.nvim_replace_termcodes(x, true, true, true)
end

local keys = {
['cr']        = keycode('<CR>'),
['ctrl-y']    = keycode('<C-y>'),
['ctrl-y_cr'] = keycode('<C-y><CR>'),
}

_G.cr_action = function()
    if vim.fn.pumvisible() ~= 0 then
        local item_selected = vim.fn.complete_info()['selected'] ~= -1
        return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
    else
    return keys['cr']
    end
end


-- settings
vim.opt.compatible = false
vim.opt.cursorline = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.list = false
vim.opt.splitbelow = true
vim.opt.cp = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.autoread = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.mouse = ""
vim.opt.cmdheight = 1
vim.opt.showtabline = 2
vim.opt.scrolloff = 0
vim.opt.clipboard:append("unnamedplus")
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.background = "dark"
vim.opt.encoding = "utf-8"
vim.opt.updatecount = 0
vim.opt.wildmode = { "list:longest", "list:full" }
vim.opt.termguicolors = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 5
vim.opt.foldlevel = 1
vim.opt.foldenable = false
-- vim.opt.pastetoggle = "<leader>p"
vim.opt.backspace = "indent,eol,start"
vim.opt.shortmess = ""
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"
vim.opt.updatetime = 300
vim.opt.signcolumn = "number"
vim.opt.laststatus = 2
vim.opt.syntax = "on"
vim.opt.fillchars = { eob = " " }

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
