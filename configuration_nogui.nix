{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
in
{
  imports =
    [
      <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> # virtualbox need it
      (import "${home-manager}/nixos") # import home-manager
      ./nixos-manager/zsh.nix          # import global zsh (global means suit all users settings)
    ];

  time.timeZone = "Asia/Shanghai"; # timezone could see https://gist.github.com/alejzeis/ad5827eb14b5c22109ba652a1a267af5

  services.openssh = {
    enable = true;
    passwordAuthentication = true;
    kbdInteractiveAuthentication = false;
    permitRootLogin = "no";
    #authorizedKeys.keyFiles = [
    # ./nixos-manager/authorized_keys
    #];
  };
  services.sshd.enable = true;

  networking = {
      hostName = "eloco-nix";
      nameservers = [ "1.1.1.1" ];
      #defaultGateway = "192.168.2.1";
      #interfaces.eth0.ipv4.addresses = [
      #{
      #  address = "192.168.2.159";
      #  prefixLength = 24;
      #}];
      #proxy.default = "http://user:password@proxy:port/";
      #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
      firewall.enable = false; # i dont need a firewall
  };

  # all global system packages setting on <nixos-manager/nixos_packages.nix>
  environment.systemPackages  = builtins.concatLists (builtins.attrValues (import ./nixos-manager/nixos_packages.nix { inherit pkgs inputs; }));
  environment.variables.EDITOR = "nvim"; # use neovim
  # could also set like that
  #environment.systemPackages = with pkgs; [
  #    zsh
  #    neovim
  #    tmux
  #  ];

  users.users.root.password = "root"; #global roots password

  nix.settings.trusted-users = [ "hacker" ]; # Trust myself
  users.users.eloco = {
    extraGroups = [ "wheel" ];
    home                        = "/home/hacker";
    password                    = "hacker";
    isNormalUser                = true;
    shell                       = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [
      ./home-manager/authorized_keys
    ];
    #openssh.authorizedKeys.keys = [
    #  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCmuP0V/e9T4fCPxAhSu1ECs8EP7/gBxnAy18UzR2tib7jCz74PIYOyN1BJ9eQfe7gRTW0OllqK61phikRm7KXq4TmFZNora0ZAAlJ5bifFpkDqPvz5GUB8yUp8aH8y8oiX1CAg0K/G9X/ZETGkiOkZidpIdHbtpWzMinDyCkRaQTs7c/Ehc53NMZNji3aBb+yYVP33r8lQ1mFbAAUcHiRdJ0rNOXYyX+qlcqtjwrw8HJura+yz+Nl9EtW8v5ynlGCOJKEfYjpPOv8OCKxCYqJToqQ615zSvMJ619Oyqsk0Ax1OSox5aTpIqCkED3iQJGZ9bH9e0FUNAR7xS2voDlJLSXTPLWqHruCpbHzzH9N5foHIdAK0E5spRgSOv6lNN02ccdCGnL47OYM++cWugqVIXeIuFLwGNOBy6rPjg+V5jthXklQVpATXGbwAMN7vLw96y4f9264UUYZ5ZnBsh6DYd0HeZEabfta3JJkVA8c1lm1U8czbhpWrJRr4bxkzvGJ79N++qDPgZ9KmKl/qjySqGpT/LZm8oC+sqmo+vYYfUKa1n+a6DjBhVk5i8Ooyy90vkNPbEtcuw4rMhQN5py1yPfwOr1kpEM6b7DA9PE+Wikw+w4/ytOp1UxJnJFZ6fdhI8n8jLk14ny68RSVFcbn15Wu4HKRG2VzQCyCsVPYmUw== hacker0@hacker"
    #  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZYejl+0DRkCpBCS/8zDI84l/NTp5kOGVCLY/mB4sYoh9XDmZsA2fINoHdDu6vyaLfMxJqpKrEjoBol+KK8jj4B9JIbYZRv7iaIXaOfsI8xWAeWZ8z1w2B3KFM0m4eyBjmQ787aNkDlZ//5TOTiOzOHZQ6VcgLb9ukf+TQk7tXpUSKU5z8c5WhERrK7N1kUeKWlfn7FjMg1NWhX36w0hVzU+D4P9dJAzrYWYgW34nbPXOesXP3DYtyLIx8gDpEyJmDReRAqHWKHrozB7p0AowhAmhmSdvC2Bd1cHgmSBV0tBGlDlq6ewrw2xUzZJNuVb3h7f2Avt8HS9dSP4h9R1n7q6efb8t3zatD3DPSjEJq57xcYX9Jhz2SEhtksxxez6bB0BFvly+4TwJyj0bbg6HtlU5/F4mOfmQXXLaDhwgZOplUbjj1SqOhQktBlRdsaEmfWezNbWgARUjBcZNYHp23/NOac8r3P3PI4crxqC1DreY4n0Rf7c9Po4ecC//HTG+4T0hiBaLM0KzN7c/eO06krhdMgFRBCMhmiLmdSxGRa9Paf5nLkMRe73MLIRmUVPJSyFMGZrDLgBwwwsReU+0h01UUNMlklZCdWKwClqbVWntdF1qIH7CUQl1cccaBC1hSbQA3q7UGA+rXZzHi54LrsIkYa6Oc/BpoFM9ZgG596w== hacker1@hacker"
    #  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9jjcmrAlCiHWtdRC09CHZb0O9/UoR+FXyp45gvQxIVtxttC/uEp0GyoAYlt21AxuQ0T931Hztrqs+4HOZzIBZaytkG586qUEec/qznxXTgYtVpWUaKk2uFve9GfhohUO7sF0sRO2X+tlzvvFXLnpsNKd0paqQOUuidNHhufhKsVfRfrfPcEP03jxZEDu1XBy+Q3SyGTlOieL1e7+BLVA5bpeUM9hv2XZ0tldouyjmYoCgJiLDGaZjaYFtbsXwDSLiUiy22bjlpYtA5m1368zWPjtZVvX4xoLtFAc915qtpTuQVxsgp1BeFPFwpb/0L5KXozHb4gkX2IUyUHcq5CdVpDwoPYFS7XSBoOMeVKm6LJefjJFFwA9MMnZzT0zssIzAB3tXMQY+I/mR1CitLpc43fpielVE7o/+dkoza1gGuJSzzlNtp60mqWgX5BlT5IX/HQVP59cdgF2GK9S67r6dTHyhlIkiM0IpxXSUxA/Z//pMu+QjSfHHBN3rNu6xbN8= hacker2@hacker"
    #];
  };

  ##############################
  ######user setting
  ##############################
  home-manager.users.hacker = {
    nixpkgs.config.allowUnfree = true;
    imports =
      [
        ./home-manager/zsh.nix  #contains zsh config
        ./home-manager/tiny.nix #contains tiny config
        ./home-manager/tmux.nix #...
        ./home-manager/vim.nix  #...
      ];

    # local user software packages
    home.packages = builtins.concatLists (builtins.attrValues (import ./home-manager/home_packages.nix { inherit pkgs inputs; }));
    home.stateVersion = "22.05"; #system version
  };
  system.stateVersion = "22.05"; #system version

  ##############################
  ######security setting
  ##############################
  security.sudo.enable = true;
  security.sudo.extraRules = [{
    users = [ "eloco" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
    }];

  ##############################
  ######nixpkgs setting
  ##############################
  nixpkgs.overlays = [
    (self: super: {
      neovim = super.neovim.override {
        viAlias = true;
        vimAlias = true;
      };
    })
  ];
  # I don't limit myself
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowInsecurePredicate = p: true;
  };

  ##############################
  ######virtualbox setting
  ##############################
  # Mount a VirtualBox shared folder.
  # This is configurable in the VirtualBox menu at
  # Machine / Settings / Shared Folders.
  # fileSystems."/mnt" = {
  #   fsType = "vboxsf";
  #   device = "nameofdevicetomount";
  #   options = [ "rw" ];
  # };

  ##############################
  ######xserver setting
  ##############################
  # By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
  # If you prefer another desktop manager or display manager, you may want
  # to disable the default.
  services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
  services.xserver.displayManager.sddm.enable = lib.mkForce false;

  ## https://nixos.wiki/wiki/GNOME
  #services.xserver.enable = true;
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  ## Serve the tray icon
  #services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  ## streamline unwanted services
  #services.packagekit.enable = false;
  #services.gnome.tracker-miners.enable = false;
  #services.gnome.tracker.enable = false;

  ## Exclude GNOME packages I don't want to install
  #environment.gnome.excludePackages = with pkgs; [
  #  gnome-photos
  #  gnome-tour
  #  gnome.yelp
  #  gnome.geary
  #  gnome.totem
  #  gnome.gnome-music
  #  gnome.gnome-software
  #];
}
