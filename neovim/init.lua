vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = false
vim.opt.listchars = {
    tab = "> ",
    trail = ".",
    extends = "➔",
    precedes = "➔",
    -- space = ".",
    -- eol = "↓",
}
vim.opt.fillchars = {
    eob = " ",
    fold = " ",
}
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
vim.opt.compatible = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.splitbelow = true
vim.opt.cp = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = false
vim.opt.autoread = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.mouse = ""
-- vim.opt.showtabline = 0
vim.opt.scrolloff = 0
vim.opt.clipboard:append("unnamedplus")
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.encoding = "utf-8"
vim.opt.updatecount = 0
vim.opt.wildmode = { "list:longest", "list:full" }
vim.opt.virtualedit = "all"
vim.opt.backspace = "indent,eol,start"
vim.opt.updatetime = 300
vim.opt.laststatus = 2

if vim.g.vscode then
    require("pinoq.pide")
else
    require("pinoq.pdeps")
    require("pinoq.pstyle")
    require("pinoq.pdap")
    require("pinoq.plsp")
    require("pinoq.ptst")
    require("pinoq.pcomp")
    require("pinoq.pmanip")
    require("pinoq.ptui")
    require("pinoq.pextra")
    require("pinoq.pgui")
end
