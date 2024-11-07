local M = {
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>-",
      function()
        require("yazi").yazi()
      end,
      desc = "Open the file manager",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open the file manager in nvim's working directory",
    },
  },
  ---@type YaziConfig
  opts = {
    floating_window_scaling_factor = 0.90,
    open_for_directories = false,
    yazi_floating_window_border = "single",
    hooks = {
      yazi_opened_multiple_files = function(chosen_files, config, state)
        -- Iterate over the selected files
        for _, file in ipairs(chosen_files) do
          -- Open each file in a new buffer
          vim.api.nvim_command("e " .. file)
        end
      end,
    },
  },
}

return M
