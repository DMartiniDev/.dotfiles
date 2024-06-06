return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- Set colorscheme
    vim.cmd.colorscheme "catppuccin"
  end
}
