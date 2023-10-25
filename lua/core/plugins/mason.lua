local tools = {
  -- Formatter
  "black",
  "prettier",
  "stylua",
  "shfmt",
  "rustfmt",
  "latexindent",
  -- Linter
  "eslint_d",
  "shellcheck",
  "tflint",
  "yamllint",
  "ruff",
  -- DAP
  "debugpy",
  "codelldb",
}

local M = {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim", module = "mason" },
  },
  config = function()
    -- install_root_dir = path.concat({ vim.fn.stdpath("data"), "mason" }),
    require("mason").setup()

    -- ensure tools (except LSPs) are installed
    local mr = require("mason-registry")
    local function install_ensured()
      for _, tool in ipairs(tools) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(install_ensured)
    else
      install_ensured()
    end

    -- install LSPs
    require("mason-lspconfig").setup()
  end,
}

return M
