require('pckr').add({ { 'goolord/alpha-nvim', requires = { 'nvim-tree/nvim-web-devicons' } } })

local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
    "╭━━━╮    ╭╮  ╭╮    ╭━━━╮     ╭╮╭━╮╭━╮   ╭╮ ╭╮       ╭╮╭━━━┳╮",
    "┃╭━╮┃    ┃╰╮╭╯┃    ┃╭━━╯     ┃┃┃┃╰╯┃┃   ┃┃ ┃┃      ╭╯╰┫╭━╮┃┃",
    "┃┃ ╰╋━━┳━╋╮╰╯╭┻━┳╮╭┫╰━━┳━━┳━━┫┃┃╭╮╭╮┣╮ ╭┫╰━╯┣━━┳━━┳┻╮╭┻╯╭╯┃┃",
    "┃┃ ╭┫╭╮┃╭╮╋╮╭┫╭╮┃┃┃┃╭━━┫┃━┫┃━┫┃┃┃┃┃┃┃┃ ┃┃╭━╮┃┃━┫╭╮┃╭┫┃  ┃╭┻╯",
    "┃╰━╯┃╭╮┃┃┃┃┃┃┃╰╯┃╰╯┃┃  ┃┃━┫┃━┫╰┫┃┃┃┃┃╰━╯┃┃ ┃┃┃━┫╭╮┃┃┃╰╮ ╭╮╭╮",
    "╰━━━┻╯╰┻╯╰╯╰╯╰━━┻━━┻╯  ╰━━┻━━┻━┻╯╰╯╰┻━╮╭┻╯ ╰┻━━┻╯╰┻╯╰━╯ ╰╯╰╯",
    "                                    ╭━╯┃                    ",
    "                                    ╰━━╯                    ",
}
dashboard.section.header.opts.hl = "Identifier"

dashboard.section.buttons.val = {
    dashboard.button("hst", "> History", ":FzfLua oldfiles<CR>"),
    dashboard.button("fnd", "> Files", ":FzfLua files<CR>"),
    dashboard.button("q", "> Quit", ":q<CR>")
}

require('alpha').setup(dashboard.config)
