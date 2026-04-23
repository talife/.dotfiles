return {
    dir = "/home/talife/git/swap-param",
    config = function()
        local sp = require("swap-param")
        vim.keymap.set("n", "<leader>fr", sp.swap_with_next, { desc = "Global Parameter Swap" })
    end
}
