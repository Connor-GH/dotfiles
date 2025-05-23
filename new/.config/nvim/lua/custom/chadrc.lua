---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "radium",
  transparency = true,
  theme_toggle = { "radium", "radium" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "minimal",
    -- round and block will work for minimal theme only
    separator_style = "block",
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
