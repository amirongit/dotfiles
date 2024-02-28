require('pckr').add(
    {
        { 'rcarriga/nvim-dap-ui',         requires = { 'mfussenegger/nvim-dap' } },
        { 'mfussenegger/nvim-dap-python', requires = { 'mfussenegger/nvim-dap' } }
    }
)

local dap = require("dap")
local dapui = require("dapui")

-- settings
require("dap-python").setup("python")

dapui.setup(
    {
        controls = {
            element = "repl",
            enabled = false,
        },
        element_mappings = {},
        expand_lines = false,
        floating = {
            border = "single",
            mappings = {
                close = { "q", "<Esc>" }
            }
        },
        force_buffers = true,
        icons = {
            collapsed = "",
            current_frame = "",
            expanded = ""
        },
        layouts = { {
            elements = { {
                id = "breakpoints",
                size = 0.15
            }, {
                id = "stacks",
                size = 0.15
            }, {
                id = "watches",
                size = 0.70
            } },
            position = "left",
            size = 40
        }, {
            elements = { {
                id = "repl",
                size = 0.7
            }, {
                id = "console",
                size = 0.3
            } },
            position = "bottom",
            size = 10
        } },
        mappings = {
            edit = "e",
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            repl = "r",
            toggle = "t"
        },
        render = {
            indent = 1,
            max_value_lines = 100
        }
    }
)

dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close
dap.adapters.coreclr = {
    type = 'executable',
    command = 'netcoredbg',
    args = { '--interpreter=vscode' }
}
dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('DLL: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
    },
}

vim.fn.sign_define('DapBreakpoint', { text = '●' })
vim.fn.sign_define('DapBreakpointCondition', { text = '◍', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '◉', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '➲', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '○', texthl = 'red', linehl = '', numhl = '' })

-- keymaps
vim.keymap.set("n", "<leader>brk", "<CMD>DapToggleBreakpoint<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbc", "<CMD>DapContinue<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbi", "<CMD>DapStepInto<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbo", "<CMD>DapStepOut<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbn", "<CMD>DapStepOver<CR>", { silent = true })
vim.keymap.set("n", "<leader>dbx", "<CMD>DapTerminate<CR>", { silent = true })
