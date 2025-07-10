require("settings.remap")
require("settings.set")
require("settings.theme")
require("settings.debug")
require('hologram').setup{
    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}
print("Loaded settings.remap")
-- require("mini").setup()
-- require('mini.surround').setup()
-- require("after.plugin.mini")
-- mappings = { 
--     add = 'sa', -- Add surrounding in Normal and Visual modes
--     delete = 'sd', -- Delete surrounding
--     find = 'sf', -- Find surrounding (to the right)
--     find_left = 'sF', -- Find surrounding (to the left)
--     highlight = 'sh', -- Highlight surrounding
--     replace = 'sr', -- Replace surrounding
--     update_n_lines = 'sn', -- Update `n_lines`

--     suffix_last = 'l', -- Suffix to search with "prev" method
--     suffix_next = 'n', -- Suffix to search with "next" method
--    },
-- })
-- print(vim.inspect(vim.version()))
-- Put this at the top of 'init.lua'
