 return {
    "nvim-tree/nvim-web-devicons",

    tag = "v0.100",

    config = function()
        local icons = require('nvim-web-devicons')
        icons.setup({})
    end
}

