require('pinoq.pdeps')
require('pinoq.pstyle')
require('pinoq.pdap')
require('pinoq.plsp')
require('pinoq.ptst')
require('pinoq.pcomp')
require('pinoq.pmanip')
require('pinoq.ptui')
require('pinoq.pextra')

vim.keymap.set("n", "H", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "L", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>hls", ":set hlsearch!<CR>", { silent = true })

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



vim.keymap.set("n", "<Up>", ":resize -1<CR>", { silent = true })
vim.keymap.set("n", "<Down>", ":resize +1<CR>", { silent = true })
vim.keymap.set("n", "<Left>", ":vertical resize -1<CR>", { silent = true })
vim.keymap.set("n", "<Right>", ":vertical resize +1<CR>", { silent = true })
