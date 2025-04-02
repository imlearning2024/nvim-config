return{
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        local indent_blankline = require("ibl")

        indent_blankline.setup({
            indent = { char = "│" },
            scope = { enabled = true },
        })

        -- Enable indent lines only for HTML files
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                if vim.bo.filetype == "html" then
                    vim.cmd("IBLEnable")  -- Enable for HTML
                else
                    vim.cmd("IBLDisable") -- Disable for other files
                end
            end,
        })
    end,
}

