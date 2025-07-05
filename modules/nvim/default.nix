{pkgs, ... }:

{
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
      ];

    extraLuaConfig= ''
      ${builtins.readFile ./options.lua}
    '';

    extraPackages = with pkgs; [
      lua-language-server
      nixd

      xclip
      wl-clipboard
    ];
  };
}
