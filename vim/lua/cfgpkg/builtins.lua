-- keymaps
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { silent = true })

vim.keymap.set("n", "<leader>pt", "gT")
vim.keymap.set("n", "<leader>nt", "gt")

vim.keymap.set("n", "<leader>nb", "<CMD>bnext<CR>")
vim.keymap.set("n", "<leader>pb", "<CMD>bprevious<CR>")

vim.keymap.set("n", "<leader>sex", ":Sexplore<CR>", { silent = true })
vim.keymap.set("n", "<leader>vex", ":Vexplore<CR>", { silent = true })
vim.keymap.set("n", "<leader>tex", ":Texplore<CR>", { silent = true })

vim.keymap.set("n", "<leader>hs", ":set hlsearch!<CR>", { silent = true })

-- settings
vim.opt.compatible = false
vim.opt.cursorline = true
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
vim.opt.showtabline = 0
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
