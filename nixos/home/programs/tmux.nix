{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "screen-256color";
    mouse = true;
    keyMode = "vi";
    escapeTime = 0;
    extraConfig = ''
      set -g destroy-unattached on

      # НАВИГАЦИЯ (Ctrl + h,j,k,l) — без префикса
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R

      # СПЛИТЫ (Ctrl + s, Ctrl + d) — без префикса
      bind -n C-s split-window -h -c "#{pane_current_path}"
      bind -n C-d split-window -v -c "#{pane_current_path}"

      # ОКНА И ЗАКРЫТИЕ — без префикса
      bind -n C-t new-window -c "#{pane_current_path}"
      bind -n C-w kill-pane
      bind -n C-1 select-window -t 1
      bind -n C-2 select-window -t 2
      bind -n C-3 select-window -t 3

      # РЕЗАЙЗ (Ctrl + Shift + h,j,k,l) — без префикса
      bind -n C-H resize-pane -L 5
      bind -n C-J resize-pane -D 5
      bind -n C-K resize-pane -U 5
      bind -n C-L resize-pane -R 5

      # СТИЛЬ
      set -g status-style bg='#2e3440',fg='#88c0d0'
      set -g status-left " #[fg='#a3be8c',bold]#S "
      set -g status-right "#[fg='#eceff4'] %H:%M "
      set-option -sa terminal-overrides ",xterm-256color:RGB"
    '';
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };
}
