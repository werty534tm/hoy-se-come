{pkgs, ...}: {
  home.file.".config/nvim/lua/resources/ascii.lua".source = ./resources/ascii.lua;

  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      # Theming
      # {
      #   plugin = gruvbox-nvim;
      #   config = ''
      #     set background=dark
      #     colorscheme gruvbox
      #   '';
      # }
      {
        plugin = onedark-nvim;
        config = ''
          set background=dark
          colorscheme onedark
        '';
      }

      # Colorizer
      {
        plugin = nvim-colorizer-lua;
        type = "lua";
        config = ''
          require("colorizer").setup({
            filetypes = { "*" }
          })
        '';
      }

      # Gitsigns
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = ''
          require("gitsigns").setup()
        '';
      }

      # File tree
      {
        plugin = yazi-nvim;
        type = "lua";
        config = ''
          require("yazi").setup()
          vim.keymap.set('n', '<leader>e', function() require("yazi").yazi() end)
        '';
      }
      # Git stuff
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = ''
          require("gitsigns").setup()
        '';
      }
      # Welcoming dashboard
      {
        plugin = alpha-nvim;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/alpha.lua}
        '';
      }
      # Fuzzy finder
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/telescope.lua}
        '';
      }
      # Which-key (I love folke)
      {
        plugin = which-key-nvim;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/which-key.lua}
        '';
      }
      # Lsp
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/lspconfig.lua}
        '';
      }
      # Better metals scala lsp plugin
      {
        plugin = nvim-metals;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/scala-metals.lua}
        '';
      }
      # Loading status
      {
        plugin = fidget-nvim;
        type = "lua";
        config = ''
          require("fidget").setup({})
        '';
      }
      # Configuración chachi piruli de lua_ls
      {
        plugin = lazydev-nvim;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/lazydev.lua}
        '';
      }
      {
        plugin = conform-nvim;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/conform.lua}
        '';
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/completion.lua}
        '';
      }
      # Cant define this xddd
      # Just mini
      # Dont think too hard about it :D
      mini-nvim

      # Status bottom bar
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/lualine.lua}
        '';
      }

      # Helper for writing nix expressions
      vim-nix

      # Treesitter
      nvim-treesitter.withAllGrammars
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/treesitter.lua}
        '';
      }

      # Noice
      {
        plugin = noice-nvim;
        type = "lua";
        config = ''
          ${builtins.readFile ./plugins/noice.lua}
        '';
      }

      # Dependencias
      # For too many things :C
      nvim-web-devicons
      plenary-nvim

      # For telescope
      telescope-fzf-native-nvim
      telescope-ui-select-nvim

      # For completion/snippets
      lspkind-nvim
      cmp-nvim-lsp
      cmp-path
      cmp-buffer
      cmp_luasnip
      luasnip

      # Noice dependencies
      nui-nvim
      nvim-notify
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
    '';

    extraPackages = with pkgs; [
      # LSP
      lua-language-server
      nixd
      yaml-language-server
      metals

      # Formatters
      stylua
      alejandra
      basedpyright
      isort
      black
      yamlfmt

      # Clipboard
      xclip
      wl-clipboard
    ];
  };
}
