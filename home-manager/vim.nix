{ config, pkgs, lib, ... }:
{
  # https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/vim.section.md
  programs.neovim = {
    enable =true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/vim/plugins/generated.nix
      #coc-nvim
      #coc-python
    ];
    extraPackages = with pkgs; [
      (python3.withPackages (ps: with ps; [
        black
        flake8
        pylint
      ]))
    ];
    extraPython3Packages = (ps: with ps; [
      #jedi
    ]);
    extraConfig=''
     ${builtins.readFile ./minimal.vimrc}
     ${builtins.readFile ./vim-plug.vimrc}
    '';
  };
}
