{lib, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
        enableCompletion = true;

    initContent=
    lib.mkOrder 1000 ''
      ${lib.readFile ./zinit.zsh}
    '';
  };
}
