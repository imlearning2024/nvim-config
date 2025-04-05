-- return{
--     "lukas-reineke/indent-blankline.nvim",
--     config = function()
--         local indent_blankline = require("ibl")
--
--         indent_blankline.setup({
--             indent = { char = "│" },
--             scope = { enabled = true },
--         })
--
--         -- Enable indent lines only for HTML files
--         vim.api.nvim_create_autocmd("FileType", {
--             pattern = "*",
--             callback = function()
--                 if vim.bo.filetype == "html" then
--                     vim.cmd("IBLEnable")  -- Enable for HTML
--                 else
--                     vim.cmd("IBLDisable") -- Disable for other files
--                 end
--             end,
--         })
--     end,
-- }
--
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local ibl = require("ibl")

    -- Set up IBL with basic config
    ibl.setup({
      indent = { char = "│" },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
    })

    -- Only enable indent lines in HTML
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "FileType" }, {
      pattern = "*.html",
      callback = function()
        vim.defer_fn(function()
          vim.cmd("IBLEnable")
        end, 100) -- slight delay to avoid race with LSP/TS
      end,
    })

    -- Disable indent lines in non-HTML files
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "FileType" }, {
      pattern = "*",
      callback = function()
        if vim.bo.filetype ~= "html" then
          vim.defer_fn(function()
            vim.cmd("IBLDisable")
          end, 100)
        end
      end,
    })

    -- Refresh IBL after insert mode or text changes (prevents disappearing)
    vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "TextChangedI", "BufWritePost" }, {
      pattern = "*.html",
      callback = function()
        vim.cmd("IndentBlanklineRefresh")
      end,
    })
  end,
}

