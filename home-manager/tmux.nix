{ config, pkgs, lib, ...}:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    historyLimit = 100500;
    keyMode = "vi";
    extraConfig = ''
      bind Escape copy-mode
      bind Escape copy-mode-vi
      unbind C-b
      set -g prefix C-q

      bind-key -Tcopy-mode-vi 'v' send -X begin-selection
      bind-key -Tcopy-mode-vi 'y' send -X copy-selection
      unbind p
      bind p pasteb

      bind-key v split-window -h -c "#{pane_current_path}"
      bind-key s split-window -v -c "#{pane_current_path}"
      bind-key V split-window -h
      bind-key S split-window -v

      bind-key v split-window -h
      bind-key s split-window -v

      bind-key J resize-pane -D 5
      bind-key K resize-pane -U 5
      bind-key H resize-pane -L 5
      bind-key L resize-pane -R 5

      bind-key M-j resize-pane -D
      bind-key M-k resize-pane -U
      bind-key M-h resize-pane -L
      bind-key M-l resize-pane -R

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Use Alt-vim keys without prefix key to switch panes
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
    '';
    plugins = [ pkgs.tmuxPlugins.yank ];
  };
}
