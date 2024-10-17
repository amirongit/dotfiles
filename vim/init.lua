local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
      'git', 'clone', '--filter=blob:none',
      -- '--branch', 'stable',
      'https://github.com/echasnovski/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
end

require('mini.deps').setup({path = {package = path_package } })

local add = MiniDeps.add
local update = MiniDeps.update
local later = MiniDeps.later

add('RRethy/base16-nvim')
add('tpope/vim-fugitive')
add('tpope/vim-dadbod')
add('lukas-reineke/indent-blankline.nvim')
add('mfussenegger/nvim-dap-python')
add('rcarriga/nvim-dap-ui')
add({source = 'mfussenegger/nvim-dap', depends = {{source = 'nvim-neotest/nvim-nio'}}})
add({
    source = 'williamboman/mason.nvim',
    depends = {{source = 'williamboman/mason-lspconfig.nvim'}, {source = 'neovim/nvim-lspconfig'}}
})
add({
    source = 'nvim-treesitter/nvim-treesitter-context',
    depends = {{
        source = 'nvim-treesitter/nvim-treesitter',
        hooks = {post_checkout = function() vim.cmd('TSUpdate') end}
    }}
})

-- update(nil, {force = true})

-- functions
local keycode = vim.keycode or function(x)
    return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
    ['cr'] = keycode('<CR>'),
    ['ctrl-y'] = keycode('<C-y>'),
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
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}

    opts.winblend = 10
    opts.border = {
        {' ', 'FloatBorder'},
        {'-', 'FloatBorder'},
        {' ', 'FloatBorder'},
        {'|', 'FloatBorder'},
        {' ', 'FloatBorder'},
        {'-', 'FloatBorder'},
        {' ', 'FloatBorder'},
        {'|', 'FloatBorder'},
    }
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
local win_config = function()
    height = math.floor(0.618 * vim.o.lines)
    width = math.floor(0.618 * vim.o.columns)
    return {
        anchor = 'NW', height = height, width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end

-- keymaps
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")
vim.keymap.set("n", "<leader>sex", ":Sexplore<CR>", {silent = true})
vim.keymap.set("n", "<leader>vex", ":Vexplore<CR>", {silent = true})
vim.keymap.set("n", "<leader>tex", ":Texplore<CR>", {silent = true})
vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, {expr = true, silent = true})
vim.keymap.set('i', '<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, {expr = true, silent = true})
vim.keymap.set("n", "<leader>hls", ":set hlsearch!<CR>", {silent = true})
vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', {expr = true})
vim.keymap.set('n', 'K', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'J', vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>res", ":LspRestart<CR>", {silent = true})
vim.keymap.set('n', '<leader>ren', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>doc', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>sig', vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>brk", "<CMD>DapToggleBreakpoint<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbc", "<CMD>DapContinue<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbi", "<CMD>DapStepInto<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbo", "<CMD>DapStepOut<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbn", "<CMD>DapStepOver<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbx", "<CMD>DapTerminate<CR>", {silent = true})
vim.keymap.set("n", "<leader>trm", function() vim.cmd('lua MiniTrailspace.trim()') end, {silent = true})
vim.keymap.set("n", "<leader>cln", function() vim.cmd('lua MiniTrailspace.trim_last_lines()') end, {silent = true})
vim.keymap.set("n", "<leader>gre", ":Pick grep_live<CR>", {silent = true})
vim.keymap.set("n", "<leader>fnd", ":Pick files<CR>", {silent = true})
vim.keymap.set("n", "<leader>map", ":Pick keymaps<CR>", {silent = true})
vim.keymap.set("n", "<leader>dia", ":Pick diagnostic<CR>", {silent = true})
vim.keymap.set("n", "<leader>def", ":Pick lsp scope='definition'<CR>", {silent = true})
vim.keymap.set("n", "<leader>dec", ":Pick lsp scope='declaration'<CR>", {silent = true})
vim.keymap.set("n", "<leader>tdf", ":Pick lsp scope='type_definition'<CR>", {silent = true})
vim.keymap.set("n", "<leader>imp", ":Pick lsp scope='implementation'<CR>", {silent = true})
vim.keymap.set("n", "<leader>ref", ":Pick lsp scope='references'<CR>", {silent = true})
vim.keymap.set("n", "<leader>dym", ":Pick lsp scope='document_symbol'<CR>", {silent = true})
vim.keymap.set("n", "<leader>wym", ":Pick lsp scope='workspace_symbol'<CR>", {silent = true})

-- sign column
for _, diag in ipairs({'Error', 'Warn', 'Info', 'Hint'}) do
    vim.fn.sign_define('DiagnosticSign' .. diag, {
        text = '',
        texthl = 'DiagnosticSign' .. diag,
        linehl = '',
        numhl = 'DiagnosticSign' .. diag,
    })
end
vim.fn.sign_define('DapBreakpoint', {text = '●'})
vim.fn.sign_define('DapBreakpointCondition', {text = '◍', texthl = 'red', linehl = '', numhl = ''})
vim.fn.sign_define('DapLogPoint', {text = '◉', texthl = 'red', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped', {text = '➲', texthl = 'red', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected', {text = '○', texthl = 'red', linehl = '', numhl = ''})

-- options
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
vim.opt.wildmode = {"list:longest", "list:full"}
vim.opt.termguicolors = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 5
vim.opt.foldlevel = 1
vim.opt.foldenable = false
vim.opt.backspace = "indent,eol,start"
vim.opt.shortmess = ""
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"
vim.opt.updatetime = 300
vim.opt.signcolumn = "number"
vim.opt.laststatus = 2
vim.opt.syntax = "on"
vim.opt.fillchars = {eob = " "}

-- diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
})

-- explorer
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- colorscheme
vim.cmd("colorscheme base16-gruvbox-dark-hard")

-- highlight groups
vim.api.nvim_set_hl(0, 'LineNr', {})
vim.api.nvim_set_hl(0, 'SignColumn', {})
vim.api.nvim_set_hl(0, 'DiffAdd', {bg = 'darkcyan', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'DiffChange', {bg = 'darkmagenta', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'DiffDelete', {bg = 'darkred', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'CocWarningSign', {bg = 'brown', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'CocErrorSign', {bg = 'darkred', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'CocHintSign', {bg = 'lightblue', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'TabLineFill', {fg = 'Gray', bg = 'bg' })
vim.api.nvim_set_hl(0, 'TabLine', {fg = 'Gray', bg = 'bg'})
vim.api.nvim_set_hl(0, 'TabLineSel', {fg = 'DarkYellow', bg = 'bg'})
vim.api.nvim_set_hl(0, 'NonText', {bold = false, italic = false, underline = false})
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', {fg = 'Gray', bold = true})
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbolOff', {fg = 'Gray', bold = true})
vim.api.nvim_set_hl(0, 'MiniCursorword', {reverse = true})
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', {})
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        fixme = {pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme'},
        hack = {pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'},
        todo = {pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'},
        note = {pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'},
        warning = {pattern = '%f[%w]()WARNING()%f[%W]', group = 'MiniHipatternsFixme'},
        hex_color = hipatterns.gen_highlighter.hex_color(),
    }
})

-- language servers
local servers = {
    'docker_compose_language_service', 'dockerls',
    'jsonls', 'sqlls', 'taplo', 'lemminx', 'yamlls',
    'docker_compose_language_service', 'dockerls', 'lua_ls',
    'bashls', 'pyright',
}
local lspconfig = require('lspconfig')
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({})
end

-- debugging
local dap = require("dap")
local dapui = require("dapui")
dapui.setup({
    controls = {element = "repl", enabled = false,},
    element_mappings = {},
    expand_lines = false,
    floating = {border = "single", mappings = {close = {"q", "<Esc>"}}},
    force_buffers = true,
    icons = {collapsed = "", current_frame = "", expanded = ""},
    layouts = {{
        elements = {{id = "breakpoints", size = 0.15}, {id = "stacks", size = 0.15}, {id = "watches", size = 0.70}},
        position = "left",
        size = 40
    }, {elements = {{id = "repl", size = 0.7}, {id = "console", size = 0.3}}, position = "bottom", size = 10}},
    mappings = {edit = "e", expand = {"<CR>", "<2-LeftMouse>"}, open = "o", remove = "d", repl = "r", toggle = "t"},
    render = {indent = 1, max_value_lines = 100}
})
dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close

-- picker
local pick = require('mini.pick')
pick.setup({
    delay = {async = 10, busy = 50,},
    mappings = {
        caret_left  = '<Left>',
        caret_right = '<Right>',
        choose            = '<CR>',
        choose_in_split   = '<C-x>',
        choose_in_tabpage = '<C-t>',
        choose_in_vsplit  = '<C-v>',
        delete_char       = '<BS>',
        move_down  = '<C-j>',
        move_up    = '<C-k>',
        refine        = '<C-r>',
        stop = '<Esc>',
        toggle_preview = '<C-p>',
        scroll_down  = '<Down>',
        scroll_left  = '<Left>',
        scroll_right = '<Right>',
        scroll_up    = '<Up>',
        choose_marked     = '',
        delete_char_right = '',
        delete_left       = '',
        delete_word       = '',
        mark     = '',
        mark_all = '',
        move_start = '',
        paste = '',
        refine_marked = '',
        toggle_info    = '',
    },
    source = {
        items = nil,
        name = nil,
        cwd = nil,
        match = nil,
        show = pick.default_show,
        preview = nil,
        choose = nil,
        choose_marked = nil,
    },
    options = {content_from_bottom = false, use_cache = false,},
    window = {config = win_config, prompt_cursor = '█', prompt_prefix = '> ',},
})

-- start page
local starter = require('mini.starter')
starter.setup({
    autoopen = true,
    evaluate_single = false,
    items = {starter.sections.builtin_actions()},
    header = [[
╭━━━╮    ╭╮  ╭╮    ╭━━━╮     ╭╮╭━╮╭━╮   ╭╮ ╭╮       ╭╮╭━━━┳╮
┃╭━╮┃    ┃╰╮╭╯┃    ┃╭━━╯     ┃┃┃┃╰╯┃┃   ┃┃ ┃┃      ╭╯╰┫╭━╮┃┃
┃┃ ╰╋━━┳━╋╮╰╯╭┻━┳╮╭┫╰━━┳━━┳━━┫┃┃╭╮╭╮┣╮ ╭┫╰━╯┣━━┳━━┳┻╮╭┻╯╭╯┃┃
┃┃ ╭┫╭╮┃╭╮╋╮╭┫╭╮┃┃┃┃╭━━┫┃━┫┃━┫┃┃┃┃┃┃┃┃ ┃┃╭━╮┃┃━┫╭╮┃╭┫┃  ┃╭┻╯
┃╰━╯┃╭╮┃┃┃┃┃┃┃╰╯┃╰╯┃┃  ┃┃━┫┃━┫╰┫┃┃┃┃┃╰━╯┃┃ ┃┃┃━┫╭╮┃┃┃╰╮ ╭╮╭╮
╰━━━┻╯╰┻╯╰╯╰╯╰━━┻━━┻╯  ╰━━┻━━┻━┻╯╰╯╰┻━╮╭┻╯ ╰┻━━┻╯╰┻╯╰━╯ ╰╯╰╯
                                    ╭━╯┃
                                    ╰━━╯
    ]],
    footer = "",
    content_hooks = nil,
    query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
    silent = true,
})

-- utility
require('mini.extra').setup()
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.trailspace').setup()
require('mini.animate').setup()
require('mini.cursorword').setup({delay = 500})
require('mason').setup()
require('mason-lspconfig').setup({ensure_installed = servers})
require('mini.completion').setup()
require("dap-python").setup("python")
require('nvim-treesitter.configs').setup({
    ensure_installed = {"python", "bash", "json", "toml", "xml", "yaml"},
    sync_install = true,
    auto_install = true,
    highlight = {enable = true},
})
require("ibl").setup({scope = {enabled = false}})
require('mini.indentscope').setup({
    draw = {
        delay = 250,
        -- animation = require('mini.indentscope').gen_animation.quadratic({easing = 'out', duration = 500, unit = 'total'}),
        animation = require('mini.indentscope').gen_animation.none(),
        priority = 2,
    },
    mappings = {},
    options = {border = 'both', indent_at_cursor = true, try_as_border = false,},
    symbol = '>',
})
require('mini.splitjoin').setup({
    mappings = {toggle = '<leader>tas', split = '', join = '',},
    detect = {brackets = nil, separator = ',', exclude_regions = nil,},
    split = {hooks_pre = {}, hooks_post = {},},
    join = {hooks_pre = {}, hooks_post = {},},
})
require('mini.statusline').setup({
    content = {
        active = function()
            return MiniStatusline.combine_groups({
                {hl = 'StatusLine', strings = {'%{mode()} %t %m %r %h %w'}},
                '%=',
                {hl = 'MatchParen', strings = {'%c %y'}},
            })
        end,
        inactive = function()
            return MiniStatusline.combine_groups({
                {hl = 'CursorLineNr', strings = {'%t %m'}},
                '%=',
                {hl = 'MatchParen', strings = {'%y'}},
            })
        end,
    },
    use_icons = false,
    set_vim_settings = true,
})
