# nix-conifg
my NixOS config

```bash
$ tree

├── .gitpod.Dockerfile      # [test]git pod dockerfile
├── .gitpod.yml             # [test]git pod setting in yaml
├── Makefile                # [test]git pod makefile
├── LICENSE                 # LICENSE
├── README.md               # README
├── configuration.nix       # core config with desktop
├── configuration_nogui.nix # core config without desktop
├── home-manager            # the folder store local users setting
│   ├── authorized_keys         # users' authorized keys
│   ├── home.zshrc              # users' zsh config
│   ├── minimal.vimrc           # users' neovim config which no need plugin
│   ├── vim-plug.vimrc          # users' neovim plugins' config
│   ├── home_packages.nix       # users' installed packages
│   ├── tiny.nix                # users' program config in nix which are quite small
│   ├── tmux.nix                # users' tmux config in nix
│   ├── vars.nix                # color definitions in nix, not used yet
│   ├── vim.nix                 # users' vim config in nix
│   └── zsh.nix                 # users' zsh config in nix
└── nixos-manager           # the folder store system global users setting
    ├── nixos_packages.nix      # system's installed packages
    ├── tiny.nix                # system's xxx
    └── zsh.nix                 # system's xxx
```

## Note

- not use flake due to i think it is heavy

## gitpod

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/Eloco/nixos-config)
