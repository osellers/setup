-- This file can be loaded by calling `lua require('plugins')` from our init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })
  vim.cmd('colorscheme rose-pine')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }
  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use {
      "tpope/vim-fugitive"
  }
  use({
      "NTBBloodbath/zig-tools.nvim",
      -- Load zig-tools.nvim only in Zig buffers
      ft = "zig",
      config = function()
          -- Initialize with default config
          require("zig-tools").setup()
      end,
      requires = {
          {
              "akinsho/toggleterm.nvim",
              config = function()
                  require("toggleterm").setup()
              end,
          },
          {
              "nvim-lua/plenary.nvim",
              module_pattern = "plenary.*"
          }
      },
  })
end)
