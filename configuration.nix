{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "rei";
  };
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "jake_the_dog";
  };
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  imports = [
    ./hardware-configuration.nix
    ./modules/firefox.nix
  ];

  # Enable zram intead of swap
  zramSwap.enable = true;

  # grub grub grub grub :D
  boot = {
    loader = {
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

    plymouth.enable = true;

    kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware.enableRedistributableFirmware = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = false;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

  networking = {
    hostName = "hoy-compramos-tuercas";
    networkmanager.enable = true;
  };

  # Locale stuff
  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "es";
  };

  services = {
    udisks2.enable = true;

    xserver.enable = true;

    blueman.enable = true;

    displayManager.sddm = {
      package = pkgs.kdePackages.sddm;
      enable = true;
      theme = "sddm-astronaut-theme";
      extraPackages = sddm-theme.propagatedBuildInputs;
      settings = {
        # required for styling the virtual keyboard
        General = {
          # GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
          InputMethod = "qtvirtualkeyboard";
        };
      };
    };

    xserver.xkb.layout = "es";

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    upower.enable = true;

    dbus.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };

    buffyboard.settings.input.tochscreen = true;
  };

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zsh-upmyass = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  qt.enable = true;
  programs = {
    neovim.enable = true;
    steam.enable = true;
    hyprland.enable = true;
    git.enable = true;
    zsh.enable = true;
  };

  fonts.packages = [
    pkgs.nerd-fonts.bigblue-terminal
    pkgs.nerd-fonts.jetbrains-mono
  ];
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    sddm-astronaut
    openjdk
    jflap
    antlr
    (flameshot.override
      {enableWlrSupport = true;})
    udiskie
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
    jetbrains.pycharm-community-bin
    scala-next
    sbt
    ammonite
    scalafmt
    coursier
    curl
    fastfetch
    hyfetch
    wget
    brightnessctl
    libnotify
    zsh-powerlevel10k
    sddm-theme
    sddm-theme.test
    docker
    docker-init
    docker-compose
    lazydocker
    unstable.olympus
  ];

  nixpkgs.config = {
    /*
    allowBroken = true;
    */
    allowUnfree = true;
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
