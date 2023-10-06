local o = vim.opt
local wo = vim.wo
local fn = vim.fn

vim.cmd("set inccommand=split")
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam cursor in insert mode
o.updatetime = 100 -- faster completion
o.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
o.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete
o.backup = false -- creates a backup file
o.swapfile = true -- enable/disable swap file creation
o.dir = fn.stdpath("data") .. "/swp" -- swap file directory
o.undofile = true -- enable/disable undo file creation
o.undodir = fn.stdpath("data") .. "/undodir" -- set undo directory
o.history = 500 -- Use the 'history' option to set the number of lines from command mode that are remembered.
-- o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.fileencoding = "utf-8" -- the encoding written to a file
o.conceallevel = 0 -- so that `` is visible in markdown files
o.number = true
o.relativenumber = false
o.cmdheight = 1 -- space for displaying messages/commands
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 2 -- always show tabs
o.laststatus = 3
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.expandtab = false -- convert tabs to spaces
o.shiftwidth = 4 -- the number of spaces inserted for each indentation
o.tabstop = 4 -- how many columns a tab counts for
o.termguicolors = true -- set term gui colors (most terminals support this)
o.cursorline = true -- highlight the current line
o.scrolloff = 3 -- Minimal number of screen lines to keep above and below the cursor
o.sidescrolloff = 5 -- The minimal number of columns to scroll horizontally
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.foldenable = false -- disable folding; enable with zi
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.listchars = "eol:¬,tab:> ,trail:~,extends:>,precedes:<,space:␣"
o.shortmess = o.shortmess + "c" -- prevent "pattern not found" messages
wo.colorcolumn = "99999"
o.wildmode = "full"
o.wildmenu = true
o.lazyredraw = true -- do not redraw screen while running macros
o.grepprg = "rg --hidden --vimgrep --smart-case --"
o.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
o.wildignorecase = true -- When set case is ignored when completing file names and directories
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
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]
vim.cmd("colorscheme ghdark")
vim.cmd("highlight Normal guibg=#000000")
vim.cmd("highlight EndOfBuffer ctermbg=NONE guibg=NONE")
vim.cmd("highlight IndentBlanklineChar cterm=nocombine ctermfg=0 gui=nocombine guifg=#333333")
vim.cmd("highlight IndentBlanklineSpaceChar cterm=nocombine ctermfg=0 gui=nocombine guifg=bg")
vim.cmd("highlight IndentBlanklineContextStart cterm=underline gui=underline guisp=#77bdfb")
vim.cmd("highlight IndentBlanklineSpaceCharBlankline cterm=nocombine ctermfg=0 gui=nocombine guifg=bg")
vim.cmd("highlight IndentBlanklineContextChar cterm=nocombine ctermfg=75 gui=nocombine guifg=#666666")
vim.cmd("highlight GitSignsCurrentLineBlame cterm=nocombine ctermfg=75 gui=nocombine guifg=#0ffcc1")