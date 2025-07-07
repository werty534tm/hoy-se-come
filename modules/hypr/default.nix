{pkgs, ...}:
{
  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;

        preload = [
          "./resources/ign-waifu.png"
        ];

        wallpaper = [
          ", ./resources/ign-waifu.png"
        ];
      };
    };
  };
}
