local PippiPlug = require'pippi.plug'

return PippiPlug.new({
    plugs = {
        ['savq/melange'] = {}
    },
    variable = {
        ['o'] = {
            ['termguicolors'] = true
        }
    },
    callback = function ()
        vim.cmd('colorscheme melange')
    end
})
