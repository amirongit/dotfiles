local package_directory = vim.fn.stdpath("data") .. "/site"
local mini_directory_path = package_directory .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_directory_path) then
    vim.cmd("echo 'Installing `mini.nvim`' | redraw")
    local clone_cmd = {
        "git", "clone", "--filter=blob:none",
        "https://github.com/echasnovski/mini.nvim", mini_directory_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags ALL")
end
local mn_deps = require("mini.deps")
mn_deps.setup({ path = { package = package_directory } })
local add = mn_deps.add
local update = MiniDeps.update
local later = MiniDeps.later

add("mfussenegger/nvim-dap")
add("mfussenegger/nvim-dap-python")
add("rcarriga/nvim-dap-ui")
add("nvim-neotest/nvim-nio")

add("mason-org/mason.nvim")
add("neovim/nvim-lspconfig")
add("mason-org/mason-lspconfig.nvim")
add("Decodetalkers/csharpls-extended-lsp.nvim")
add("b0o/schemastore.nvim")
add("oribarilan/lensline.nvim")


add("RRethy/base16-nvim")
add("lukas-reineke/indent-blankline.nvim")

add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
    checkout = 'main',
    monitor = 'main',
})
add("nvim-treesitter/nvim-treesitter-context")

add("tpope/vim-dadbod")
-- update(nil, {force = true})
