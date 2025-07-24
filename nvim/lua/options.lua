-- set default regexp engine to nfa
vim.opt.regexpengine = 2
-- do not use swapfile for buffer
vim.opt.swapfile = true
-- show matching brackets
vim.opt.showmatch = true
-- ignore case in search patterns
vim.opt.ignorecase = true
-- override the 'ignorecase' option if the search pattern contains upper case characters
vim.opt.smartcase = true
-- preferred split behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true
-- reduce update time for faster response
vim.opt.updatetime = 100
-- enable undo history
vim.opt.undofile = true
-- all folds are open by default
vim.opt.foldenable = false
-- set the window title
vim.opt.title = true
-- use visual bell instead of beeping
vim.opt.visualbell = true
-- enable list mode that set the characters for the invisibles
vim.opt.list = true
-- string to put at the start of lines that have been wrapped
vim.opt.showbreak = "+++ "
-- set default indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftround = true
-- disable vim providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
