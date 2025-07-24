-- enables the experimental lua module loader
vim.loader.enable()

-- loads lua modules
require("options")
require("keymaps")
require("lsp")
require("autocmds")
require("plugins")
