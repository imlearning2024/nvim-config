return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 30, -- window size
			},
		})
		-- Increase visibility of the selection highlight
		vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#44475a", bold = true }) -- Brighter selection
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000" }) -- Keep the background black
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" }) -- Non-active window background
		vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#ff5555", fg = "#ffffff", bold = true }) -- Highlight title bar

		---key binding to toggle neotree
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", { noremap = true, silent = true })
	end,
}
