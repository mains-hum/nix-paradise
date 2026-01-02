{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.waybar = {
    enable = true;

    settings = lib.mkForce {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;

        margin-top = 8;
        margin-left = 15;
        margin-right = 15;
        spacing = 0;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "pulseaudio"
          "memory"
          "hyprland/language"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{id}";
          on-click = "activate";
          all-outputs = true;
          persistent-workspaces = {
            "1" = [ ];
          };
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-ru = "RU";
          min-length = 3;
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 40;
          separate-outputs = true;
        };

        "clock" = {
          format = "{:%H:%M:%S | %d.%m.%y}";
          interval = 1;
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "memory" = {
          format = "RAM {used:0.1f}G";
          interval = 10;
        };

        "pulseaudio" = {
          format = "VOL {volume}%";
          format-muted = "MUTED";
          on-click = "pavucontrol";
        };

        "tray" = {
          icon-size = 15;
          spacing = 10;
        };
      };
    };

    style = lib.mkForce ''
      @define-color background #151515;
      @define-color foreground #E8E3E3;
      @define-color selection  #424242;
      @define-color accent     #D9BC8C;

      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 13px;
        min-height: 0;
        font-weight: bold;
      }

      window#waybar {
        background-color: rgba(21, 21, 21, 0.9);
        border-radius: 10px;
      }

      window#waybar > box {
        margin: 0;
      }

      #workspaces button {
        padding: 0 10px;
        color: rgba(232, 227, 227, 0.4); 
        margin: 4px 2px;
        border-radius: 6px;
        transition: all 0.2s ease;
      }

      #workspaces button.active {
        color: @foreground;
        background: rgba(232, 227, 227, 0.1); 
      }

      #workspaces button:hover {
        background: rgba(232, 227, 227, 0.05);
        color: @foreground;
      }

      #clock, #memory, #pulseaudio, #language, #tray, #window {
        padding: 0 12px;
        margin: 4px 2px;
        color: @foreground; 
        border-radius: 6px;
      }

      #window { 
        color: @foreground;
        font-weight: normal;
        opacity: 0.8;
      }

      #tray { 
        margin-right: 8px;
      }

      #clock:hover, #memory:hover, #pulseaudio:hover, #language:hover {
        background: rgba(232, 227, 227, 0.05);
      }
    '';
  };
}
