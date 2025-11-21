{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "werty534tm";
      user.email = "tomascanosanta@gmail.com";
    };
  };
}
