{
  pkgs,
  inputs,
}: let
  packages = {
    normal = with pkgs; [
      podman
      podman-compose
      trash-cli
      nodejs
      tmux
      jq
      python310
    ];

    py3note = with pkgs; [
      python310Packages.virtualenv
    ];
  };
in
  packages 
