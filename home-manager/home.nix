{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "mi";
    homeDirectory = "/home/mi";
    stateVersion = "23.11";
  };
}
