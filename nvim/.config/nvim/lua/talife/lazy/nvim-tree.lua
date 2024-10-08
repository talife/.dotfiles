 return {
    "nvim-tree/nvim-tree.lua",

    tag = "v1.5.0",

    config = function()
        local tree = require('nvim-tree')
        tree.setup({
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
        })

        vim.keymap.set('n', '<leader>t', function() vim.cmd [[NvimTreeToggle]] end)
    end
}

