local dap = require("dap")
local dapui = require("dapui")
local dap_py = require("dap-python")

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
    floating = { border = "single", mappings = { close = { "q", "<Esc>" } } },
    force_buffers = true,
    icons = { collapsed = "", current_frame = "", expanded = "" },
    layouts = {
        {
            elements = {
                { id = "breakpoints", size = 0.20 },
                { id = "stacks",      size = 0.20 },
                { id = "watches",     size = 0.60 }
            },
            position = "left",
            size = 40
        },
        {
            elements = { { id = "repl", size = 0.5 }, { id = "console", size = 0.5 } },
            position = "bottom",
            size = 10
        }
    },
    mappings = {
        edit = "e",
        expand = "<CR>",
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
    render = { indent = 1, max_value_lines = 100 }
})
dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close
dap_py.setup("uv")
vim.keymap.set("n", "<leader>brk", "<CMD>DapToggleBreakpoint<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbc", "<CMD>DapContinue<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbi", "<CMD>DapStepInto<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbo", "<CMD>DapStepOut<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbn", "<CMD>DapStepOver<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbx", "<CMD>DapTerminate<CR>", { silent = true })
vim.fn.sign_define("DapBreakpoint", { text = "●" })
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "◍", texthl = "red", linehl = "", numhl = "" }
)
vim.fn.sign_define("DapLogPoint", { text = "◉", texthl = "red", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➲", texthl = "red", linehl = "", numhl = "" })
vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "○", texthl = "red", linehl = "", numhl = "" }
)
