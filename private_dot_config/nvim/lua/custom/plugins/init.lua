return {
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })
    end,
  },
  { "mbbill/undotree",
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>u"] = { ":UndotreeToggle<cr>", "Undotree" },
      })
    end,
  },
}
