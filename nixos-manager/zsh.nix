{ config, pkgs, lib, ... }:
{ 
  ## zsh setting
  programs.zsh = {
    enable = false;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable =true;

    shellAliases = {
      vim = "nvim";
    };


    ohMyZsh = {
      enable = true;
      plugins = 
        [ 
	  "git" "extract" "z" "wd" "aws" "sudo" "tmux" "cp" "macos"
          "command-not-found"
          "vi-mode"
          "web-search"
          "copyfile"
          "copybuffer"
          "dirhistory"
          "nmap"
          "gh"
          "iterm2"
          "python"
	];
      theme = "ys";
    };
    interactiveShellInit = ''
      # z - jump around
      # export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
      # source $ZSH/oh-my-zsh.sh
    '';
    promptInit = "";
  };


  ## starship setting
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = true;
    format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration\n$character";
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
}
