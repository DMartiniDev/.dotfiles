-- none-ls allows us to integrate CLI tools with LSP client in neovim (such as
-- formatters, linters and things like that).
--
-- none-ls is a community fork of null-ls. The fork was created once it was
-- announced that null-ls would be deprecated.
return {
	"nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim"
  },
	config = function()
		local null_ls = require("null-ls")

		-- Setup formatters, diagnostics (linting), completion...
		-- The tools used need to be installed separately using Mason
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Lua (formatting)
        -- null_ls.builtins.diagnostics.rubocop, - Ruby (linting)
        -- null_ls.builtins.formatting.rubocop, - Ruby (formatting)
        require("none-ls.diagnostics.eslint_d"), -- JavaScript (linting)
        null_ls.builtins.formatting.prettier, -- JavaScript (formatting)
        -- null_ls.builtins.formatting.isort, -- Python (formatting - Imports)
        -- null_ls.builtins.formatting.black, -- Python (formatting)
			},
		})

		-- Add keymaps
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
