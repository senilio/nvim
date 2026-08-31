local api = vim.api

--- Remove trailing whitespace and blank lines on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  group = TrimWhiteSpaceGrp,
  callback = function(ev)
    local buf = ev.buf
    if not vim.bo[buf].modifiable or vim.bo[buf].buftype ~= "" then
      return
    end

    local current_buf = api.nvim_get_current_buf()
    local view = current_buf == buf and vim.fn.winsaveview() or nil
    local markdown = vim.bo[buf].filetype == "markdown"
    local line_count = api.nvim_buf_line_count(buf)

    for lnum, line in ipairs(api.nvim_buf_get_lines(buf, 0, -1, false)) do
      local trimmed = line:gsub("[ \t]+$", function(space)
        local slashes = line:sub(1, #line - #space):match("\\+$")
        if markdown and slashes and #slashes % 2 == 1 and #space == 1 then
          return space
        end
        if markdown and line:match("%S") and #space >= 2 and space:match("^ +$") then
          return "  "
        end
        return ""
      end)
      if trimmed ~= line then
        api.nvim_buf_set_lines(buf, lnum - 1, lnum, false, { trimmed })
      end
    end

    while line_count > 1 do
      local last_line = api.nvim_buf_get_lines(buf, line_count - 1, line_count, false)[1]
      if not last_line:match("^%s*$") then
        break
      end
      api.nvim_buf_set_lines(buf, line_count - 1, line_count, false, {})
      line_count = line_count - 1
    end
    if view then
      vim.fn.winrestview(view)
    end
  end,
})

local formatOptionsGrp = api.nvim_create_augroup("FormatOptions", { clear = true })
api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  group = formatOptionsGrp,
  callback = function(ev)
    vim.bo[ev.buf].formatoptions = vim.bo[ev.buf].formatoptions:gsub("[cro]", "")
  end,
})

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  group = yankGrp,
  callback = function()
    pcall(vim.hl.hl_op)
  end,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd(
  "BufReadPost",
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- windows to close with "q"
api.nvim_create_autocmd(
  "FileType",
  { pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Detect tpl and j2
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.tpl" }, command = "set filetype=tpl" })
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.j2" }, command = "set filetype=jinja" })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md" }, command = "setlocal spell" })

-- fix terraform and hcl comment string
api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "# %s"
  end,
  pattern = { "terraform", "terraform-vars", "opentofu", "opentofu-vars", "hcl" },
})
