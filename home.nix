{ config, pkgs, ... }:
let
  neovim = import ./modules/nvim;
in
{
  # Imports
  imports = [
    ./modules/nvim
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zsh-upmyass";
  home.homeDirectory = "/home/zsh-upmyass";

  home.stateVersion = "25.05"; # NO CAMBIAR

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[
    tree-sitter
    ripgrep
    fd
    yazi
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/zsh-upmyass/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
    git = {
      enable = true;
    };
    # neovim =
    # {
    #   enable = true;
    #
    #   defaultEditor = true;
    #   viAlias = true;
    #   vimAlias = true;
    #   vimdiffAlias = true;
    #
    #   plugins = with pkgs.vimPlugins; [
    #     # LSP setup
    #     # {
    #     #   plugin = nvim-lspconfig;
    #     #   config = toLuaFile ./nvim/plugin/lsp.lua;
    #     # }
    #     # Theming
    #     {
    #       plugin = gruvbox-nvim;
    #       config = "colorscheme gruvbox";
    #     }
    #     # File tree
    #     {
    #       plugin = yazi-nvim;
    #       type = "lua";
    #       config =
    #         ''
    #           require("yazi").setup()
    #           vim.keymap.set('n', '<leader>e', function() require("yazi").yazi() end)
    #         '';
    #     }
    #     # Git stuff
    #     {
    #       plugin = gitsigns-nvim;
    #       type = "lua";
    #       config = 
    #       ''
    #         require("gitsigns").setup()
    #       '';
    #     }
    #     # Cant define this xddd
    #     # Just mini
    #     # Dont think too hard about it :D
    #     mini-nvim
    #
    #     # Mini status bottom bar
    #     lualine-nvim
    #
    #     # Helper for writing nix expressions
    #     vim-nix
    #
    #
    #     # Treesitter
    #     nvim-treesitter.withAllGrammars
    #
    #     # Dependencias
    #     nvim-web-devicons
    #     plenary-nvim
    #     ];
    #
    #   extraLuaConfig= ''
    #   	${builtins.readFile ./nvim/options.lua}
    #   '';
    #
    #   extraPackages = with pkgs; [
    #     lua-language-server
    #     nixd
    #
    #     xclip
    #     wl-clipboard
    #   ];
    # };
  };
}
