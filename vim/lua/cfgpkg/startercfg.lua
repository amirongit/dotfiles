starter = require('mini.starter')


-- settings
starter.setup(
    {
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
    }
)
