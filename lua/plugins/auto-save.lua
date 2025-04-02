return{
  "okuuva/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      execution_message = "Auto-Saving...",
      debounce_delay = 100,
      condition = function(buf)
        local fn = vim.fn
        return fn.getbufvar(buf, "&modifiable") == 1
      end,
    })
  end,
}

