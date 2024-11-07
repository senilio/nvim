-- References to ./lua/
-- Vim mappings, see lua/config/which.lua for more mappings
require("core.mappings")
-- Plugin management via Lazy
require("core.lazy")
-- All non plugin related (vim) options
require("core.options")
-- Vim autocommands/autogroups
require("core.autocmd")
