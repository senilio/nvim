local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- "hrsh7th/cmp-cmdline",
    "f3fora/cmp-spell",
    "hrsh7th/cmp-calc",
    -- "lukas-reineke/cmp-rg",
  },
  config = function()
    -- Setup nvim-cmp.
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          with_text = true,
          maxwidth = 50,
          mode = "symbol",
          menu = {
            buffer = "BUF",
            rg = "RG",
            nvim_lsp = "LSP",
            path = "PATH",
            luasnip = "SNIP",
            calc = "CALC",
            spell = "SPELL",
            emoji = "EMOJI",
          },
        }),
      },
      experimental = { ghost_text = false },
      view = {
        docs = {
          auto_open = false,
        },
      },
      window = {
        completion = cmp.config.window.bordered({}),
        documentation = {},
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp" },
        -- { name = "buffer", keyword_length = 5 },
        -- { name = "luasnip" },
        { name = "calc" },
        { name = "emoji" },
        { name = "spell" },
        { name = "path" },
        { name = "rg", keyword_length = 5 },
      },
    })

    -- Use buffer source for `/`.
    cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })

    -- Use cmdline & path source for ':'.
    cmp.setup.cmdline(":", {
      sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })

    -- Set up lspconfig.
    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- require("lspconfig")["terraformls"].setup({
    --   -- capabilities = capabilities,
    -- })
  end,
}

return M
