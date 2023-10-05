require("settings.remap")
require("settings.set")
require("settings.theme")
require("settings.debug")
require('hologram').setup{
    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}
print("Loaded settings.remap")
-- print(vim.inspect(vim.version()))
