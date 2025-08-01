# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  # an exhaustive example can be found in flake.nix
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "rei"; # select the config of your choice
  };
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "jake_the_dog";
  };
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/firefox.nix
  ];
  # Enable zram intead of swap
  zramSwap.enable = true;
  # Enable hyprland

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      efiSupport = true;
      device = "nodev";
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  networking.hostName = "hoy-compramos-tuercas"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_ES.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "es";
    # useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm; # use qt6 version of sddm
    enable = true;
    theme = "sddm-astronaut-theme";
    # the following changes will require sddm to be restarted to take
    # effect correctly. It is recomend to reboot after this
    extraPackages = sddm-theme.propagatedBuildInputs;
    settings = {
      # required for styling the virtual keyboard
      General = {
        # GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "es";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.upower.enable = true;

  # services.systembus-notify.enable = true;
  services.dbus.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zsh-upmyass = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  qt.enable = true;
  programs = {
    neovim.enable = true;
    hyprland.enable = true;
    git.enable = true;
    zsh.enable = true;
  };

  fonts.packages = [
    pkgs.nerd-fonts.bigblue-terminal
  ];
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    sddm-astronaut
    nix-output-monitor
    networkmanagerapplet
    kdePackages.full
    kdePackages.qtquick3d
    eza
    lsd
    wl-clipboard
    xclip
    rustup
    viu
    unzip
    clang
    kitty
    openssh
    neovim
    python3
    curl
    fastfetch
    wget
    brightnessctl
    libnotify
    zsh-powerlevel10k
    sddm-theme
    sddm-theme.test
  ];

  nixpkgs.config = {
    /*
    allowBroken = true;
    */
    allowUnfree = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
