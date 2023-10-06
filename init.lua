-- References to ./lua/
-- Plugin management via Lazy
require("core.lazy")
-- Vim mappings, see lua/config/which.lua for more mappings
require("core.mappings")
-- All non plugin related (vim) options
require("core.options")
-- Vim autocommands/autogroups
require("core.autocmd")
