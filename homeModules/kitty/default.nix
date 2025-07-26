{
  lib,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "GruvboxMaterialLightSoft";
    font.name = "BigBlueTermPlus Nerd Font";
    font.package = pkgs.nerd-fonts.bigblue-terminal;
  };
}
