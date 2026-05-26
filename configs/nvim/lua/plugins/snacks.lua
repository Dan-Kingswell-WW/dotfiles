return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>e",
        function()
          local picker = Snacks.picker.get({ source = "explorer" })[1]
          if picker and not picker.closed then
            picker:focus("list")
          else
            Snacks.explorer({ cwd = LazyVim.root() })
          end
        end,
        desc = "Focus Explorer",
      },
    },
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}
