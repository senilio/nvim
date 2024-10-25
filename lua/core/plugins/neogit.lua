local M = {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  opts = {
    disable_signs = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = false,
    disable_insert_on_commit = "auto",
    graph_style = "ascii",

    -- customize displayed signs
    signs = {
      -- { CLOSED, OPENED }
      section = { ">", "v" },
      item = { ">", "v" },
      hunk = { "", "" },
    },
    integrations = { diffview = true },
    -- override/add mappings
    mappings = {
      -- modify status buffer mappings
      status = {
        -- Adds a mapping with "B" as key that does the "BranchPopup" command
        -- ["B"] = "BranchPopup",
        -- ["C"] = "CommitPopup",
        -- ["P"] = "PullPopup",
        -- ["S"] = "Stage",
        -- ["D"] = "Discard",
        -- Removes the default mapping of "s"
        -- ["s"] = "",
      },
    },
  },
}

return M
