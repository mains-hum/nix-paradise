{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "SemiBold";
        };
        bold = {
          family = "JetBrains Mono Nerd Font";
          style = "Bold";
        };
        size = 10.0;
      };

      terminal.shell = {
        program = "${pkgs.zellij}/bin/zellij";
        args = [
          "attach"
          "-c"
          "main"
          "options"
          "--default-shell"
          "${pkgs.nushell}/bin/nu"
        ];
      };

      window.opacity = 1;

      cursor = {
        style = {
          shape = "Block";
          blinking = "Always";
        };
      };

      colors = {
        primary = {
          background = "#242933";
          foreground = "#eceff4";
        };
        normal = {
          black = "#242933";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          magenta = "#b48ead";
          cyan = "#88c0d0";
          white = "#e5e9f0";
        };
        bright = {
          black = "#4c566a";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          magenta = "#b48ead";
          cyan = "#8fbcbb";
          white = "#eceff4";
        };
      };

      keyboard.bindings = [
        {
          key = "Plus";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }
      ];
    };
  };
}
