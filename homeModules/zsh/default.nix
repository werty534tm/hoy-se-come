{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    shellAliases = {
      # Basic aliases
      ls = "lsd";
      ll = "lsd -l";
      la = "lsd -la";
      tree = "lsd --tree";
      cd = "z";
      nv = "nvim";
      man = "BAT_THEME='gruvbox-light' batman";

      # Docker compose aliases stolen from François Vantomme <akarzim@gmail.com>
      dkc = "docker-compose";
      dkcb = "docker-compose build";
      dkcB = "docker-compose build --no-cache";
      dkccf = "docker-compose config";
      dkccr = "docker-compose create";
      dkcd = "docker-compose down";
      dkce = "docker-compose exec -e COLUMNS=`tput cols` -e LINES=`tput lines`";
      dkcev = "docker-compose events";
      dkci = "docker-compose images";
      dkck = "docker-compose kill";
      dkcl = "docker-compose logs";
      dkcL = "docker-compose logs -f";
      dkcls = "docker-compose ps";
      dkcp = "docker-compose pause";
      dkcP = "docker-compose unpause";
      dkcpl = "docker-compose pull";
      dkcph = "docker-compose push";
      dkcpo = "docker-compose port";
      dkcps = "docker-compose ps";
      dkcr = "docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines`";
      dkcR = "docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines` --rm";
      dkcrm = "docker-compose rm";
      dkcs = "docker-compose start";
      dkcsc = "docker-compose scale";
      dkcS = "docker-compose restart";
      dkct = "docker-compose top";
      dkcu = "docker-compose up";
      dkcU = "docker-compose up -d";
      dkcv = "docker-compose version";
      dkcx = "docker-compose stop";
    };
    enable = true;
    enableCompletion = false;
    # completionInit = "autoload -U compinit && compinit -d";

    initContent = lib.mkOrder 1000 ''
      ${lib.readFile ./zinit.zsh}
    '';
  };
}
