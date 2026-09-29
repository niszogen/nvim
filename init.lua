vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 2
vim.o.signcolumn = "yes"
vim.o.termguicolors = true

vim.o.expandtab = false
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smarttab = true

vim.o.mouse = "a"
vim.g.mapleader = " "
vim.o.winborder = "rounded"

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', vim.cmd.write, { desc = 'Write to file' })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'LSP format' })
vim.keymap.set('n', '<leader>pu', vim.pack.update, { desc = 'vim.pack update' })

vim.keymap.set('n', '<leader>+', vim.cmd.vsplit, { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>-', vim.cmd.split, { desc = 'Horizontal split' })
vim.o.splitright = true
vim.o.splitbelow = true

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = 'https://github.com/nvim-tree/nvim-tree.lua' },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/ms-jpq/coq_nvim" },
	{ src = "https://github.com/nvim-mini/mini.notify" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/SmiteshP/nvim-navic" },
	{ src = "https://github.com/utilyre/barbecue.nvim" },
	-- { src = "https://github.com/vyfor/cord.nvim" },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require('nvim-tree').setup()
vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })

require('coq').setup()
require('mini.notify').setup()
require('lualine').setup()
require('nvim-highlight-colors').setup()
require("nvim-autopairs").setup()
require("barbecue").setup()

require("flash").setup()
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set("n", "<leader>t", function()
	vim.cmd("belowright 12split | terminal")
end, { desc = "Open terminal" })

require("nvim-treesitter").install({
	"lua", "c", "cpp", "typescript", "javascript",
	"zig", "vim", "vimdoc", "query", "java",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

vim.lsp.enable({ "lua_ls", "clangd", "ts_ls", "zls", "jdtls" })

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 4,
		source = "if_many",
	},
	signs = false,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

vim.cmd("colorscheme catppuccin-mocha")
