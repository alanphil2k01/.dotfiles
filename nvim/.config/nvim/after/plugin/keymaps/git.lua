local neogit = require('neogit')

neogit.setup {
    disable_commit_confirmation = true,
    kind = "split_above",
    integrations = {
        diffview = true
    }
}

-- fugitive mappings
SetKeymap("n", "<Leader>gh", ":diffget //3<CR>", { noremap = true })
SetKeymap("n", "<Leader>gu", ":diffget //2<CR>", { noremap = true })
SetKeymap("n", "<Leader>gs", neogit.open, { noremap = true })
SetKeymap("n", "<Leader>gp", ":Git push<CR>", { noremap = true })
SetKeymap("n", "<Leader>ga", ":Git fetch --all<CR>", { noremap = true })
