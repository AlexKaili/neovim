local packer = require("packer")
packer.startup({
  function(use)
    --packer可以管理自己
    use 'wbthomason/packer.nvim'

    --Plugins list
    
    --1. colorschemes 
   
    --1.1 tokyonight
    use ("folke/tokyonight.nvim")

    --1.2 gruvbox.nvim
    use { "ellisonleao/gruvbox.nvim" } 

    --2. nvim-tree 
    use ({"nvim-tree/nvim-tree.lua",requires = "nvim-tree/nvim-web-devicons"})
    
    
    --3. bufferline 
    use ({ "akinsho/bufferline.nvim", requires = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" }})
    
    --4. lualine
    use ({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use ("arkav/lualine-lsp-progress")

     --5. telescope 
    use ({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })

    --6. dashboard
    use ("glepnir/dashboard-nvim")

    --7. project 
    use ("ahmedkhalf/project.nvim")

    --8. treesitter 
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- 9.LSP
    use("williamboman/nvim-lsp-installer")
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })

    -- 10. 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

    -- 11.indent-blankline
    use("lukas-reineke/indent-blankline.nvim")

    -- 12. markdown-preview
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    --13. lspsaga
    use { 'kkharji/lspsaga.nvim' }


  end,

  config = {
      display = {
          open_fn = function()
              return require("packer.util").float({ border = "single" })
          end,
      },
  },

  pcall(
      vim.cmd,
      [[
        augroup packer_user_config
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
        augroup end
      ]]
    )

})

