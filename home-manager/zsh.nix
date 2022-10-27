{ config, pkgs, lib, ... }:
#let 
#  vars = import ./vars.nix;
#in
{ 
  # starship setting
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = true;
    format = "$all";
    #format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration\n$character";
    shlvl = {
      disabled = false;
      symbol = "ﰬ";
      style = "bright-red bold";
    };
    shell = {
      disabled = false;
      format = "$indicator";
      fish_indicator = "";
      bash_indicator = "[BASH](bright-white) ";
      zsh_indicator = "[ZSH](bright-white) ";
    };
    username = {
      style_user = "bright-green bold";
      style_root = "bright-red bold";
    };
  };

  #programs.home-manager.enable = true;
  #programs.bat.enable = true;

  # fzf setting
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--inline-info"
      #"--color 'fg:#${vars.colors.base05}'" # Text
      #"--color 'bg:#${vars.colors.base00}'" # Background
      #"--color 'preview-fg:#${vars.colors.base05}'" # Preview window text
      #"--color 'preview-bg:#${vars.colors.base02}'" # Preview window background
      #"--color 'hl:#${vars.colors.base0A}'" # Highlighted substrings
      #"--color 'fg+:#${vars.colors.base0D}'" # Text (current line)
      #"--color 'bg+:#${vars.colors.base02}'" # Background (current line)
      #"--color 'gutter:#${vars.colors.base02}'" # Gutter on the left (defaults to bg+)
      #"--color 'hl+:#${vars.colors.base0E}'" # Highlighted substrings (current line)
      #"--color 'info:#${vars.colors.base0E}'" # Info line (match counters)
      #"--color 'border:#${vars.colors.base0D}'" # Border around the window (--border and --preview)
      #"--color 'prompt:#${vars.colors.base05}'" # Prompt
      #"--color 'pointer:#${vars.colors.base0E}'" # Pointer to the current line
      #"--color 'marker:#${vars.colors.base0E}'" # Multi-select marker
      #"--color 'spinner:#${vars.colors.base0E}'" # Streaming input indicator
      #"--color 'header:#${vars.colors.base05}'" # Header
    ];
  };

  # zsh setting
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;


    history = {
      expireDuplicatesFirst = true;
      size = 10000000;
    };

    #initExtra = builtins.readFile ./dotfiles/zshextra;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" "extract" "z" "wd" "aws" "sudo" "tmux" "cp"
        "command-not-found"
        "vi-mode"
        "dirhistory"
        "nmap"
        "gh"
        "python"
      ];
    };

    # zplug setting
    zplug = {
      enable = true;
      plugins = [
        #{ name = "Green-m/msfvenom-zsh-completion";}
        #{ name = "paulirish/git-open";} 
        { name = "oldratlee/hacker-quotes";} 
        { name = "supercrabtree/k";}
        { name = "spwhitt/nix-zsh-completions";} 
      ];
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.4.0";
          sha256 = "037wz9fqmx0ngcwl9az55fgkipb745rymznxnssr3rx9irb6apzg";
        };
      }
    ];

    shellAliases = {
      update = "sudo nixos-rebuild switch";
      tmux="tmux -2 -u";
      pep8="autopep8 --in-place --aggressive --aggressive";
      httpserver="sudo python3 -m http.server 80 --bind 0.0.0.0";
      hackerpod="podman run --rm -it -v $(pwd):/work";
      pc="proxychains4 -q";
      reb="sudo reboot";
      shu="sudo shutdown -h now";

      rm="trash-put";
      rl="trash-list";
      rmcl="trash-empty -f";
      restore="trash-restore";
      trash="cd $HOME/.local/share/Trash/files";

      gcommit="LC_ALL=en_GB git -c color.status=false status | grep -E '(modified:)|(deleted:)|(new file)|(renamed:)'";
      sgrep= "sed 's/\x1b\[[0-9;]*m//g'|sed -r 's/[\x08\x7c\x2f\x2d\x5c\x2d]{3,}//g'";
      escape="sed 's/\x1b\[[0-9;]*m//g'|sed -r 's/[\x08\x7c\x2f\x2d\x5c\x2d]{3,}//g'";
      e="exit";
      c="clear";
      cn="export LANG=zh_CN.utf-8";
      less="less -R";
      ls="lsd";
      ll="lsd -l";
      la="lsd -alF";
      termshare="termpair share --host 'https://chadsmith.dev/termpair/' --port 443";
      pastec="curl --upload-file - 'http://paste.c-net.org/'";
    };

    initExtra = ''
      ${builtins.readFile ./home.zshrc}
    '';
  };
}
