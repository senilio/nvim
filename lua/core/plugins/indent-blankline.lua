local M = {
	"lukas-reineke/indent-blankline.nvim",
	tag = "v2.20.8",
	event = "BufReadPre",
	config = function()
		require("indent_blankline").setup({
			indentLine_enabled = 1,
			char = "▏",
			filetype_exclude = {
				"startify",
				"dashboard",
				"dotooagenda",
				"log",
				"fugitive",
				"gitcommit",
				"vimwiki",
				"markdown",
				"json",
				"txt",
				"vista",
				"help",
				"todoist",
				"NvimTree",
				"peekaboo",
				"git",
				"TelescopePrompt",
				"undotree",
				"flutterToolsOutline",
				"", -- for all buffers without a file type
			},
			buftype_exclude = { "terminal", "nofile" },
			show_trailing_blankline_indent = true,
			show_first_indent_level = false,
			show_current_context = true,
			char_list = { "|", "¦", "┆", "┊" },
			space_char = " ",
			context_patterns = {
				"class",
				"function",
				"method",
				"block",
				"list_literal",
				"selector",
				"^if",
				"^table",
				"if_statement",
				"while",
				"for",
			},
		})
	end,
}

return M