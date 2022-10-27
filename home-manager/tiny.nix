{ config, pkgs, lib, ... }:
{ 
  programs.git = {
    enable = true;
    userName  = "eloco";
    userEmail = "elogicocal@nix.com";
  };

  programs.jq = {
    enable = true;
  };
}
