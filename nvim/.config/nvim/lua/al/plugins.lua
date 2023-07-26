return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Themes
    use 'gruvbox-community/gruvbox'
    use 'folke/tokyonight.nvim'
    use 'sickill/vim-monokai'
    use 'rebelot/kanagawa.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'

    -- Mason
    use "williamboman/mason.nvim"

    -- nvim-cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'onsails/lspkind-nvim'
    use('tzachar/cmp-tabnine', { run = './install.sh' })

    -- luasnip
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use 'nvim-treesitter/playground'
    use 'romgrk/nvim-treesitter-context'

    -- lualine
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- indent-blankspace
    use 'lukas-reineke/indent-blankline.nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Git
    use 'tpope/vim-fugitive'
    use {
        'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim'
        }
    }

    -- Undotree
    use 'mbbill/undotree'

    -- Commenter
    use 'numToStr/Comment.nvim'

    -- Languages
    use 'ray-x/go.nvim'
    use 'rust-lang/rust.vim'

    -- Emmet
    use 'mattn/emmet-vim'
end)
