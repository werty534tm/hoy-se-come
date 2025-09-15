{
  lib,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "GruvboxMaterialDarkSoft";
    font.name = "JetBrainsMono Nerd Font";
    font.package = pkgs.nerd-fonts.bigblue-terminal;
    font.size = 13;
  };
}
