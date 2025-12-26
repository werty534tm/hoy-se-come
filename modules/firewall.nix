{
  config,
  pkgs,
  ...
}: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [6443];
    allowedUDPPorts = [8472];
  };
  services.openssh = {
    enable = true;
  };
  networking.nftables.enable = true;
}
