local mn_starter = require('mini.starter')
local mn_pick = require('mini.pick')

local win_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
        anchor = 'NW', height = height, width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end
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
    window = {config = win_config, prompt_caret = '█', prompt_prefix = ': ',},
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


vim.keymap.set("n", "<leader>gre", ":Pick grep_live<CR>", {silent = true})
vim.keymap.set("n", "<leader>fnd", ":Pick files<CR>", {silent = true})
vim.keymap.set("n", "<leader>dia", ":Pick diagnostic<CR>", {silent = true})
vim.keymap.set("n", "<leader>def", ":Pick lsp scope='definition'<CR>", {silent = true})
vim.keymap.set("n", "<leader>dec", ":Pick lsp scope='declaration'<CR>", {silent = true})
vim.keymap.set("n", "<leader>buf", ":Pick buffers<CR>", {silent = true})
vim.keymap.set("n", "<leader>tdf", ":Pick lsp scope='type_definition'<CR>", {silent = true})
vim.keymap.set("n", "<leader>imp", ":Pick lsp scope='implementation'<CR>", {silent = true})
vim.keymap.set("n", "<leader>ref", ":Pick lsp scope='references'<CR>", {silent = true})
vim.keymap.set("n", "<leader>dym", ":Pick lsp scope='document_symbol'<CR>", {silent = true})
vim.keymap.set("n", "<leader>wym", ":Pick lsp scope='workspace_symbol'<CR>", {silent = true})
vim.keymap.set("n", "<leader>sex", ":Sexplore<CR>", {silent = true})
vim.keymap.set("n", "<leader>vex", ":Vexplore<CR>", {silent = true})
vim.keymap.set("n", "<leader>tex", ":Texplore<CR>", {silent = true})

vim.ui.select = mn_pick.ui_select

vim.api.nvim_set_hl(0, 'MiniPickPrompt', {bg = 'none'})
