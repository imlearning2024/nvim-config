return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,
                --
                -- -- Web (JS, TS, HTML, CSS, etc.)
                null_ls.builtins.formatting.prettier,
                --
                -- -- C/C++
                null_ls.builtins.formatting.clang_format,
                --
                -- -- JS/TS alternative (modern)
                -- -- null_ls.builtins.formatting.biome,
                --
                -- -- Shell
                null_ls.builtins.formatting.shfmt,
                --
                -- -- Optionals (uncomment if needed)
                -- -- null_ls.builtins.formatting.ast_grep,
                -- null_ls.builtins.diagnostics.cpplint,
                -- null_ls.builtins.diagnostics.shellcheck,
            },
        })

        -- Format on <leader>gf
        -- vim.keymap.set("n", "<leader>gf", function()
        --   vim.lsp.buf.format({ async = true })
        -- end, { desc = "Format File" })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
