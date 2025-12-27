{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "${pkgs.nushell}/bin/nu";
      theme = "nord";
      show_startup_tips = false;
      default_layout = "compact";
      pane_frames = false;
      mouse_mode = true;

      session_serialization = true;
      serialize_pane_viewport = true;
      on_force_close = "detach";

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
          "bind  \"Alt p\"" = {
            GoToPreviousTab = [ ];
          };
        };
      };

      themes = {
        nord = {
          fg = "#D8DEE9";
          bg = "#2E3440";
          black = "#3B4252";
          red = "#BF616A";
          green = "#A3BE8C";
          yellow = "#EBCB8B";
          blue = "#81A1C1";
          magenta = "#B48EAD";
          cyan = "#88C0D0";
          white = "#E5E9F0";
          orange = "#D08770";
        };
      };
    };
  };
}
