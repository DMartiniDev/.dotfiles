return {
  "brenoprata10/nvim-highlight-colors",
  config = function()
    local hc = require("nvim-highlight-colors")
    hc.setup({
      render = "background",
    })
    vim.keymap.set("n", "<leader>hc", function()
      hc.toggle()
    end)
  end,
}
