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
    dashboard.button("hst", "> History", ":History<CR>"),
    dashboard.button("fnd", "> Files", ":Files<CR>"),
    dashboard.button("q", "> Quit", ":qa<CR>")
}

require('alpha').setup(dashboard.config)
