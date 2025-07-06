{pkgs, ... }:

{

  home.file.".config/nvim/lua/resources/ascii.lua".source = ./resources/ascii.lua;

  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      # LSP setup
      # {
      #   plugin = nvim-lspconfig;
      #   config = toLuaFile ./nvim/plugin/lsp.lua;
      # }
      # Theming
      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }
      # File tree
      {
        plugin = yazi-nvim;
        type = "lua";
        config =
          ''
            require("yazi").setup()
            vim.keymap.set('n', '<leader>e', function() require("yazi").yazi() end)
          '';
      }
      # Git stuff
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = 
          ''
            require("gitsigns").setup()
          '';
      }
      # Welcoming dashboard
      {
        plugin = alpha-nvim;
        type = "lua";
        config = 
          ''
            ${builtins.readFile ./plugins/alpha.lua}
          '';
      }
      # Fuzzy finder
      {
        plugin = telescope-nvim;
        type = "lua";
        config =
          ''
            ${builtins.readFile ./plugins/telescope.lua}
          '';
      }
      # Which-key (I love folke)
      {
        plugin = which-key-nvim;
        type = "lua";
        config =
          ''
            ${builtins.readFile ./plugins/which-key.lua}
          '';
      }
      # Lsp
      {
        plugin = nvim-lspconfig;
        type ="lua";
        config =
          ''
            ${builtins.readFile ./plugins/lspconfig.lua}
          '';
      }
      # Loading status
      {
        plugin = fidget-nvim;
        type = "lua";
        config =
          ''
            require("fidget").setup({})
          '';
      }
      # Configuración chachi piruli de lua_ls
      {
        plugin = lazydev-nvim;
        type = "lua";
        config =
          ''
            ${builtins.readFile ./plugins/lazydev.lua}
          '';
      }
      # Cant define this xddd
      # Just mini
      # Dont think too hard about it :D
      mini-nvim

      # Mini status bottom bar
      lualine-nvim

      # Helper for writing nix expressions
      vim-nix

      
      # Treesitter
      nvim-treesitter.withAllGrammars
      
      # Dependencias
      nvim-web-devicons
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      ];

    extraLuaConfig= ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
    '';

    extraPackages = with pkgs; [
      lua-language-server
      nixd

      xclip
      wl-clipboard
    ];
  };
}
