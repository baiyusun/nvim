return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    ---@type false | "classic" | "modern" | "helix"
    preset = "helix",
    win = {
      -- no_overlap = true,
      title = false,
      width = 0.5,
    },
    -- stylua: ignore
    spec = {
      -- { "<leader>cc", group = "<CodeCompanion>", icon = "" },
      { "<leader>s",  group = "<Snacks>"                    },
      { "<leader>t",  group = "<Snacks> Toggle"             },
    },
    -- expand all nodes wighout a description
    expand = function(node)
      return not node.desc
    end,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
