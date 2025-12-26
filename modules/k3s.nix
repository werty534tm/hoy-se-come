{
  config,
  pkgs,
  ...
}: {
  services.k3s = {
    enable = true;
    role = "server";
    # extraFlags = ["--etcd-expose-metrics" "--cluster-cidr 10.24.0.0/16"];
  };
}
