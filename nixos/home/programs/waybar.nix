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

        modules-left = [
          "hyprland/workspaces"
        ];
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
          format = "{:%H:%M | %d.%m.%y}";
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
      @define-color background #242933;
      @define-color foreground #eceff4;
      @define-color cyan       #88c0d0;
      @define-color purple     #b48ead;
      @define-color blue       #81a1c1;
      @define-color green      #a3be8c;
      @define-color yellow     #ebcb8b;

      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 13px;
        min-height: 0;
        font-weight: bold;
      }

      window#waybar {
        background-color: rgba(36, 41, 51, 0.9);
        border-radius: 10px;
      }

      window#waybar > box {
        margin: 0;
      }

      #workspaces button {
        padding: 0 10px;
        color: @foreground;
        margin: 4px 2px;
        border-radius: 5px;
        transition: all 0.2s ease;
        font-weight: bold;
      }

      #workspaces button.active {
        color: @cyan;
        background: rgba(136, 192, 208, 0.15);
      }

      #workspaces button:hover {
        background: rgba(136, 192, 208, 0.1);
      }

      #clock, #memory, #pulseaudio, #language, #tray, #window {
        padding: 0 12px;
        margin: 4px 2px;
        border-radius: 5px;
        font-weight: bold;
      }

      #window { 
        color: @cyan; 
      }

      #clock { 
        color: @purple; 
      }

      #language { 
        color: @blue; 
      }

      #memory { 
        color: @green; 
      }

      #pulseaudio { 
        color: @yellow; 
      }

      #tray { 
        margin-right: 5px; 
      }
    '';
  };
}
