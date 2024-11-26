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
vim.opt.foldmethod = "expr"
vim.opt.foldtext = ""
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 5
vim.opt.foldlevel = 99
vim.opt.foldenable = true
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

if vim.g.vscode then
    vim.keymap.set("n", "H", ":Tabprevious<CR>")
    vim.keymap.set("n", "L", ":Tabnext<CR>")
    vim.api.nvim_set_keymap(
        'n',
        '<leader>doc',
        ":lua require('vscode').call('editor.action.showHover') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>sig',
        ":lua require('vscode').call('editor.action.triggerParameterHints') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>dec',
        ":lua require('vscode').call('editor.action.peekDeclaration') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>def',
        ":lua require('vscode').call('editor.action.peekDefinition') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>ref',
        ":lua require('vscode').call('editor.action.referenceSearch.trigger') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>imp',
        ":lua require('vscode').call('editor.action.peekImplementation') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>tdf',
        ":lua require('vscode').call('editor.action.peekTypeDefinition') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>ren',
        ":lua require('vscode').call('editor.action.rename') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>ogc',
        ":lua require('vscode').call('editor.showOutgoingCalls') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>icc',
        ":lua require('vscode').call('editor.showIncomingCalls') <CR>",
        { silent = true }
    )
    vim.api.nvim_set_keymap(
        'n',
        '<leader>sym',
        ":lua require('vscode').call('workbench.action.gotoSymbol') <CR>",
        { silent = true }
    )

    vim.api.nvim_set_keymap('n', 'gh', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('n', 'gf', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('n', 'gd', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('n', 'gO', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('n', 'gF', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('n', 'gD', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('n', 'gH', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-]>', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('x', 'gh', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('x', 'gf', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('x', 'gd', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('x', 'gO', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('x', 'gF', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('x', 'gD', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('x', 'gH', '<NOP>', { silent = true })
    vim.api.nvim_set_keymap('x', '<C-]>', '<NOP>', { silent = true })
else
    vim.keymap.set("n", "H", "gT")
    vim.keymap.set("n", "L", "gt")
    vim.keymap.set("n", "<leader>sex", ":Sexplore<CR>", { silent = true })
    vim.keymap.set("n", "<leader>vex", ":Vexplore<CR>", { silent = true })
    vim.keymap.set("n", "<leader>tex", ":Texplore<CR>", { silent = true })
    vim.keymap.set("n", "<leader>hls", ":set hlsearch!<CR>", { silent = true })
end
