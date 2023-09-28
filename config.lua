-- install plugins
lvim.plugins = {
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  'nvim-lua/plenary.nvim',
  'antoinemadec/FixCursorHold.nvim',
  'nvim-neotest/neotest',
  'nvim-neotest/neotest-python',
  'mfussenegger/nvim-dap-python',
  'aserowy/tmux.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons'
}



-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

-- treesitter
vim.opt.termguicolors = true


-- vim settings
vim.cmd([[set relativenumber]])
vim.opt.clipboard='unnamedplus'

vim.api.nvim_set_keymap("v",'y','"+y',{noremap=true})




