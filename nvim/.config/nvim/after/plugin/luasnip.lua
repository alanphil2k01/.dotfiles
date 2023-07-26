local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.setup({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = {{"<--", "GruvboxOrange"}}
			}
		},
		[types.insertNode] = {
			active = {
				virt_text = {{"<--", "GruvboxBlue"}}
			}
		}
	},
})

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.config/nvim-plugins/plugged"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})


vim.keymap.set({"i", "s"}, "<C-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
vim.keymap.set("n", "<leader><leader>s", "sourceh ~/.config/nvim/after/plugin/luasnip.lua<CR>")
