return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                auto_install = true,
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "jdtls",
                    "pyright",
                    "cssls",
                    "tailwindcss",
                    "emmet_ls",
                    "html",
                    "ts_ls",
                    "eslint",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- ✅ Disable formatting from some LSPs
            local on_attach = function(client, bufnr)
                if client.name == "html" or client.name == "cssls" or client.name == "emmet_ls" then
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end
            end

            -- Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- C/C++
            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- javasciprt server
            -- lspconfig.ts_ls.setup({
            -- 	capabilities = capabilities,
            -- 	on_attach = on_attach,
            -- })

            -- Java (optional if using jdtls separately)
            lspconfig.jdtls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- Python
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- CSS
            lspconfig.cssls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    css = { validate = true },
                    scss = { validate = true },
                    less = { validate = true },
                    provideFormatter = true,
                },
                filetypes = { "css", "scss", "less", "html" },
            })

            -- Tailwind
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- HTML
            lspconfig.html.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "htm", "handlebars" },
                settings = {
                    html = {
                        suggest = {
                            html5 = true,
                            classAttribute = true,
                            styleAttribute = true,
                        },
                    },
                },
            })

            -- Emmet
            lspconfig.emmet_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "css", "javascriptreact", "typescriptreact", "htm", "handlebars" },
                settings = {
                    html = {
                        options = {
                            ["bem.enabled"] = true,
                        },
                    },
                },
            })

            -- LSP Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
