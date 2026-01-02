{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      # Основные настройки
      default_shell = "${pkgs.nushell}/bin/nu";
      theme = "paradise"; # Активация нашей темы
      show_startup_tips = false;
      default_layout = "compact";
      pane_frames = false;
      mouse_mode = true;

      session_serialization = true;
      serialize_pane_viewport = true;
      on_force_close = "detach";

      # Управление (твои бинды)
      keybinds = {
        "shared_except \"locked\"" = {
          "bind \"Ctrl a\"" = {
            NewPane = "Down";
          };
          "bind \"Ctrl s\"" = {
            NewPane = "Right";
          };
          "bind \"Ctrl h\"" = {
            MoveFocus = "Left";
          };
          "bind \"Ctrl l\"" = {
            MoveFocus = "Right";
          };
          "bind \"Ctrl j\"" = {
            MoveFocus = "Down";
          };
          "bind \"Ctrl k\"" = {
            MoveFocus = "Up";
          };
          "bind \"Alt h\"" = {
            Resize = "Increase Left";
          };
          "bind \"Alt l\"" = {
            Resize = "Increase Right";
          };
          "bind \"Alt j\"" = {
            Resize = "Increase Down";
          };
          "bind \"Alt k\"" = {
            Resize = "Increase Up";
          };
          "bind \"Ctrl t\"" = {
            NewTab = [ ];
          };
          "bind \"Alt w\"" = {
            CloseTab = [ ];
          };
          "bind \"Alt n\"" = {
            GoToNextTab = [ ];
          };
          "bind \"Alt p\"" = {
            GoToPreviousTab = [ ];
          };
        };
      };

      themes = {
        paradise = {
          fg = "#E8E3E3";
          bg = "#151515";
          black = "#1f1f1f";
          red = "#B66467";
          green = "#8C977D";
          yellow = "#D9BC8C";
          blue = "#8DA3B9";
          magenta = "#A988B0";
          cyan = "#8AA6A2";
          white = "#A0A0A0";
          orange = "#D9BC8C";
        };
      };
    };
  };
}
