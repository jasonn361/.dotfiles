return {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",

	config = function()
		require("lspsaga").setup({
			-- keybinds for navigation in lspsaga window
			scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
			-- use enter to open file with definition preview
			definition = {
				edit = "<CR>",
			},
			ui = {
				title = true,
				border = "rounded",
				code_action = "",
				colors = {
					normal_bg = "#022746",
				},
			},
			code_action = {
				num_shortcut = false,
			},
			lightbulb = {
				enable = true,
				enable_in_insert = false,
				sign = true,
				sign_priority = 50,
				virtual_text = false,
			},
		})
	end,
}
