return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require('nvim-treesitter')

        -- 1. Explicitly install your required parsers (Replaces `ensure_installed`)
        ts.install({
            "vimdoc", "javascript", "typescript", "c", "lua", "rust",
            "jsdoc", "bash", "go"
        })

        -- 2. Custom Parsers (Replaces `get_parser_configs`)
        -- Neovim now handles custom parsers natively via the vim.treesitter API.
        -- You may need to manually compile this via tree-sitter CLI if not found.
        vim.treesitter.language.register("templ", "templ")

        -- 3. Highlighting and Indentation (Replaces the `highlight` and `indent` blocks)
        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup("treesitter_setup", { clear = true }),
            callback = function(args)
                -- Start native treesitter highlighting
                pcall(vim.treesitter.start)

                -- Enable treesitter indentation
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        -- 4. Additional Vim Regex Highlighting for Markdown
        -- Because we aren't using the old plugin setup, you enforce this natively
        vim.api.nvim_create_autocmd('FileType', {
            pattern = "markdown",
            callback = function()
                vim.cmd("syntax on")
            end,
        })
    end
}
