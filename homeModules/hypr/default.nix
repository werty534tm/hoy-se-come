{pkgs, ...}:
{
  home.file.".config/hypr/resources/ign-waifu.png".source = ./resources/ign-waifu.png;
  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;

        preload = [
          "~/.config/hypr/resources/ign-waifu.png"
        ];

        wallpaper = [
          ", ~/.config/hypr/resources/ign-waifu.png"
        ];
      };
    };
  };
}
