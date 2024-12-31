vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    "lukas-reineke/indent-blankline.nvim"
  }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'

  use 'neovim/nvim-lspconfig'

  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/vim-vsnip',
     'hrsh7th/cmp-vsnip'
    }
  })

  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use 'lewis6991/gitsigns.nvim'
  use 'numToStr/Comment.nvim'
  use 'folke/which-key.nvim'
  use 'stevearc/dressing.nvim'
  
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use 'nvim-treesitter/nvim-treesitter-context'
  use 'petertriho/nvim-scrollbar'
  use "lukas-reineke/virt-column.nvim"
end)
