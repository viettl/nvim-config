return require('packer').startup(function(use)
  -- configuration is going here
  use 'wbthomason/packer.nvim'

  -- speeding up
  use { 'lewis6991/impatient.nvim' }
  use { 'nathom/filetype.nvim' }
 
  use {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
  }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use "neovim/nvim-lspconfig"

  -- Plugins for code completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'
  use 'akinsho/toggleterm.nvim'
  use 'ellisonleao/gruvbox.nvim'
 use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip' 
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  }


  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  -- Nvimtree for file exploring
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  } 

  -- DAP for debugging
  use 'mfussenegger/nvim-dap'
  -- UI for DAP
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  -- Dracula theme for styling
  --use 'Mofiqul/dracula.nvim'
  -- Treesitter
  --use {
  --	'nvim-treesitter/nvim-treesitter',
  --	run = ':TSUpdate'
  --}

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Telescope used to fuzzy search files
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- Lualine information / Status bar
  use {
    'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Auto Pair to generate brackets etc
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- Bufferline is a "header" with all opened buffers
  -- using packer.nvim
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }

  -- LSP Saga
  --use({
  --"glepnir/lspsaga.nvim",
  --branch = "main",
  --})
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = {
      -- {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  })
  -- Indent guide
  use "lukas-reineke/indent-blankline.nvim"
  -- Floatterm to run lazygit
  use 'voldikss/vim-floaterm'
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use 'akinsho/nvim-bufferline.lua'
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'nvim-tree/nvim-web-devicons'


  --fullstack dev
  use 'pangloss/vim-javascript' --JS support
  use 'leafgarland/typescript-vim' --TS support
  use 'maxmellon/vim-jsx-pretty' --JS and JSX syntax
  use 'jparise/vim-graphql' --GraphQL syntax
  use 'mattn/emmet-vim'
  use 'jose-elias-alvarez/typescript.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'nvim-lua/popup.nvim'
  use 'p00f/nvim-ts-rainbow'


  -- use({
  -- 'jose-elias-alvarez/null-ls.nvim',
  -- config = function()
  --   require('null-ls')
  -- end,
  -- })
end)
