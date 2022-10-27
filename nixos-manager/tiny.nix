{ config, pkgs, lib, ... }:
{
  programs.kdeconnect = {
  enable = true;
  package = pkgs.gnomeExtensions.gsconnect;
  };
}
