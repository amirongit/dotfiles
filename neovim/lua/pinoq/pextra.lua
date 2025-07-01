local mn_extra = require('mini.extra')
local mn_git = require('mini.git')


mn_extra.setup()
mn_git.setup({
    job = {
        git_executable = 'git',
        timeout = 30000,
    },
    command = {
        split = 'auto',
    },
})
