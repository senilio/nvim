local o = vim.opt
local wo = vim.wo
local fn = vim.fn

vim.cmd("set inccommand=split")

-- o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.background = "dark"
o.backup = false -- creates a backup file
o.cmdheight = 0 -- space for displaying messages/commands
o.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
o.conceallevel = 0 -- so that `` is visible in markdown files
o.cursorline = true -- highlight the current line
o.dir = fn.stdpath("data") .. "/swp" -- swap file directory
o.expandtab = false -- convert tabs to spaces
o.fileencoding = "utf-8" -- the encoding written to a file
o.foldenable = false -- disable folding; enable with zi
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldmethod = "expr"
o.grepprg = "rg --hidden --vimgrep --smart-case --"
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam cursor in insert mode
o.history = 500 -- Use the 'history' option to set the number of lines from command mode that are remembered.
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.laststatus = 3
o.lazyredraw = false -- do not redraw screen while running macros
o.listchars = "eol:¬,tab:> ,trail:~,extends:>,precedes:<,space:␣"
o.mouse = ""
o.number = true
o.relativenumber = false
o.scrolloff = 3 -- Minimal number of screen lines to keep above and below the cursor
o.shiftwidth = 4 -- the number of spaces inserted for each indentation
o.shortmess = o.shortmess + "I" -- prevent "pattern not found" messages
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 0 -- always show tabs
o.sidescrolloff = 5 -- The minimal number of columns to scroll horizontally
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.swapfile = true -- enable/disable swap file creation
o.tabstop = 4 -- how many columns a tab counts for
o.termguicolors = true -- set term gui colors (most terminals support this)
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete
o.undodir = fn.stdpath("data") .. "/undodir" -- set undo directory
o.undofile = true -- enable/disable undo file creation
o.updatetime = 100 -- faster completion
o.wildignorecase = true -- When set case is ignored when completing file names and directories
o.wildmenu = true
o.wildmode = "full"
wo.colorcolumn = "99999"
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**
]]
vim.cmd("highlight Normal guibg=#000000")
vim.cmd("highlight NotifyBackground guibg=#000000")
vim.cmd("colorscheme github_dark")

-- Sort
vim.cmd([[
  nnoremap <silent> sa <Cmd>Sort<CR>
  vnoremap <silent> sa <Esc><Cmd>Sort<CR>
  nnoremap <silent> sd <Cmd>Sort!<CR>
  vnoremap <silent> sd <Esc><Cmd>Sort!<CR>
]])

vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
