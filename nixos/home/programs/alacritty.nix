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
          background = "#151515";
          foreground = "#E8E3E3";
        };
        normal = {
          black = "#151515";
          red = "#B66467";
          green = "#8C977D";
          yellow = "#D9BC8C";
          blue = "#8DA3B9";
          magenta = "#A988B0";
          cyan = "#8AA6A2";
          white = "#E8E3E3";
        };
        bright = {
          black = "#424242";
          red = "#CC7C7F";
          green = "#A1AB94";
          yellow = "#E2CBAB";
          blue = "#A6B8C9";
          magenta = "#BAA0C0";
          cyan = "#A3B9B7";
          white = "#FFFFFF";
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
