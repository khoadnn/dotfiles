-- use 24-bit RGB color
require("rose-pine").setup({ dark_variant = "moon", styles = { italic = false } })
vim.cmd.colorscheme("rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
