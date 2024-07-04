require('mini.extra').setup()

pick = require('mini.pick')

-- settings
local win_config = function()
    height = math.floor(0.618 * vim.o.lines)
    width = math.floor(0.618 * vim.o.columns)
    return {
        anchor = 'NW', height = height, width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end

pick.setup(
    {
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
            choose_marked     = '',
            delete_char_right = '',
            delete_left       = '',
            delete_word       = '',
            mark     = '',
            mark_all = '',
            move_start = '',
            paste = '',
            refine_marked = '',
            scroll_down  = '',
            scroll_left  = '',
            scroll_right = '',
            scroll_up    = '',
            toggle_info    = '',
        },
        source = {
            items = nil,
            name  = nil,
            cwd   = nil,
            match   = nil,
            show    = pick.default_show,
            preview = nil,
            choose        = nil,
            choose_marked = nil,
        },
        options = {content_from_bottom = false, use_cache = false,},
        window = {
            config = win_config,
            prompt_cursor = '█',
            prompt_prefix = '> ',
        },
    }
)


-- keymaps
vim.keymap.set("n", "<leader>gre", ":Pick grep_live<CR>", { silent = true })
vim.keymap.set("n", "<leader>fnd", ":Pick files<CR>", { silent = true })
vim.keymap.set("n", "<leader>dia", ":Pick diagnostic<CR>", { silent = true })
vim.keymap.set("n", "<leader>def", ":Pick lsp scope='definition'<CR>", { silent = true })
vim.keymap.set("n", "<leader>dec", ":Pick lsp scope='declaration'<CR>", { silent = true })
vim.keymap.set("n", "<leader>tdf", ":Pick lsp scope='type_definition'<CR>", { silent = true })
vim.keymap.set("n", "<leader>imp", ":Pick lsp scope='implementation'<CR>", { silent = true })
vim.keymap.set("n", "<leader>ref", ":Pick lsp scope='references'<CR>", { silent = true })
vim.keymap.set("n", "<leader>dym", ":Pick lsp scope='document_symbol'<CR>", { silent = true })
vim.keymap.set("n", "<leader>wym", ":Pick lsp scope='workspace_symbol'<CR>", { silent = true })
