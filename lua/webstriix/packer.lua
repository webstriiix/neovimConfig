-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use { "catppuccin/nvim", as = "catppuccin" }
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('deoplete-plugins/deoplete-clang')
  
  -- LSP
  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use({'hrsh7th/cmp-buffer'})
  use({'hrsh7th/cmp-path'})
  use({'hrsh7th/cmp-cmdline'})
  use({'saadparwaiz1/cmp_luasnip'})
  use({'rafamadriz/friendly-snippets'})
  use{"williamboman/mason.nvim"}
  use 'andweeb/presence.nvim'
  use { 'L3MON4D3/LuaSnip', tag = 'v2.*', run = 'make install_jsregexp' }

  -- DAP Configuration
  use {
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text"
    },
    config = function()
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()
    end
  }
  
  -- Null-ls and Mason
  use {
    "nvimtools/none-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      local nls = require("null-ls")
      local fmt = nls.builtins.formatting
      local dgn = nls.builtins.diagnostics
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      nls.setup({
        sources = {
          -- # FORMATTING #
          fmt.google_java_format.with({ extra_args = { "--aosp" } }),
          -- # DIAGNOSTICS #
          dgn.checkstyle.with({
            extra_args = {
              "-c",
              vim.fn.expand("~/dotfiles/config/google_checks.xml"),
            },
          }),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  }

  use {
    "jay-babu/mason-null-ls.nvim",
    requires = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "checkstyle",
          "google-java-format",
        },
      })
    end,
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    requires = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
  }


  use {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })
    end
  }
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "pom.xml", "build.gradle", "settings.gradle", ".project" },
      })
    end
  }


end)
