local remaps = {
	n = {
		-- Navigation
		["<leader>pv"] = vim.cmd.Ex,
		['<C-h>'] = "<Cmd>wincmd h<CR>",
		['<C-j>'] = "<Cmd>wincmd j<CR>",
		['<C-k>'] = "<Cmd>wincmd k<CR>",
		['<C-l>'] = "<Cmd>wincmd l<CR>",

		-- Neotree
		["<leader>e"] = function() vim.cmd.Neotree('toggle') end,
		["<leader>o"] = function() vim.cmd.Neotree('focus') end,

		-- Telescope
		['<leader>ff'] = require('telescope.builtin').find_files,
		['<leader>fF'] = require('telescope.builtin').git_files,
		['<leader>fw'] = function() require('telescope.builtin').live_grep() end,
		['<leader>fe'] = require('telescope.builtin').grep_string,

		-- ToggleTerm
		["'"] = function() vim.cmd.ToggleTerm('direction=float') end,
		["<leader>tt"] = function() vim.cmd.ToggleTerm('direction=float') end,
		["<leader>tl"] = function() vim.cmd.ToggleTerm('direction=vertical size=60') end,
		["<leader>tj"] = function() vim.cmd.ToggleTerm('direction=horizontal') end,
	},
	t = {
		["<C-'>"] = vim.cmd.ToggleTerm,
		['<C-h>'] = "<Cmd>wincmd h<CR>",
		['<C-j>'] = "<Cmd>wincmd j<CR>",
		['<C-k>'] = "<Cmd>wincmd k<CR>",
		['<C-l>'] = "<Cmd>wincmd l<CR>",
	},
}

for mode, remap in pairs(remaps) do
	for k, v in pairs(remap) do
		vim.keymap.set(mode, k, v, {})
	end
end

