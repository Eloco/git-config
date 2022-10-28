{
  pkgs,
  inputs,
}: let
  packages = 
  {
    shell = with pkgs; [
      zsh
      starship
      zplug
      fzf
    ];
    normal = with pkgs; [
      #libreoffice
      p7zip # A new p7zip fork with additional codecs and improvements
      unrar # Utility for RAR archives
      unzip # An extraction utility for archives compressed in .zip format
      ack
      killall
      wget
      httpie
      lynx
      bat
      lsd
      proxychains
      neovim
      openssh
      git
      tailscale
      gh
      #nix-prefetch-github
    ];

    # if u need a gnome desktop
    #desktop = with pkgs; [
    #  gthumb
    #  notejot
    #  lollypop

    #  gnome.gnome-tweaks
    #  gnome.gnome-todo
    #  gnome.dconf-editor
    #  gnome.gnome-power-manager
    #  gnome.gnome-sound-recorder

    #  # gnomeExtensions
    #  gnomeExtensions.appindicator
    #  gnomeExtensions.dash-to-dock
    #  gnomeExtensions.night-theme-switcher
    #  gnomeExtensions.proxy-switcher
    #  gnomeExtensions.clipboard-history
    #  gnomeExtensions.espresso
    #  gnomeExtensions.ddterm
    #  gnomeExtensions.blur-my-shell
    #];
  };
in
  packages 

