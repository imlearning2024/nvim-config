-- return {
--     "numToStr/Comment.nvim",
--     lazy = false, -- Load on startup
--     config = function()
--         require("Comment").setup({
--             padding = true, -- Add space after comment
--             sticky = true, -- Cursor stays in place after commenting
--             toggler = {
--                 line = "gcc", -- Line comment toggle
--                 block = "gbc", -- Block comment toggle
--             },
--             opleader = {
--                 line = "gc", -- Line comment in visual mode
--                 block = "gb", -- Block comment in visual mode
--             },
--             mappings = {
--                 basic = true, -- Enable basic mappings
--                 extra = false, -- Disable extra mappings
--             },
--         })
--     end
-- }

return {
    "numToStr/Comment.nvim",
    lazy = false,
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring", -- Add this
    },
    config = function()
        -- Load ts-context-commentstring integration
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })

        require("Comment").setup({
            padding = true,
            sticky = true,
            toggler = {
                line = "gcc",
                block = "gbc",
            },
            opleader = {
                line = "gc",
                block = "gb",
            },
            mappings = {
                basic = true,
                extra = false,
            },
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(), -- this enables jsx aware comments
        })
    end
}



