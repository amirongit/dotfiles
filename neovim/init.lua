local package_directory = vim.fn.stdpath('data') .. '/site'
local mini_directory_path = package_directory .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_directory_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
      'git', 'clone', '--filter=blob:none',
      'https://github.com/echasnovski/mini.nvim', mini_directory_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
end
local mn_deps = require('mini.deps')
mn_deps.setup({path = {package = package_directory}})
local add = mn_deps.add
local update = MiniDeps.update
local later = MiniDeps.later
add('RRethy/base16-nvim')
add('tpope/vim-fugitive')
add('tpope/vim-dadbod')
add('lukas-reineke/indent-blankline.nvim')
add('mfussenegger/nvim-dap-python')
add('rcarriga/nvim-dap-ui')
add('Decodetalkers/csharpls-extended-lsp.nvim')
add('b0o/schemastore.nvim')
add({source = 'mfussenegger/nvim-dap', depends = {{source = 'nvim-neotest/nvim-nio'}}})
add({
    source = 'mason-org/mason-lspconfig.nvim',
    depends = {
        {source = 'mason-org/mason.nvim'},
        {source = 'neovim/nvim-lspconfig'}
    }
})
add({
    source = 'nvim-treesitter/nvim-treesitter-context',
    depends = {{
        source = 'nvim-treesitter/nvim-treesitter',
        hooks = {post_checkout = function() vim.cmd('TSUpdate') end}
    }}
})
-- update(nil, {force = true})
local dap = require('dap')
local dapui = require('dapui')
local dap_py = require("dap-python")
local lspcfg = require('lspconfig')
local csls_ex = require('csharpls_extended')
local ibl = require('ibl')
local ibl_hooks = require("ibl.hooks")
local mason = require('mason')
local mason_lspcfg = require('mason-lspconfig')
local treesitter_cfg = require('nvim-treesitter.configs')
local treesitter_ctx = require('treesitter-context')
local schemastore = require('schemastore')
local mn_starter = require('mini.starter')
local mn_completion = require('mini.completion')
local mn_pick = require('mini.pick')
local mn_hipatterns = require('mini.hipatterns')
local mn_statusline = require('mini.statusline')
local mn_splitjoin = require('mini.splitjoin')
local mn_indentscope = require('mini.indentscope')
local mn_extra = require('mini.extra')
local mn_move = require('mini.move')
local mn_pairs = require('mini.pairs')
local mn_trailspace = require('mini.trailspace')
local mn_animate = require('mini.animate')
local mn_cursorword = require('mini.cursorword')
local mn_icons = require('mini.icons')
local mn_tabline = require('mini.tabline')
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
        return mn_pairs.cr()
    end
end
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.max_height = 25
    opts.max_width = 75
    -- opts.anchor_bias = 'top'
    opts.border = 'single'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
local win_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
        anchor = 'NW', height = height, width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end
lspcfg['lua_ls'].setup({})
lspcfg['csharp_ls'].setup({})
lspcfg['bashls'].setup({})
lspcfg['dockerls'].setup({})
lspcfg['yamlls'].setup({
    settings = {
        yaml = {
            schemaStore = {
                enable = false,
                url = "",
            },
            schemas = schemastore.yaml.schemas(),
        },
    },
})
lspcfg['ruff'].setup({})
lspcfg['pyright'].setup({
    settings = {
        pyright = {
            disableOrganizeImports = true,
            disableTaggedHints = true
        },
        python = {
            analysis = {
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        }
    }
})
lspcfg['taplo'].setup({})
lspcfg['jsonls'].setup({
    settings = {
        json = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
        },
    },
})
csls_ex.buf_read_cmd_bind()
dapui.setup({
    controls = {
        element = "repl",
        enabled = false,
        icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = ""
        }
    },
    element_mappings = {},
    expand_lines = false,
    floating = {border = "single", mappings = {close = {"q", "<Esc>"}}},
    force_buffers = true,
    icons = {collapsed = "", current_frame = "", expanded = ""},
    layouts = {{
            elements = {
                {id = "breakpoints", size = 0.20},
                {id = "stacks", size = 0.20},
                {id = "watches", size = 0.60}
            },
            position = "left",
            size = 40
        },
        {
            elements = {{id = "repl", size = 0.5}, {id = "console", size = 0.5}},
            position = "bottom",
            size = 10
    }},
    mappings = {
        edit = "e",
        expand = "<CR>",
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
    render = {indent = 1, max_value_lines = 100}
})
dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close
mn_pick.setup({
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
        show = nil,
        preview = nil,
        choose = nil,
        choose_marked = nil,
    },
    options = {content_from_bottom = false, use_cache = false,},
    window = {config = win_config, prompt_caret = '█', prompt_prefix = '> ',},
})
mn_completion.setup({
    delay = {completion = 100, info = 100, signature = 50},
    window = {
        info = {height = 25, width = 80, border = 'single'},
        signature = {height = 25, width = 80, border = 'single'},
    },
    lsp_completion = {
        source_func = 'completefunc',
        auto_setup = true,
        process_items = mn_completion.default_process_items,
    },
    mappings = {force_twostep = '<C-Space>',},
    set_vim_settings = true,
})
mn_starter.setup({
    autoopen = true,
    evaluate_single = false,
    items = {
        {
            {name = 'Blank', action = 'enew', section = 'Actions'},
            {name = 'Explore', action = 'Pick files', section = 'Actions'},
            {name = 'Quit', action = 'q', section = 'Actions'},
        }
    },
    header = [=[
from  queue  import  Queue  from  typing import Any from btree import Node type
Coordinate  = tuple[int, int] def visualize[T](root: Node[T]) -> None: val_coor
=  get_coordinates(root)  val_size = max(max(len(str(i[0])) for i in val_coor),
5)  grid_hei  =  (root_hei := get_height(root)) * 2 - 1 grid_mid = (grid_wid :=
2**root_hei)  //  2  grid = [[" " * val_size for _ in range(grid_wid)] for _ in
range(grid_hei)]  for  i  in  val_coor:  val,  y,  x  = i[0], abs(i[1][1]) * 2,
grid_mid - i[1][0] grid[y][x] = f'({str(val).rjust(val_size - 2, "_")})' if y <
grid_hei   -   1:   grid[y  +  1][x]  =  "/"  +  grid[y  +  1][x][1:-1]  +  "\"
print("\n".join(["".join(col)  for  col in grid])) def get_coordinates[T](root:
Node[T])  ->  set[tuple[T, Coordinate]]: q: Queue[tuple[Node[T], Coordinate]] =
Queue()  coordinates  = set() q.put((root, (0, 0))) while not q.empty(): node =
q.get()   coordinates.add((node[0].value,   node[1]))   left_height   =   2  **
(get_height(left)   -  1)  if  (left  :=  node[0].left)  is  not  None  else  0
right_height  = 2 ** (get_height(right) - 1) if (right := node[0].right) is not
None  else  0  height  =  max(left_height,  right_height)  if left is not None:
q.put((left,  (node[1][0]  +  height,  node[1][1]  - 1))) if right is not None:
q.put((right,  (node[1][0]  -  height, node[1][1] - 1))) return coordinates def
get_height(root:  Node[Any]  | None, current: int = 0) -> int: if root is None:
return   current   current  +=  1  return  max(get_height(root.left,  current),
get_height(root.right, current))
    ]=],
    footer = "",
    content_hooks = nil,
    query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
    silent = true,
})
mn_extra.setup()
mn_move.setup()
mn_pairs.setup()
mn_trailspace.setup()
mn_animate.setup()
mn_icons.setup()
mn_icons.tweak_lsp_kind('replace')
mn_cursorword.setup({delay = 500})
mason.setup()
mason_lspcfg.setup({
    automatic_enable = false,
    ensure_installed = {
        'lua_ls',
        'csharp-language-server',
        'bashls',
        'dockerls',
        'yamlls',
        'ruff',
        'pyright',
        'taplo',
        'jsonls'
    }
})
dap_py.setup("uv")
treesitter_cfg.setup({
    ensure_installed = {
        "python",
        "bash",
        "json",
        "toml",
        "xml",
        "yaml",
        "markdown",
        "markdown_inline",
        "vimdoc"
    },
    sync_install = true,
    auto_install = true,
    highlight = {enable = true},
})
treesitter_ctx.setup({
    enable = true,
    multiwindow = false,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 1,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = '─',
    zindex = 20,
    on_attach = nil,
})
local ibl_highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
ibl_hooks.register(ibl_hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
ibl.setup({scope = {enabled = false}, indent = {highlight = ibl_highlight}})
mn_indentscope.setup({
    draw = {
        delay = 250,
        priority = 2,
    },
    mappings = {},
    options = {border = 'both', indent_at_cursor = true, try_as_border = false,},
    symbol = '›',
})
mn_splitjoin.setup({
    mappings = {toggle = '<leader>tas', split = '', join = '',},
    detect = {brackets = nil, separator = ',', exclude_regions = nil,},
    split = {hooks_pre = {}, hooks_post = {},},
    join = {hooks_pre = {}, hooks_post = {},},
})
-- :source $VIMRUNTIME/syntax/hitest.vim
mn_statusline.setup({
    content = {
        active = function()
            local git           = mn_statusline.section_git({trunc_width = 40});
            local diff          = mn_statusline.section_diff({trunc_width = 75});
            local diagnostics   = mn_statusline.section_diagnostics({trunc_width = 75});
            local lsp           = mn_statusline.section_lsp({trunc_width = 75});
            local filename      = mn_statusline.section_filename({trunc_width = 120});
            local fileinfo      = mn_statusline.section_fileinfo({trunc_width = 120});
            local location      = mn_statusline.section_location({trunc_width = 75});

            return mn_statusline.combine_groups({
                -- {hl = 'TSVariable', strings = {'%{mode()} %t %m %r %h %w'}},
                {hl = 'TSVariable', strings = {filename, diff, '%r'}},
                '%=',
                {hl = 'TSTitle', strings = {git, location, lsp, diagnostics, fileinfo}},
            })
        end,
        inactive = function()
            return mn_statusline.combine_groups({
                {hl = 'CursorLineNr', strings = {'%t %m %y'}},
                '%=',
                {hl = 'MatchParen', strings = {'%y'}},
            })
        end,
    },
    use_icons = true,
    set_vim_settings = true,
})
mn_hipatterns.setup({
    highlighters = {
        ufixme = {pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme'},
        uhack = {pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'},
        utodo = {pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'},
        unote = {pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'},
        uwarning = {pattern = '%f[%w]()WARNING()%f[%W]', group = 'MiniHipatternsFixme'},
        fixme = {pattern = '%f[%w]()fixme()%f[%W]', group = 'MiniHipatternsFixme'},
        hack = {pattern = '%f[%w]()hack()%f[%W]',  group = 'MiniHipatternsHack'},
        todo = {pattern = '%f[%w]()todo()%f[%W]',  group = 'MiniHipatternsTodo'},
        note = {pattern = '%f[%w]()note()%f[%W]',  group = 'MiniHipatternsNote'},
        warning = {pattern = '%f[%w]()warning()%f[%W]', group = 'MiniHipatternsFixme'},
        hex_color = mn_hipatterns.gen_highlighter.hex_color(),
    }
})
mn_tabline.setup({
    show_icons = true,
    format = nil,
    tabpage_section = 'right',
})

-- vim.keymap.set("n", "H", "gT")
-- vim.keymap.set("n", "L", "gt")
vim.keymap.set("n", "H", ":bprevious<CR>", {silent = true})
vim.keymap.set("n", "L", ":bnext<CR>", {silent = true})
vim.keymap.set("n", "<leader>sex", ":Sexplore<CR>", {silent = true})
vim.keymap.set("n", "<leader>vex", ":Vexplore<CR>", {silent = true})
vim.keymap.set("n", "<leader>tex", ":Texplore<CR>", {silent = true})
vim.keymap.set(
    'i',
    '<Tab>',
    function()return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"end,
    {expr = true, silent = true}
)
vim.keymap.set(
    'i',
    '<S-Tab>',
    function()return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"end,
    {expr = true, silent = true}
)
vim.keymap.set("n", "<leader>hls", ":set hlsearch!<CR>", {silent = true})
vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', {expr = true, noremap = true})
vim.keymap.set('n', 'K', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'J', vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>res", ":LspRestart<CR>", {silent = true})
vim.keymap.set('n', '<leader>ren', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>doc', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>for', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>sig', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>act', vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>brk", "<CMD>DapToggleBreakpoint<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbc", "<CMD>DapContinue<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbi", "<CMD>DapStepInto<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbo", "<CMD>DapStepOut<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbn", "<CMD>DapStepOver<CR>", {silent = true})
vim.keymap.set("n", "<leader>dbx", "<CMD>DapTerminate<CR>", {silent = true})
vim.keymap.set(
    "n",
    "<leader>trm",
    function() vim.cmd('lua MiniTrailspace.trim()') end,
    {silent = true}
)
vim.keymap.set(
    "n",
    "<leader>cln",
    function() vim.cmd('lua MiniTrailspace.trim_last_lines()') end,
    {silent = true}
)
vim.keymap.set("n", "<leader>gre", ":Pick grep_live<CR>", {silent = true})
vim.keymap.set("n", "<leader>fnd", ":Pick files<CR>", {silent = true})
vim.keymap.set("n", "<leader>dia", ":Pick diagnostic<CR>", {silent = true})
vim.keymap.set("n", "<leader>def", ":Pick lsp scope='definition'<CR>", {silent = true})
vim.keymap.set("n", "<leader>dec", ":Pick lsp scope='declaration'<CR>", {silent = true})
vim.keymap.set("n", "<leader>buf", ":Pick buffers<CR>", {silent = true})
vim.keymap.set(
    "n",
    "<leader>tdf",
    ":Pick lsp scope='type_definition'<CR>",
    {silent = true}
)
vim.keymap.set(
    "n",
    "<leader>imp",
    ":Pick lsp scope='implementation'<CR>",
    {silent = true}
)
vim.keymap.set("n", "<leader>ref", ":Pick lsp scope='references'<CR>", {silent = true})
vim.keymap.set(
    "n",
    "<leader>dym",
    ":Pick lsp scope='document_symbol'<CR>",
    {silent = true}
)
vim.keymap.set(
    "n",
    "<leader>wym",
    ":Pick lsp scope='workspace_symbol'<CR>",
    {silent = true}
)

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
vim.opt.list = true
vim.opt.listchars = {
    tab = '→ ',
    trail = '܁',
    -- extends = '➔',
    -- precedes = '➔',
    space = '܁',
    eol = '↓',
}
vim.opt.fillchars = {eob = " ", fold = " "}
vim.opt.splitbelow = true
vim.opt.cp = false
vim.opt.number = true
vim.opt.relativenumber = true
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
vim.opt.cmdheight = 1
-- vim.opt.showtabline = 0
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
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 5
vim.opt.foldlevel = 1
vim.opt.foldcolumn = "0"
vim.opt.foldenable = false
vim.opt.virtualedit = "all"
vim.opt.backspace = "indent,eol,start"
vim.opt.shortmess:append("C")
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"
vim.opt.updatetime = 300
vim.opt.signcolumn = "number"
vim.opt.laststatus = 2
vim.opt.syntax = "on"
vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
})
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.ui.select = mn_pick.ui_select
vim.cmd("colorscheme base16-gruvbox-dark-hard")
vim.api.nvim_set_hl(0, 'LineNr', {})
vim.api.nvim_set_hl(0, 'SignColumn', {})
vim.api.nvim_set_hl(0, 'DiffAdd', {bg = 'darkcyan', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'DiffChange', {bg = 'darkmagenta', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'DiffDelete', {bg = 'darkred', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'CocWarningSign', {bg = 'brown', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'CocErrorSign', {bg = 'darkred', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'CocHintSign', {bg = 'lightblue', fg = 'white', bold = true})
vim.api.nvim_set_hl(0, 'TabLineFill', {fg = 'Gray', bg = 'bg'})
vim.api.nvim_set_hl(0, 'TabLine', {fg = 'Gray', bg = 'bg'})
vim.api.nvim_set_hl(0, 'TabLineSel', {fg = 'DarkYellow', bg = 'bg'})
vim.api.nvim_set_hl(0, 'NonText', {bold = false, italic = false, underline = false, fg = 'Gray'})
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', {fg = 'Gray', bold = true})
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbolOff', {fg = 'Gray', bold = true})
vim.api.nvim_set_hl(0, 'MiniCursorword', {underline = true})
vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', {})
vim.fn.sign_define('DapBreakpoint', {text = '●'})
vim.fn.sign_define(
    'DapBreakpointCondition',
    {text = '◍', texthl = 'red', linehl = '', numhl = ''}
)
vim.fn.sign_define('DapLogPoint', {text = '◉', texthl = 'red', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped', {text = '➲', texthl = 'red', linehl = '', numhl = ''})
vim.fn.sign_define(
    'DapBreakpointRejected',
    {text = '○', texthl = 'red', linehl = '', numhl = ''}
)
