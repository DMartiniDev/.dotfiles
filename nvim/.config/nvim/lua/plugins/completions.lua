-- nvim-cmp is responsible for opening a window for completion.
-- The data within the window is driven by luasnip and friendly-snippets.
-- When an item is selected, it's completed by cmp_luasnip.
-- We can add more sources to our snippet completion configuration. For example
-- cmp-nvim-lsp. It is a source for neovim's built-in language server client.
-- It will reach to LSPs attached to the current buffer and ask it for
-- completion recommendations.
return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
    config = function()
      local ls = require('luasnip')
      local extras = require("luasnip.extras")
      local fmtR = require("luasnip.extras.fmt")

      local s = ls.snippet        -- Used to add new snippets
      local t = ls.text_node      -- Used to add text to our snippets
      local i = ls.insert_node    -- Used to add jump points to our snippets
      local rep = extras.rep      -- Used to repeat text for a given index
      local fmt = fmtR.fmt        -- Used for multiline snippets (Format function)
      local c = ls.choice_node    -- Used to add multiple choices to our snippets
      local f = ls.function_node  -- Used to add functions to our snippets
      local d = ls.dynamic_node   -- Like 'f' but returns 'sn' instead of string
      local sn = ls.snippet_node  -- Like 's' but without a name
      
      ls.setup({
        update_events = "TextChangedI"
      })
      ls.add_snippets("all", {
        s("dmc", {
        t('David Martinez Carrasco')
        }),
      })
    end
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				-- Define the completion engine to be used
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				-- Define how the completion window looks like
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				-- Define keymaps to use with the completion functionality
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),

				-- Sources to be used
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
