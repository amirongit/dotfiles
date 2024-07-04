require('mini.splitjoin').setup(
    {
        mappings = {
            toggle = '<leader>tas',
            split = '',
            join = '',
        },
        detect = {
            brackets = nil,
            separator = ',',
            exclude_regions = nil,
        },
        split = {
            hooks_pre = {},
            hooks_post = {},
        },
        join = {
            hooks_pre = {},
            hooks_post = {},
        },
    }
)
