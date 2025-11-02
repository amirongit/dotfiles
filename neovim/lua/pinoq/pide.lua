local vscode = require('vscode')

vim.cmd('cnoreabbrev bd Tabclose')
vim.keymap.set('n', '<leader>for',
    function()
        vscode.action('editor.action.formatDocument')
        vscode.action('editor.action.organizeImports')
    end
)
vim.keymap.set('n', '<leader>hov',
    function()
        vscode.action('editor.action.showHover')
    end
)
vim.keymap.set('n', '<leader>ref',
    function()
        vscode.action('editor.action.referenceSearch.trigger')
    end
)
vim.keymap.set('n', '<leader>imp',
    function()
        vscode.action('editor.action.peekImplementation')
    end
)
vim.keymap.set('n', '<leader>tdf',
    function()
        vscode.action('editor.action.peekTypeDefinition')
    end
)
vim.keymap.set('n', '<leader>dec',
    function()
        vscode.action('editor.action.peekDeclaration')
    end
)
vim.keymap.set('n', '<leader>def',
    function()
        vscode.action('editor.action.peekDefinition')
    end
)
vim.keymap.set('n', '<leader>dia',
    function()
        vscode.action('workbench.action.tasks.toggleProblems')
    end
)
vim.keymap.set('n', '<leader>fnd',
    function()
        vscode.action('workbench.action.quickOpen')
    end
)
vim.keymap.set('n', '<leader>trm',
    function()
        vscode.action('editor.action.trimTrailingWhitespace')
    end
)
vim.keymap.set('n', '<leader>ren',
    function()
        vscode.action('editor.action.rename')
    end
)
vim.keymap.set('n', '<leader>bar',
    function()
        vscode.action('workbench.action.toggleSidebarVisibility')
    end
)
vim.keymap.set('n', '<leader>ter',
    function()
        vscode.action('workbench.action.terminal.toggleTerminal')
    end
)
