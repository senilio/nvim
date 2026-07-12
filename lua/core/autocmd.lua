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

    local line_count = api.nvim_buf_line_count(buf)
    local last_line = api.nvim_buf_get_lines(buf, line_count - 1, line_count, false)[1]
    local trim_end = last_line:match("^%s*$") and line_count > 1

    local view = vim.fn.winsaveview()
    local markdown = vim.bo[buf].filetype == "markdown"
    local lnum = 1
    while lnum <= line_count do
      vim.fn.cursor(lnum, 0)
      lnum = vim.fn.search([[[ \t]\+$]], "Wc")
      if lnum == 0 then
        break
      end

      local line = api.nvim_buf_get_lines(buf, lnum - 1, lnum, false)[1]
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
      lnum = lnum + 1
    end

    while line_count > 1 do
      last_line = api.nvim_buf_get_lines(buf, line_count - 1, line_count, false)[1]
      if not last_line:match("^%s*$") then
        break
      end
      api.nvim_buf_set_lines(buf, line_count - 1, line_count, false, {})
      line_count = line_count - 1
    end
    vim.fn.winrestview(view)
  end,
})

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
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
  pattern = { "terraform", "hcl" },
})
