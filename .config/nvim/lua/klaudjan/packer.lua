--, "lua"  This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Automatic installation of Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- add telescope
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- telescope plugins must be loaded by telescope
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- set colore scheme
  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
      vim.cmd('colorscheme rose-pine')
      end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-context')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- statusline plugin
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- indentation
  use "lukas-reineke/indent-blankline.nvim"

  -- gitsigns
  use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
  }

  -- help you establish good command workflow and habit
  use {
      "m4xshen/hardtime.nvim",
      requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  }
  -- notification plugin, particularly useful with the hardtime pulgin
  use 'rcarriga/nvim-notify'

  -- better todo highlight and related commands, with Telescope and others
  use {
      "folke/todo-comments.nvim",
      requires = { "nvim-lua/plenary.nvim" }
  }


  if packer_bootstrap then
    require('packer').sync()
  end
end)
