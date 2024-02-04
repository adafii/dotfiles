return require('packer').startup(function(use)
    use {
        'nvim-telescope/telescope-fzf-native.nvim', 
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
    }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use { 'tpope/vim-surround', as = "surround" }
    use { 'tpope/vim-repeat', as = "repeat" }
    use { 'sainnhe/sonokai', as = 'sonokai' }
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }
    use 'saadparwaiz1/cmp_luasnip'
    use 'm4xshen/autoclose.nvim'
    use 'airblade/vim-gitgutter'
    use 'nvim-lualine/lualine.nvim'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'preservim/nerdtree'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'ryanoasis/vim-devicons'
    use 'nvim-tree/nvim-web-devicons'
end)
