vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.g.mapleader = " "
vim.o.winborder = "rounded"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
-- vim.keymap.set('n', '<leader>wf', function()
-- 	vim.lsp.buf.format()
-- 	vim.cmd("write")
-- end)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "http://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/nvim-mini/mini.completion" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

local builtin = require('telescope.builtin')
require "oil".setup()
require('mini.completion').setup()

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>e', ":Oil<CR>")

require 'nvim-treesitter'.setup({
	ensure_installed = { "lua", "c", "cpp", "typescript", "javascript", "zig", "vim", "vimdoc", "query" },

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true
	},
})

vim.lsp.enable({ "lua_ls", "clangd", "ts_ls", "zls" })

vim.cmd("colorscheme catppuccin-mocha")
require('lualine').setup()
