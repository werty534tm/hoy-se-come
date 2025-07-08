{ config, pkgs, inputs, ... }:
{
    # Imports
  imports = [
    ./homeModules/hypr
    ./homeModules/nvim
    ./homeModules/wofi
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
    hyprpaper
    inputs.quickshell.packages."x86_64-linux".default
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
  };
}
